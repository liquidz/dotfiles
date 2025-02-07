local deck = require('deck')
local home = os.getenv("HOME")

local global_ignore_globs = { '**/node_modules/', '**/.git/', '**/.idea/', '**/.vscode' }

-- Apply pre-defined easy settings.
-- For manual configuration, refer to the code in `deck/easy.lua`.
require('deck.easy').setup()

-- Set up buffer-specific key mappings for nvim-deck.
vim.api.nvim_create_autocmd('User', {
  pattern = 'DeckStart',
  callback = function(e)
    local ctx = e.data.ctx --[[@as deck.Context]]
    ctx.keymap('n', '<Esc>', function()
      ctx.set_preview_mode(false)
    end)
    ctx.keymap('n', '<Tab>', deck.action_mapping('choose_action'))
    ctx.keymap('n', '<C-l>', deck.action_mapping('refresh'))
    ctx.keymap('n', 'i', deck.action_mapping('prompt'))
    ctx.keymap('n', 'a', deck.action_mapping('prompt'))
    --ctx.keymap('n', '@', deck.action_mapping('toggle_select'))
    --ctx.keymap('n', '*', deck.action_mapping('toggle_select_all'))
    ctx.keymap('n', 'p', deck.action_mapping('toggle_preview_mode'))
    --ctx.keymap('n', 'd', deck.action_mapping('delete'))
    ctx.keymap('n', '<CR>', deck.action_mapping('default'))
    --ctx.keymap('n', 'o', deck.action_mapping('open'))
    --ctx.keymap('n', 'O', deck.action_mapping('open_keep'))
    ctx.keymap('n', 's', deck.action_mapping('open_split'))
    ctx.keymap('n', 'v', deck.action_mapping('open_vsplit'))
    ctx.keymap('n', 'N', deck.action_mapping('create'))
    --ctx.keymap('n', '<C-u>', deck.action_mapping('scroll_preview_up'))
    --ctx.keymap('n', '<C-d>', deck.action_mapping('scroll_preview_down'))

    -- If you want to start the filter by default, call ctx.prompt() here
    ctx.prompt()
    -- Enable preview mode by default
    ctx.set_preview_mode(true)
  end
})

local function get_git_root()
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if git_root == nil or git_root == '' then
    return vim.loop.cwd()  -- Gitリポジトリでない場合、カレントディレクトリを返す
  end
  return git_root
end

local function cword()
  local reg_save = vim.fn.getreg('"')
  vim.cmd('normal! yiw')
  local result = vim.fn.getreg('"')
  vim.fn.setreg('"', reg_save)
  return result
end

local function replace_prefix(str, old_prefix, new_prefix)
  if str:sub(1, #old_prefix) == old_prefix then
    return new_prefix .. str:sub(#old_prefix + 1)
  end
  return str
end

deck.register_decorator({
  name = 'git_root_dirname',
  resolve = function(_, item)
    -- This decorator is available only if the item has a filename.
    return item.data.filename
  end,
  decorate = function(ctx, item, row)
    local dirname = replace_prefix(get_git_root(), home, '~')
    local display_text = item.display_text
    local s, e = display_text:find(dirname, 1, true)
    if s then
      return {
        -- Hide the directory part (using conceal)
        {
          row = row,
          col = s - 1,
          end_row = row,
          end_col = e + 1,
          conceal = '',
          ephemeral = true,
        },
        -- Display the directory name as a comment at the end of the line
        {
          row = row,
          col = 0,
          virt_text = { { dirname, 'Comment' } },
          virt_text_pos = 'eol'
        }
      }
    end
    return {}
  end
})

local function find_files_in_git_root()
  deck.start(require('deck.builtin.source.files')({
    root_dir = get_git_root(),
    ignore_globs = global_ignore_globs,
    decorators = { 'git_root_dirname' },
  }))
end

local function grep_in_git_root()
  deck.start(require('deck.builtin.source.grep')({
    root_dir = get_git_root(),
    pattern = cword(),
    ignore_globs = global_ignore_globs,
  }))
end

local function loclist()
  local location_list = vim.fn.getloclist(0)
  print(vim.inspect(location_list))
  --deck.start(require('deck.builtin.source.items')({
  --  items = vim.iter(vim.api.nvim_list_bufs()):map(function(buf)
  --    return ('#%s'):format(buf)
  --  end):totable()
  --}))
end

-- Example key bindings for launching nvim-deck sources. (These mapping required `deck.easy` calls.)
vim.keymap.set('n', '<C-p>', find_files_in_git_root, { noremap = true, silent = true })
vim.keymap.set('n', '<C-b>',  '<Cmd>Deck buffers<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<LocalLeader>gg', grep_in_git_root, { noremap = true, silent = true })

-- Show the latest deck context.
vim.keymap.set('n', '<Leader><Leader>', function()
  local ctx = require('deck').get_history()[1]
  if ctx then
    ctx.show()
  end
end)

-- Replace vim.ui.select
vim.ui.select = deck.ui_select
