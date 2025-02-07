local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

local function get_git_root()
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if git_root == nil or git_root == '' then
    return vim.loop.cwd()  -- Gitリポジトリでない場合、カレントディレクトリを返す
  end
  return git_root
end

local function find_files_in_git_root()
  builtin.find_files({
    cwd = get_git_root(),
    find_command = { 'git', 'ls-files', '--others', '--exclude-standard', '--cached' }
  })
end

local function cword()
  local reg_save = vim.fn.getreg('"')
  vim.cmd('normal! yiw')
  local result = vim.fn.getreg('"')
  vim.fn.setreg('"', reg_save)
  return result
end

-- setup
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<CR>"] = function()
          local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
          vim.api.nvim_feedkeys(esc, 'n', false)
        end,
        ["<C-u>"] = false,
      },
      n = {
        ["q"] = actions.close,
      },
    }
  },

  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown { }
    },

    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  },
})

local telescope = require('telescope')
telescope.load_extension("ui-select")
telescope.load_extension("fzf")
--telescope.load_extension("kensaku")

vim.keymap.set('n', '<Leader><Leader>', function()
  --builtin.resume({ initial_mode = "normal" })
  builtin.resume()
end, { desc = 'Telescope resume' })
vim.keymap.set('n', '<Leader>hh', builtin.commands )

vim.keymap.set('n', '<C-p>', find_files_in_git_root, { noremap = true, silent = true })
vim.keymap.set('n', '<C-b>', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<LocalLeader>gg', function()
  local pattern = cword()
  builtin.live_grep({ cwd = get_git_root() })
  if pattern ~= '' then
    vim.cmd("normal! i" .. pattern)
  end
end, { desc = 'Telescope live grep' })

-- vim.keymap.set('n', '/', builtin.current_buffer_fuzzy_find, { desc = 'Telescope buffer fuzzy find' })
vim.keymap.set('n', '*', function()
  local pattern = cword()
  --builtin.current_buffer_fuzzy_find({ initial_mode = "normal" })
  builtin.current_buffer_fuzzy_find()
  if pattern ~= '' then
    vim.cmd("normal! i" .. pattern)
  end
end, { desc = 'Telescope buffer fuzzy find' })

vim.keymap.set('n', '<LocalLeader>cw', builtin.quickfix )
