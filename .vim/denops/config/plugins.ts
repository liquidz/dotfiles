import type { Plugin } from "./type.ts";
import { telescopePlugins } from "./plugins/telescope.ts";
import { nvimDeckPlugins } from "./plugins/nvim_deck.ts";
import { clojurePlugins } from "./plugins/clojure.ts";
import { pluginStatus } from "./status.ts";

export const plugins: Plugin[] = [
  { url: "jparise/vim-graphql", profiles: ["default"] },
  { url: "mracos/mermaid.vim", profiles: ["default"] },
  { url: "aklt/plantuml-syntax", profiles: ["default"] },
  { url: "tpope/vim-dispatch", profiles: ["default"] },
  { url: "ConradIrwin/vim-bracketed-paste", profiles: ["default"] },
  { url: "kana/vim-operator-user", profiles: ["default"] },
  { url: "kana/vim-textobj-user", profiles: ["default"] },
  { url: "seroqn/foldmaker.vim", profiles: ["default"] },
  { url: "lambdalisue/fern.vim", profiles: ["default"] },
  { url: "thinca/vim-visualstar", profiles: ["default"] },
  { url: "tpope/vim-endwise", profiles: ["default"] },
  { url: "tpope/vim-repeat", profiles: ["default"] },
  { url: "tyru/open-browser.vim", profiles: ["default"] },
  { url: "tyru/open-browser-github.vim", profiles: ["default"] },
  { url: "liquidz/vim-file-to-file", profiles: ["default"] },
  { url: "osyo-manga/vim-anzu", profiles: ["default"] },
  { url: "kana/vim-textobj-line", profiles: ["default"] },
  { url: "lambdalisue/readablefold.vim", profiles: ["default"] },
  { url: "thinca/vim-qfreplace", profiles: ["default"] },
  { url: "vim-jp/vital.vim", profiles: ["default"] },
  //{ url: "nelstrom/vim-textobj-rubyblock", profiles: ["default"] },
  { url: "thinca/vim-prettyprint", profiles: ["default"] },
  { url: "vim-scripts/ruby-matchit", profiles: ["default"] },
  { url: "rhysd/reply.vim", profiles: ["default"] },
  { url: "rust-lang/rust.vim", profiles: ["default"] },
  { url: "ziglang/zig.vim", profiles: ["default"] },

  { url: "nvim-lua/plenary.nvim", profiles: ["neovim"] },
  { url: "kevinhwang91/nvim-bqf", profiles: ["neovim"] },
  { url: "sindrets/diffview.nvim", profiles: ["neovim"] },
  { url: "ibhagwan/fzf-lua", profiles: ["neovim"] },

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
          ensure_installed = { "clojure", "vim", "javascript", "typescript", "tsx", "lua" },
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
    profiles: ["default"],
    cache: {
      afterFile: "~/.vim/conf.d/after/vim-submode.vim",
    },
  },

  // cf. https://github.com/yukimemi/dvpm/issues/78
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
      `,
    },
  },

  {
    url: "itchyny/lightline.vim",
    profiles: ["default"],
    cache: {
      before: `
        if !has('gui_running')
          set t_Co=256
        endif

        let g:lightline = {
              \\   'colorscheme': 'iceberg',
              \\   'active': { 'left': [], 'right': [] },
              \\   'separator': { 'left': "\ue0b4", 'right': "\ue0b6"},
              \\   'subseparator': { 'left': "\ue0b5", 'right':  "\ue0b7" },
              \\   'tabline': {
              \\     'left': [[ 'tabs' ]],
              \\     'right': [['filetype', 'bufnum' ], ['anzu'], ['elin'] ]
              \\   },
              \\   'component_function': {
              \\     'anzu': 'anzu#search_status',
              \\     'elin': 'elin#status',
              \\   },
              \\ }
      `,
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
    cache: { beforeFile: "~/.vim/conf.d/before/coc.vim" },
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

  ...(pluginStatus.telescope ? telescopePlugins : []),
  ...(pluginStatus.nvimDeck ? nvimDeckPlugins : []),
  //...(fuzzyFinder === "telescope" ? telescopePlugins : []),
  ...clojurePlugins,
];
