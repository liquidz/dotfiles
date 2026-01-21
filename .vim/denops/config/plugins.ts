import type { Plugin } from "./type.ts";
import { telescopePlugins } from "./plugins/telescope.ts";
import { nvimDeckPlugins } from "./plugins/nvim_deck.ts";
import { clojurePlugins } from "./plugins/clojure.ts";
//import { codeCompanionPlugins } from "./plugins/codecompanion.ts";
import { claudeCodePlugins } from "./plugins/claude_code.ts";
import { pluginStatus } from "./status.ts";

export const plugins: Plugin[] = [
  { url: "jparise/vim-graphql", profiles: ["default"] },
  { url: "mracos/mermaid.vim", profiles: ["default"] },
  { url: "aklt/plantuml-syntax", profiles: ["default"] },
  { url: "tpope/vim-dispatch", profiles: ["default"] },
  {
    url: "ConradIrwin/vim-bracketed-paste",
    profiles: ["default"],
  },
  { url: "kana/vim-operator-user", profiles: ["default"] },
  { url: "kana/vim-textobj-user", profiles: ["default"] },
  { url: "seroqn/foldmaker.vim", profiles: ["default"] },
  { url: "lambdalisue/fern.vim", profiles: ["default"] },
  { url: "thinca/vim-visualstar", profiles: ["default"] },
  { url: "tpope/vim-endwise", profiles: ["default"] },
  { url: "tpope/vim-repeat", profiles: ["default"] },
  { url: "tyru/open-browser.vim", profiles: ["default"] },
  {
    url: "tyru/open-browser-github.vim",
    profiles: ["default"],
  },
  { url: "liquidz/vim-file-to-file", profiles: ["default"] },
  { url: "osyo-manga/vim-anzu", profiles: ["default"] },
  { url: "kana/vim-textobj-line", profiles: ["default"] },
  {
    url: "lambdalisue/readablefold.vim",
    profiles: ["default"],
  },
  { url: "thinca/vim-qfreplace", profiles: ["default"] },
  { url: "vim-jp/vital.vim", profiles: ["default"] },
  //{ url: "nelstrom/vim-textobj-rubyblock", profiles: ["default"] },
  { url: "thinca/vim-prettyprint", profiles: ["default"] },
  //{ url: "vim-scripts/ruby-matchit", profiles: ["default"] },
  { url: "rust-lang/rust.vim", profiles: ["default"] },
  { url: "ziglang/zig.vim", profiles: ["default"] },
  // { url: "Shougo/cmdline.vim", profiles: ["default"] },
  //{ url: "lambdalisue/vim-gin", profiles: ["default"] },

  //{ url: "xiyaowong/transparent.nvim", profiles: ["neovim"] },
  { url: "nvim-lua/plenary.nvim", profiles: ["neovim"] },
  { url: "kevinhwang91/nvim-bqf", profiles: ["neovim"] },
  { url: "sindrets/diffview.nvim", profiles: ["neovim"] },
  { url: "ibhagwan/fzf-lua", profiles: ["neovim"] },
  { url: "MunifTanjim/nui.nvim", profiles: ["neovim"] },
  {
    url: "rcarriga/nvim-notify",
    profiles: ["neovim"],
    cache: {
      after: `lua << EOB
        local stages_util = require('notify.stages.util')
        local fade_in_slide_out_with_margin = require("uochan.nvim_notify.fade_in_slide_out_with_margin")

        require("notify").setup({
          background_colour = "#000000",
          render = "minimal",
          animate = false,
          stages = "static",
          --stages = fade_in_slide_out_with_margin(stages_util.DIRECTION.TOP_DOWN),
          --stages = fade_in_slide_out_with_margin(stages_util.DIRECTION.BOTTOM_UP),
          top_down = false,
        })
      EOB`,
    },
  },

  {
    url: "thinca/vim-partedit",
    profiles: ["default"],
    cache: {
      before: `
        let g:partedit#prefix_pattern = '\\s*'
        let g:partedit#auto_prefix = 0
      `,
    },
  },

  {
    url: "yuki-yano/vim-operator-replace",
    profiles: ["default"],
    dependencies: ["kana/vim-operator-user"],
    cache: {
      before: `
        map <Leader>r <Plug>(operator-replace)
      `,
    },
  },

  {
    url: "nvim-treesitter/nvim-treesitter",
    profiles: ["neovim"],
    cache: {
      before: `
        let g:gcc_bin_path = '/usr/bin/gcc'
      `,
      after: `lua << EOB
        require("nvim-treesitter.install").compilers = { vim.g.gcc_bin_path }
        require('nvim-treesitter.configs').setup {
          ensure_installed = { "clojure", "scheme", "vim", "vimdoc", "javascript", "typescript", "tsx", "lua", "markdown", "markdown_inline" },
          ignore_install = { "gitcommit" },
          sync_install = false,
          auto_install = false,

          highlight = {
            enable = true,
            disable = {"clojure"},
            additional_vim_regex_highlighting = false,
          },
        }

        -- https://github.com/neovim/neovim/pull/26347#issuecomment-1837508178
        vim.treesitter.start = (function(wrapped)
          return function(bufnr, lang)
            lang = lang or vim.fn.getbufvar(bufnr or '', '&filetype')
            if lang == 'help' then
              return
            end
            wrapped(bufnr, lang)
          end
        end)(vim.treesitter.start)
      EOB`,
    },
  },
  // {
  //   url: "nvim-treesitter/playground",
  //   dependencies: ["nvim-treesitter/nvim-treesitter"],
  //
  // },
  {
    url: "nvim-treesitter/nvim-treesitter-context",
    dependencies: ["nvim-treesitter/nvim-treesitter"],
    profiles: ["neovim"],
    cache: {
      after: `lua << EOB
      require'treesitter-context'.setup{
        enable = true,
        max_lines = 1,
      }
    EOB`,
    },
  },
  {
    url: "mfussenegger/nvim-treehopper",
    dependencies: ["nvim-treesitter/nvim-treesitter"],
    profiles: ["neovim"],
    cache: {
      after: `
        omap <silent> m :<C-U>lua require('tsht').nodes()<CR>
        xnoremap <silent> m :lua require('tsht').nodes()<CR>
      `,
    },
  },

  // localrc
  { url: "thinca/vim-localrc", profiles: ["vim"] },
  {
    url: "klen/nvim-config-local",
    profiles: ["neovim"],
    cache: {
      after: `lua << EOB
        require('config-local').setup({
          config_files = { ".local.vimrc" },
          lookup_parents = true,
          silent = true,
        })
      EOB`,
    },
  },

  {
    url: "cocopon/iceberg.vim",
    profiles: ["default"],
    cache: {
      after: `
        if has('termguicolors')
          set termguicolors
        endif

        if has('nvim')
          let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
          let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        endif

        colorscheme iceberg
        highlight! link Visual DiffText
      `,
    },
  },

  {
    url: "vim-test/vim-test",
    profiles: ["default"],
    dependencies: ["tpope/vim-dispatch"],
    cache: {
      after: `
        aug MyVimTestSetting
          au!
          au FileType typescript,typescriptreact nmap <silent> <leader>tt :TestNearest<CR>
          au FileType typescript,typescriptreact nmap <silent> <leader>tb :TestFile<CR>
        aug END

        let g:test#javascript#runner = 'jest'
      `,
    },
  },

  {
    url: "kana/vim-submode",
    profiles: ["vim"],
    cache: {
      afterFile: "~/.vim/conf.d/after/vim-submode.vim",
    },
  },

  {
    url: "nvimtools/hydra.nvim",
    profiles: ["neovim"],
    cache: {
      after: `lua << EOB
        local Hydra = require("hydra")


        Hydra({
          name = "Window",
          mode = "n",
          body = "<C-w>",
          heads = {
            { "+",  "<C-w>5+" },
            { "-",  "<C-w>5-" },
            { "<",  "<C-w>5<lt>" },
            { ">",  "<C-w>5>" },
            --{ "h",  "<C-w>h", { desc = "left"  } },
            --{ "H",  "<C-w>H", { desc = "left"  } },
            --{ "j",  "<C-w>j", { desc = "down"  } },
            --{ "J",  "<C-w>J", { desc = "down"  } },
            --{ "k",  "<C-w>k", { desc = "up"    } },
            --{ "K",  "<C-w>K", { desc = "up"    } },
            --{ "l",  "<C-w>l", { desc = "right" } },
            --{ "L",  "<C-w>L", { desc = "right" } },
            { "q",  "<C-w>q", { exit = true, desc = "quit" } },
            { "<Esc>", nil, { exit = true } },
          },
        })
      EOB`,
    },
  },

  {
    url: "github/copilot.vim",
    profiles: ["default"],
    cache: {
      after: `
        let g:copilot_no_tab_map = v:true
        let g:copilot_filetypes = #{
              \\ gitcommit: v:true,
              \\ markdown: v:true,
              \\ text: v:true,
              \\ ddu-ff-filter: v:false,
              \\ }
        imap <silent><script><expr> <C-Tab> copilot#Accept("\<CR>")
      `,
    },
  },
  {
    url: "zbirenbaum/copilot.lua",
    profiles: ["never"],
    cache: {
      after: `lua << EOB
      require('copilot').setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<C-Tab>",
          },
        },
        filetypes = {
          gitcommit = true,
          markdown = true,
          text = true,
        },
      })
      EOB`,
    },
  },

  {
    url: "airblade/vim-gitgutter",
    profiles: ["vim"],
    cache: {
      before: `
        nmap gj <Plug>(GitGutterNextHunk)
        nmap gk <Plug>(GitGutterPrevHunk)

        aug MyGitGutterSetting
          au!
          au BufWritePost * GitGutter
        aug END
      `,
    },
  },

  {
    url: "easymotion/vim-easymotion",
    profiles: ["default"],
    cache: {
      before: `
        let g:EasyMotion_keys='hklyuiopnm,qwertzxcvbasdgjf'
        map e <Plug>(easymotion-prefix)
      `,
    },
  },

  {
    url: "previm/previm",
    profiles: ["default"],
    // on_ft = ['markdown', 'asciidoc']
    cache: {
      before: `
        if has('unix')
          let g:previm_open_cmd = 'env DISPLAY=:0 xdg-open'
        endif
        if has('mac')
          " set empty to use open-browser.vim
          let g:previm_open_cmd = ''
        endif
      `,
      after: `
        aug PrevimSettings
          au!
          au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
        aug END
      `,
    },
  },

  { url: "rbgrouleff/bclose.vim", profiles: ["neovim"] },
  {
    url: "iberianpig/tig-explorer.vim",
    profiles: ["default"],
    // on_cmd = ['TigGrep', 'TigOpenCurrentFile', 'TigStatus', 'TigBlame']
    cache: {
      before: `
        function! s:tig_grep() abort
          let reg_save = @@
          try
            normal! yiw
            let pattern = @@
            if empty(pattern)
              silent execute ':TigGrep'
            else
              call feedkeys(printf(':TigGrep %s', pattern), 'n')
            endif
          finally
            let @@ = reg_save
          endtry
        endfunction

        nnoremap <LocalLeader>gf <Cmd>TigOpenCurrentFile<CR>

        if ${
        (!pluginStatus.telescope && !pluginStatus.nvimDeck)
          ? "v:true"
          : "v:false"
      }
          nnoremap <silent> <LocalLeader>gg :call <SID>tig_grep()<CR>
        endif
        nnoremap <LocalLeader>gs <Cmd>TigStatus<CR>
        nnoremap <LocalLeader>gb <Cmd>TigBlame<CR>
      `,
    },
  },

  {
    url: "osyo-manga/vim-brightest",
    profiles: ["default"],
    cache: {
      before: `let g:brightest#highlight = { "group" : "BrightestUndercurl" }`,
    },
  },

  {
    url: "junegunn/vim-easy-align",
    profiles: ["default"],
    cache: {
      before: `
        vmap <Enter> <Plug>(EasyAlign)
      `,
      after: `
        let g:easy_align_delimiters = { '>': { 'pattern': '->\\|=>' } }
      `,
    },
  },

  {
    url: "t9md/vim-quickhl",
    profiles: ["default"],
    cache: {
      before: `
        nmap <LocalLeader>m <Plug>(quickhl-manual-this)
        xmap <LocalLeader>m <Plug>(quickhl-manual-this)
        nmap <LocalLeader>M <Plug>(quickhl-manual-reset)
        xmap <LocalLeader>M <Plug>(quickhl-manual-reset)

        let g:quickhl_manual_keywords = [
              \\ 'TODO', 'FIXME',
              \\ ]
      `,
    },
  },

  {
    url: "thinca/vim-quickrun",
    profiles: ["default"],
    cache: {
      beforeFile: "~/.vim/conf.d/before/vim-quickrun.vim",
    },
  },
  { url: "powerman/vim-plugin-AnsiEsc", profiles: ["default"] },

  {
    url: "tyru/caw.vim",
    profiles: ["default"],
    cache: {
      before: `
        nmap <LocalLeader>c <Plug>(caw:prefix)
        xmap <LocalLeader>c <Plug>(caw:prefix)

        aug MyCawSetting
          au!
          au FileType clojure let b:caw_oneline_comment = ';;'
        aug END
      `,
    },
  },

  {
    url: "NeogitOrg/neogit",
    profiles: ["neovim"],
    dependencies: [
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    ],
    cache: {
      after: `lua << EOB
        require('neogit').setup {}
      EOB`,
    },
  },

  {
    url: "nvim-tree/nvim-web-devicons",
    profiles: ["neovim"],
    cache: {
      after: `lua << EOB
      require('nvim-web-devicons').setup()
    EOB`,
    },
  },

  {
    url: "tani/dmacro.vim",
    profiles: ["neovim"],
    cache: {
      after: `lua << EOB
        vim.keymap.set({ "i", "n" }, '<C-q>', '<Plug>(dmacro-play-macro)')
      EOB`,
    },
  },

  {
    url: "lewis6991/gitsigns.nvim",
    profiles: ["neovim"],
    cache: {
      after: `lua << EOB
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map('n', 'gj', function()
            if vim.wo.diff then return 'gj' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr = true})

          map('n', 'gk', function()
            if vim.wo.diff then return 'gk' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr = true})

          map('v', '<LocalLeader>gc', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
          map('n', '<LocalLeader>gu', gs.undo_stage_hunk)
          map('n', '<LocalLeader>gp', gs.preview_hunk)
        end
      }
    EOB`,
    },
  },

  {
    url: "neoclide/coc.nvim",
    rev: "release",
    profiles: ["default"],
    cache: {
      beforeFile: "~/.vim/conf.d/before/coc.vim",
    },
  },

  {
    url: "stevearc/oil.nvim",
    profiles: ["neovim"],
    cache: {
      after: `lua << EOB
        require('oil').setup({
          columns = {
            "icon",
            -- "size",
            "mtime",
          },
          keymaps = {
            ["<C-h>"] = "actions.parent",
          },
          view_options = {
            show_hidden = true,
          },
        })
      EOB`,
    },
  },

  {
    url: "tyru/columnskip.vim",
    profiles: ["default"],
    cache: {
      before: `
        nmap cj <Plug>(columnskip-j)
        nmap ck <Plug>(columnskip-k)
      `,
    },
  },

  {
    url: "inside/vim-search-pulse",
    profiles: ["default"],
    cache: {
      before: `
        let g:vim_search_pulse_mode = 'cursor_line'
        let g:vim_search_pulse_disable_auto_mappings = 1

        nmap n <Plug>(anzu-n)<Plug>Pulse
        nmap N <Plug>(anzu-N)<Plug>Pulse
        nmap * <Plug>(anzu-star)<Plug>Pulse
        nmap # <Plug>(anzu-sharp)<Plug>Pulse
      `,
    },
  },

  {
    url: "jiangmiao/auto-pairs",
    profiles: ["default"],
    cache: {
      before: `
        aug AutoPairFileType
          au Filetype clojure let b:AutoPairs = {'"': '"', '\`\`\`': '\`\`\`' }
        aug END
      `,
    },
  },

  {
    url: "luochen1990/rainbow",
    profiles: ["default"],
    cache: {
      before: `
        let g:rainbow_active = 1
        let g:rainbow_conf = {
          \\ 'ctermfgs': ['darkmagenta', 'red', 'darkcyan', 'brown', 'darkgreen', 'darkred'],
          \\ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\\[/ end=/\\]/ fold', 'start=/{/ end=/}/ fold'],
          \\ 'separately': {'*': 0, 'clojure': {}}
          \\ }
      `,
    },
  },

  {
    url: "machakann/vim-sandwich",
    profiles: ["default"],
    cache: {
      after: `
        let g:textobj_sandwich_no_default_key_mappings = 1
        omap ii <Plug>(textobj-sandwich-auto-i)
        xmap ii <Plug>(textobj-sandwich-auto-i)
        omap aa <Plug>(textobj-sandwich-auto-a)
        xmap aa <Plug>(textobj-sandwich-auto-a)
      `,
    },
  },

  {
    url: "mattn/vim-sonictemplate",
    profiles: ["default"],
    cache: {
      before: `
        let g:sonictemplate_vim_template_dir = '$HOME/.vim/template'
      `,
      afterFile: "~/.vim/conf.d/after/vim-sonictemplate.vim",
    },
  },

  //   {url: 'machakann/vim-sandwich',
  //   cache: {}},
  // on_my_timer = 'on'
  // hook_source = '''
  //   let g:textobj_sandwich_no_default_key_mappings = 1
  //   omap ii <Plug>(textobj-sandwich-auto-i)
  //   xmap ii <Plug>(textobj-sandwich-auto-i)
  //   omap aa <Plug>(textobj-sandwich-auto-a)
  //   xmap aa <Plug>(textobj-sandwich-auto-a)
  // '''

  {
    url: "junegunn/fzf",
    profiles: ["vim"],
  },
  {
    url: "junegunn/fzf.vim",
    dependencies: ["junegunn/fzf"],
    profiles: ["vim"],
    cache: {
      before: `
        let g:elin#internal#select#selector = 'fzf'

        function! s:find_git_root()
          return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
        endfunction

        command! FzfProjectFiles execute 'Files' s:find_git_root()

        nnoremap <C-p> <Cmd>FzfProjectFiles<CR>
        nnoremap <C-b> <Cmd>Buffers<CR>
        nnoremap <Leader>fb <Cmd>Buffers<CR>
        nnoremap <Leader>fl <Cmd>Lines<CR>
        nnoremap <Leader>hh <Cmd>Commands<CR>
        nmap <buffer> <Nop>(disable_command_palette) <Plug>(iced_command_palette)
        nnoremap <Leader><Leader> <Cmd>History<CR>
      `,
    },
  },

  {
    url: "rickhowe/diffchar.vim",
    profiles: ["default"],
  },

  {
    url: "rickhowe/spotdiff.vim",
    dependencies: ["rickhowe/diffchar.vim"],
    profiles: ["default"],
    cache: {
      before: `
        vmap <silent> <LocalLeader>d <Plug>(VDiffthis)
        nmap <silent> <LocalLeader>D <Plug>(VDiffoff!)
      `,
    },
  },

  /*
  {
    url: "nekowasabi/hellshake-yano.vim",
    profiles: ["default"],
    cache: {
      before: `
      let g:hellshake_yano = {
        \\   'useJapanese': v:false,
        \\   'useNumericMultiCharHints': v:false,
        \\   'defaultMinWordLength': 3,
        \\   'perKeyMinLength': {
        \\     'v': 1,
        \\     'V': 1,
        \\     'w': 1,
        \\     'b': 1,
        \\     'h': 2,
        \\     'j': 2,
        \\     'k': 2,
        \\     'l': 2,
        \\     'f': 3,
        \\     'F': 3,
        \\   },
        \\   'singleCharKeys': 'ASDFGNM',
        \\   'multiCharKeys': 'BCEIOPRTUVWY',
        \\   'highlightHintMarker': 'Search',
        \\   'highlightHintMarkerCurrent': 'IncSearch',
        \\   'maxHints': 50,
        \\   'cacheSize': 3000,
        \\   'debounceDelay': 30,
        \\   'suppressOnKeyRepeat': v:true,
        \\   'keyRepeatThreshold': 80,
        \\   'enableDebug': v:false,
        \\ }
      `,
    },
  },
  */

  // Vimade let's you dim, fade, tint, animate, and customize colors in your windows and buffers for (Neo)vim
  {
    url: "TaDaa/vimade",
    profiles: ["neovim"],
    cache: {
      after: `lua << EOB
        require('vimade').setup({
          recipe = {'default', {animate = false}},
          fadelevel = 0.5,
        })
      EOB`,
    },
  },

  {
    url: "b0o/incline.nvim",
    profiles: ["neovim"],
    dependencies: ["neoclide/coc.nvim"],
    cache: {
      after: `lua << EOB
      local devicons = require 'nvim-web-devicons'

      require('incline').setup({
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if filename == '' then
            filename = '[No Name]'
          end
          local ft = vim.api.nvim_get_option_value("filetype", { buf = props.buf })

          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local function get_diagnostic_label()
            local icons = { error = '', warn = '', info = '', hint = '' }
            local label = {}

            for severity, icon in pairs(icons) do
              local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
              if n > 0 then
                table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
              end
            end
            if #label > 0 then
              table.insert(label, { '┊ ' })
            end
            return label
          end

          local function get_coc_diagnostic_label()
            local icons = { error = '', warn = '', info = '', hint = '' }
            local label = {}

            -- 現在のバッファの診断情報を取得
            local bufnr = vim.api.nvim_get_current_buf()
            -- vim.fn['coc#rpc#ready']() == 1
            --結果 = 条件式 and 真のときの値 or 偽のときの値
            --local diagnostics = vim.fn.CocAction('diagnosticList')
            local is_coc_initialized = (vim.g.coc_service_initialized or 0) == 1
            local diagnostics = is_coc_initialized and vim.fn.CocAction('diagnosticList') or {}


            -- 重要度別にカウント（現在のバッファのみ）
            local counts = { error = 0, warn = 0, info = 0, hint = 0 }

            for _, diagnostic in ipairs(diagnostics) do
              -- 現在のバッファの診断情報のみをカウント
              if diagnostic.bufnr == bufnr then
                local severity = diagnostic.severity:lower()
                if severity == 'warning' then
                  severity = 'warn'
                elseif severity == 'information' then
                  severity = 'info'
                elseif severity == 'error' then
                  severity = 'error'
                end

                if counts[severity] then
                  counts[severity] = counts[severity] + 1
                end
              end
            end

            -- ラベルを構築
            for severity, icon in pairs(icons) do
              if counts[severity] > 0 then
                table.insert(label, { icon .. ' ' .. counts[severity] .. ' ', group = 'DiagnosticSign' .. severity })
              end
            end

            if #label > 0 then
              table.insert(label, { '┊ ' })
            end

            return label
          end

          local function get_icon()
            if ft == 'clojure' then
              local status = vim.fn['elin#status']()
              if status == '' then
                return ft_icon or ''
              end
              return status
            end
            return ft_icon or ''
          end

          return {
            { get_coc_diagnostic_label() },
            { get_icon() .. ' ', guifg = ft_color, guibg = 'none' },
            { filename .. ' ', gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold' },
          }

        end,
      })
      EOB`,
    },
  },

  {
    url: "folke/noice.nvim",
    profiles: ["neovim"],
    dependencies: ["MunifTanjim/nui.nvim", "rcarriga/nvim-notify"],
    cache: {
      after: `lua << EOB
        require("noice").setup({
          routes = {
            {
              filter = {
                event = "msg_show",
                kind = "",
                find = "written",
              },
              opts = { skip = true },
            },
            {
              filter = {
                event = "msg_show",
                kind = "search_count",
              },
              opts = { skip = true },
            },
          },
          cmdline = {
            view = "cmdline",
          },
          commands = {
            history = {
              view = "split",
              opts = { enter = true, format = "details" },
              filter = {
                any = {
                  { event = "notify" },
                  { event = "msg_show" }, -- echo系メッセージ
                },
              },
            },
          },
        })
      EOB`,
    },
  },

  //{
  //  url: "rmagatti/auto-session",
  //  profiles: ["neovim"],
  //  cache: {
  //    after: `lua << EOB
  //      require("auto-session").setup({})
  //    EOB`,
  //  },
  //},

  ...(pluginStatus.telescope ? telescopePlugins : []),
  ...(pluginStatus.nvimDeck ? nvimDeckPlugins : []),
  //...(fuzzyFinder === "telescope" ? telescopePlugins : []),
  ...clojurePlugins,
  //...codeCompanionPlugins,
  ...claudeCodePlugins,
];
