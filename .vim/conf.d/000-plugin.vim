scriptencoding utf-8
let g:dotfiles = $HOME.'/src/github.com/liquidz/dotfiles'

let g:denops_dev = v:false
let g:use_ddu = v:true
let g:use_ddc = v:false
let g:use_cmp = v:false
let g:use_vim_diced = v:false

function! s:has_plug(name) abort
  return exists('g:plugs') && !empty(get(g:plugs, a:name))
endfunction

call plug#begin('~/.vim/repos')

" default {{{

" Plug 'TimUntersberger/neogit'


" Deno/Denops
Plug 'vim-denops/denops.vim'
"Plug '~/src/github.com/vim-denops/denops-helloworld.vim'
"Plug '~/src/github.com/liquidz/denops-helloworld.vim'
"Plug '~/src/github.com/liquidz/dps-paredit'
"Plug '~/src/github.com/liquidz/dps-parinfer'

Plug 'yuki-yano/fuzzy-motion.vim'
" gin と tig-explorer を両方有効にすると tig-explorer でのコミット時に
" コミットメッセージ入力画面が別タブに移動してしまってコミット後に元のタブに戻れなくなる
" Plug 'lambdalisue/gin.vim'

Plug 'jparise/vim-graphql'
"Plug 'ctrlpvim/ctrlp.vim'

if g:use_ddu
  Plug 'Shougo/ddu.vim'
  " Install your UIs
  Plug 'Shougo/ddu-ui-ff'
  Plug 'Shougo/ddu-ui-filer'
  " Install your sources
  Plug 'Shougo/ddu-source-action'
  Plug 'Shougo/ddu-source-file'
  Plug 'Shougo/ddu-source-file_rec'
  Plug 'Shougo/ddu-source-line'
  Plug 'shun/ddu-source-buffer'
  Plug 'Shougo/ddu-source-file_old'
  Plug 'Shougo/ddu-source-register'
  Plug '4513ECHO/ddu-source-source'
  Plug 'matsui54/ddu-source-file_external'
  Plug '~/src/github.com/liquidz/ddu-source-custom-list'
  Plug 'shun/ddu-source-rg'
  Plug 'kamecha/ddu-source-window'

  Plug 'lambdalisue/mr.vim' | Plug 'kuuote/ddu-source-mr'
  "Plug 'kuuote/ddu-source-git_diff'

  " Install your filters
  Plug 'yuki-yano/ddu-filter-fzf'
  Plug 'Shougo/ddu-filter-matcher_substring'
  Plug 'Shougo/ddu-filter-matcher_hidden'
  Plug 'lambdalisue/kensaku.vim' | Plug 'Milly/ddu-filter-kensaku'
  " Install your kinds
  Plug 'Shougo/ddu-kind-file'
  Plug 'Shougo/ddu-kind-word'
  Plug 'Shougo/ddu-commands.vim'

  " ddu-ui-filer
  Plug 'Shougo/ddu-column-filename'
endif

Plug 'mracos/mermaid.vim'
Plug 'aklt/plantuml-syntax', {'on': []}
"Plug '~/src/github.com/liquidz/plantuml-syntax', {'on': []}
"Plug 'ayu-theme/ayu-vim'
Plug 'cocopon/iceberg.vim'
"Plug 'navarasu/onedark.nvim'

Plug 'tpope/vim-dispatch'
Plug 'vim-test/vim-test'

"Plug 'colepeters/spacemacs-theme.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'easymotion/vim-easymotion', {'on': '<Plug>(easymotion-prefix)'}
"Plug 'haya14busa/vim-metarepeat'
"Plug 'hrsh7th/vim-eft'
Plug 'iberianpig/tig-explorer.vim'
if has('nvim')
  " required by tig-explorer with nvim
  Plug 'rbgrouleff/bclose.vim'
endif
Plug 'inside/vim-search-pulse', {'on': []}
Plug 'jiangmiao/auto-pairs', {'on': []}
Plug 'junegunn/fzf', { 'on': [], 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', {'on': ['Files']}
Plug 'junegunn/vim-easy-align', {'on': '<Plug>(EasyAlign)'}
Plug 'kana/vim-operator-user'
Plug 'kana/vim-submode'
Plug 'kana/vim-textobj-line', {'on': []}
Plug 'kana/vim-textobj-user'
"Plug 'kshenoy/vim-signature', {'on': []}

Plug 'lambdalisue/fern.vim', {'on': 'Fern', 'for': 'clojure'}
    \ | Plug 'lambdalisue/fern-hijack.vim', {'on': 'Fern'}
Plug 'lambdalisue/readablefold.vim', {'on': []}
" Plug 'LeafCage/yankround.vim', {'on': []}
"Plug 'liuchengxu/vim-which-key'
Plug 'luochen1990/rainbow', {'on': []}
Plug 'machakann/vim-sandwich', {'on': []}
Plug 'mattn/vim-sonictemplate', {'on': []}
Plug 'osyo-manga/vim-anzu', {'on': []}
Plug 'osyo-manga/vim-brightest', {'on': []}
Plug 'powerman/vim-plugin-AnsiEsc', {'for': 'quickrun'}
Plug 'previm/previm', {'on': 'PrevimOpen', 'for': ['markdown', 'asciidoc']}
Plug 'skanehira/translate.vim', {'on': ['<Plug>(VTranslate)', '<Plug>(VTranslateBang)']}
Plug 't9md/vim-quickhl', {'on': []}
Plug 'thinca/vim-localrc'
Plug 'thinca/vim-qfreplace', {'on': 'Qfreplace'}
"Plug 'thinca/vim-quickrun', {'on': '<Plug>(quickrun)'}
Plug 'thinca/vim-quickrun', {'on': []}
Plug 'thinca/vim-visualstar', {'on': []}
Plug 'tpope/vim-endwise', {'on': []}
"Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat', {'on': []}
Plug 'tyru/caw.vim', {'on': '<Plug>(caw:prefix)'}
Plug 'tyru/columnskip.vim', {'on': ['<Plug>(columnskip-j)', '<Plug>(columnskip-k)']}
Plug 'tyru/open-browser.vim', {'on': []}
Plug 'vim-jp/vital.vim', {'for': ['vim', 'asciidoc']}
Plug 'yuki-yano/vim-operator-replace', {'on': []}
Plug 'liquidz/vim-file-to-file', {'on': []}
Plug 'seroqn/foldmaker.vim'
Plug 'github/copilot.vim'

if !has('nvim')
  Plug 'itchyny/lightline.vim'
  Plug 'airblade/vim-gitgutter'
else
  Plug 'nvim-lua/plenary.nvim'
  " Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'
  Plug 'nvim-treesitter/nvim-treesitter-context'
  Plug 'mfussenegger/nvim-treehopper'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'gen740/SmoothCursor.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'nvim-tree/nvim-web-devicons'
  "Plug 'romgrk/barbar.nvim'
  Plug 'nanozuki/tabby.nvim'

  " Nvim LSP client
  if g:use_ddc || g:use_cmp
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'jose-elias-alvarez/null-ls.nvim'
  endif
endif

" /default }}}
" filetype {{{

Plug 'nelstrom/vim-textobj-rubyblock', {'for': 'ruby'}
Plug 'thinca/vim-prettyprint',         {'for': 'vim'}
Plug 'vim-scripts/ruby-matchit',       {'for': 'ruby'}

if has('unix')


  "" Common Lisp
  Plug 'l04m33/vlime',            {'for': 'lisp', 'rtp': 'vim'}

  "" Rust
  Plug 'rust-lang/rust.vim',      {'for': 'rust'}

  "" Lua
  Plug 'rhysd/reply.vim', {'for': ['lua', 'typescript']}

  Plug 'ziglang/zig.vim', {'for': 'zig'}

  Plug 'cohama/lexima.vim', {'for': ['zig']}

  "" Clojure {{{
  Plug 'guns/vim-sexp',           {'for': ['lisp', 'clojure']}
  Plug 'eraserhd/parinfer-rust',  {'for': 'clojure', 'do': 'bash build.sh'}
  "Plug '~/src/github.com/liquidz/dps-parinfer', {'for': ['lisp', 'clojure']}
  "Plug 'liquidz/paredit',         {'for': ['lisp', 'clojure']}
  if g:use_vim_diced
    Plug '~/src/github.com/liquidz/vim-diced',              {'for': 'clojure'}
  else
    " FIXME
    Plug '~/src/github.com/liquidz/vim-riced'

    Plug '~/src/github.com/liquidz/vim-iced',               {'for': 'clojure'}
    if ! has('nvim')
      Plug '~/src/github.com/liquidz/vim-iced-fern-debugger', {'for': 'clojure'}
    endif
    Plug '~/src/github.com/liquidz/vim-iced-function-list', {'for': 'clojure'}
    Plug '~/src/github.com/liquidz/vim-iced-kaocha',        {'for': 'clojure'}
    Plug '~/src/github.com/liquidz/vim-iced-multi-session', {'for': 'clojure'}
    Plug '~/src/github.com/liquidz/vim-iced-neil',          {'for': 'clojure'}
    Plug '~/src/github.com/liquidz/vim-clojuredocs-help',   {'for': 'clojure'}
    if g:use_ddu
      "Plug '~/src/github.com/liquidz/vim-iced-ddu-selector',  {'for': 'clojure'}
      Plug '~/src/github.com/liquidz/vim-iced-ddu-selector'
    endif
  endif

  if g:use_ddc
    Plug 'Shougo/ddc.vim'
    Plug 'Shougo/pum.vim'
    Plug 'matsui54/denops-popup-preview.vim'
    " UI
    Plug 'Shougo/ddc-ui-native'
    Plug 'Shougo/ddc-ui-pum'
    Plug 'Shougo/ddc-ui-inline'
    Plug 'Shougo/ddc-ui-none'
    " Source
    Plug 'Shougo/ddc-source-around'
    Plug 'LumaKernel/ddc-source-file'
    Plug 'Shougo/ddc-source-copilot'
    Plug 'Shougo/ddc-source-nvim-lsp'
    Plug 'Shougo/ddc-source-omni'
    Plug '~/src/github.com/liquidz/vim-iced-ddc-source', {'for': 'clojure'}
    " Matcher
    Plug 'Shougo/ddc-filter-matcher_head'
    Plug 'Shougo/ddc-filter-matcher_length'
    " Filter
    Plug 'tani/ddc-fuzzy'
    Plug 'Shougo/ddc-filter-sorter_rank'
  elseif g:use_cmp
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'lamp/cmp-iced', {'for': 'clojure'}
    Plug 'hrsh7th/nvim-cmp'
  else
    Plug 'neoclide/coc.nvim', {'on': [], 'for': 'clojure', 'branch': 'release'}
    Plug '~/src/github.com/liquidz/vim-iced-coc-source', {'on': [], 'for': 'clojure'}
  endif

  " if g:use_vim_diced
  " else
  "   Plug '~/src/github.com/liquidz/vim-iced-coc-source', {'on': [], 'for': 'clojure'}
  " endif
    " Plug '~/src/github.com/liquidz/vim-diced-coc-source', {'for': 'clojure'}
  " }}}
endif

" /filetype }}}

call plug#end()

if s:has_plug('denops.vim') " {{{
  if ! executable('deno')
    let g:denops#deno = printf('%s/.deno/bin/deno', $HOME)
  endif

  if g:denops_dev
    call denops#plugin#check_type()
  else
    let g:denops_server_addr = '127.0.0.1:32123'
  endif

  if s:has_plug('vim-search-pulse')
    nmap n <Plug>(anzu-n)<Plug>Pulse
    nmap N <Plug>(anzu-N)<Plug>Pulse
    nmap * <Plug>(anzu-star)<Plug>Pulse
    nmap # <Plug>(anzu-sharp)<Plug>Pulse
  else
    nmap n <Plug>(anzu-mode-n)
    nmap N <Plug>(anzu-mode-N)
    nmap * <Plug>(anzu-star)
    nmap # <Plug>(anzu-sharp)
  endif
endif " }}}

if s:has_plug('nvim-treesitter') " {{{
lua <<EOC
  require'nvim-treesitter.configs'.setup {
    ensure_installed = { "clojure", "vim", "help", "javascript", "typescript", "tsx" },
    ignore_install = { "gitcommit" },
    sync_install = false,
    auto_install = false,

    highlight = {
      enable = false,
      disable = {},
      additional_vim_regex_highlighting = false,
    },
  }
EOC
endif " }}}
"
" if s:has_plug('nvim-treesitter-context')
" lua <<EOC
"   require'treesitter-context'.setup{
"     enable = true,
"   }
" EOC
" endif

if s:has_plug('nvim-treehopper')
  omap <silent> m :<C-U>lua require('tsht').nodes()<CR>
  xnoremap <silent> m :lua require('tsht').nodes()<CR>
endif

if s:has_plug('vim-anzu') " {{{
  if s:has_plug('vim-search-pulse')
    nmap n <Plug>(anzu-n)<Plug>Pulse
    nmap N <Plug>(anzu-N)<Plug>Pulse
    nmap * <Plug>(anzu-star)<Plug>Pulse
    nmap # <Plug>(anzu-sharp)<Plug>Pulse
  else
    nmap n <Plug>(anzu-mode-n)
    nmap N <Plug>(anzu-mode-N)
    nmap * <Plug>(anzu-star)
    nmap # <Plug>(anzu-sharp)
  endif
endif " }}}

if s:has_plug('auto-pairs') " {{{
  aug AutoPairFileType
    au Filetype clojure let b:AutoPairs = {'"':'"'}
  aug END
endif " }}}

if s:has_plug('ayu-vim') " {{{
  " Important!!
  if has('termguicolors')
    set termguicolors
  endif

  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  "let ayucolor="dark"   " for dark version of theme
  let ayucolor="mirage" " for mirage version of theme

  colorscheme ayu
endif " }}}

if s:has_plug('iceberg.vim') " {{{
  " Important!!
  if has('termguicolors')
    set termguicolors
  endif

  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  colorscheme iceberg

  if has('nvim')
    highlight! link FloatBorder Conceal

    highlight! link StatusLine SpecialKey
    highlight! link StatusLineNC Whitespace
    highlight! link WinSeparator Whitespace

    " highlight! link StatusLine Directory
    " highlight! link StatusLineNC Conceal
    " highlight! link WinSeparator Conceal
  endif
endif " }}}

if s:has_plug('spacemacs-theme.vim') " {{{
  " Important!!
  if has('termguicolors')
    set termguicolors
  endif

  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

	set background=dark
	colorscheme spacemacs-theme
endif " }}}

if s:has_plug('vim-brightest') " {{{
  let g:brightest#highlight = {
        \ "group" : "BrightestUndercurl"
        \ }
endif " }}}

if s:has_plug('caw.vim') " {{{
  nmap <LocalLeader>g <Plug>(caw:prefix)
  xmap <LocalLeader>g <Plug>(caw:prefix)

  aug MyCawSetting
    au!
    au FileType clojure let b:caw_oneline_comment = ';;'
  aug END
endif " }}}

if s:has_plug('coc.nvim') " {{{
  if ! executable('node')
    let g:coc_node_path = '/usr/local/bin/node'
  endif

  let g:coc_global_extensions = [
       \ 'coc-copilot',
       \ 'coc-deno',
       \ 'coc-diagnostic',
       \ 'coc-eslint',
       \ 'coc-lines',
       \ 'coc-prettier',
       \ 'coc-tsdetect',
       \ 'coc-tsserver',
       \ ]
  " coc-tsserver と一緒に入っていると ts プロジェクトにて
  " tsserver を無効にする .vim/coc-settings.json がプロジェクトルートに作成さ
  " れてしまうので一旦 uninstall

  function! s:coc_check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
  endfunction

  iunmap <expr><tab>
  inoremap <silent><expr> <TAB> coc#pum#visible()
    \ ? coc#pum#next(1)
    \ : <SID>coc_check_back_space()
    \   ? "\<Tab>"
    \   : coc#refresh()

  inoremap <expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  nmap <silent> <LocalLeader>cc  <plug>(coc-codeaction-selected)iw

  nmap <silent> <LocalLeader>cr  <Cmd>call CocAction('rename')<CR>
  nmap <silent> <LocalLeader>cd  <Cmd>call CocAction('jumpDefinition')<CR>
  nmap <silent> <LocalLeader>cf  <Cmd>call CocAction('jumpReferences')<CR>
  nmap <silent> <LocalLeader>cic <Cmd>call CocAction('showIncomingCalls')<CR>
  "nmap <silent> gd                    <Plug>(coc-definition)

  command! LspRenameSymbol :call CocActionAsync('rename')
  "command! LspRenameSymbol :call CocAction('rename')

  aug MyCocSetting
    au!
    au FileType typescript,typescriptreact,css nnoremap <buffer> K :call CocActionAsync('doHover')<CR>
  aug END

  " highlight MyCocInlayHint ctermfg=5 guifg=#5c3c3c guibg=#211414
  "highlight MyCocInlayHint ctermfg=5 guifg=#5c3c3c
  "highlight MyCocInlayHint ctermfg=5 guifg=#3b4f3d
  highlight MyCocInlayHint ctermfg=5 guifg=#3b474f
  hi link CocInlayHint MyCocInlayHint
"   CocInlayHint   xxx ctermfg=242 ctermbg=235 guifg=#6b7089 guibg=#1e2132
" CocInlayHintParameter xxx links to CocInlayHint
" CocInlayHintType xxx links to CocInlayHint
endif " }}}

if s:has_plug('columnskip.vim') " {{{
  nmap cj <Plug>(columnskip-j)
  nmap ck <Plug>(columnskip-k)
endif " }}}

if s:has_plug('ctrlp.vim') " {{{
  let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
  let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
  let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く
  let g:ctrlp_show_hidden         = 1   " 隠しファイルも表示
  let g:ctrlp_match_window        = 'results:50'
  let g:ctrlp_follow_symlinks     = 1
  let g:ctrlp_lazy_update         = 100
"  let g:ctrlp_match_func          = {'match': 'ctrlp_matchfuzzy#matcher'}
  let g:ctrlp_custom_ignore = {
        \   'dir' : '\v[\/](\.git|cookbooks|target|Vendor|cache|node_modules|\.cache|\.cpcache|\.shadow-cljs|\.next)$',
        \   'file': '\v\.(o|bk|org|exe|so|dll|skl|cgi|gitkeep|png|gif|jpg)$',
        \   'link': 'some_bad_symbolic_links',
        \ }
  let g:ctrlp_prompt_mappings = {
        \ 'PrtCurLeft()'   : ['<c-b>', '<left>'],
        \ 'PrtCurRight()'  : ['<c-f>', '<right>'],
        \ 'PrtClearCache()': ['<c-l>'],
        \ }

  nnoremap <LocalLeader>pb  :CtrlPBuffer<CR>
  nnoremap <LocalLeader>pq  :CtrlPBuffer<CR>
  nnoremap <LocalLeader>pcc :CtrlPClearCache<CR>


  " function! s:fixme() abort
  "   echom 'kiteru'
  " endfunction

  " aug MyCtrlPSetting
  "   au!
  "   "au BufEnter ControlP highlight CursorLine guibg=Blue
  "   "au BufEnter ControlP call s:fixme()
  "   au WinEnter * call s:fixme()
  "
  " aug END

endif " }}}

if s:has_plug('vim-eft') " {{{
  nmap f <Plug>(eft-f-repeatable)
  xmap f <Plug>(eft-f-repeatable)
  omap f <Plug>(eft-f-repeatable)
  nmap F <Plug>(eft-F-repeatable)
  xmap F <Plug>(eft-F-repeatable)
  omap F <Plug>(eft-F-repeatable)

  nmap t <Plug>(eft-t-repeatable)
  xmap t <Plug>(eft-t-repeatable)
  omap t <Plug>(eft-t-repeatable)
  nmap T <Plug>(eft-T-repeatable)
  xmap T <Plug>(eft-T-repeatable)
  omap T <Plug>(eft-T-repeatable)
endif " }}}

if s:has_plug('fern.vim') " {{{
  " nnoremap <LocalLeader><LocalLeader> <Cmd>Fern %:h<CR>

  aug MyFernFileSetting
    au!
    " lambdalisue/fern-bookmark.vim
    au FileType fern nmap <buffer><nowait> b :<C-u>Fern bookmark:///<CR>
  aug END
endif " }}}

if s:has_plug('fzf.vim') " {{{
  function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
  endfunction

  command! FzfProjectFiles execute 'Files' s:find_git_root()

  if ! g:use_ddu
    nnoremap <C-p> :<C-u>FzfProjectFiles<CR>
  endif
  nnoremap <C-b> :<C-u>Buffers<CR>
endif " }}}

if s:has_plug('lightline.vim') " {{{
  if s:has_plug('ayu-vim')
    let s:colorscheme = 'ayu'
  elseif s:has_plug('iceberg.vim')
    let s:colorscheme = 'iceberg'
  else
    let s:colorscheme = 'iceberg'
  endif

  if !has('gui_running')
    set t_Co=256
  endif

  function! MyCocStatus() abort
    return get(g:, 'coc_status', '')
  endfunction

  " let g:lightline = {
  "      \ 'colorscheme': s:colorscheme,
  "      \ 'active': {
  "        \   'left': [['mode', 'readonly'],
  "        \            ['paste', 'modified']],
  "        \   'right': [['lineinfo'], ['fileformat', 'filetype'], ['anzu'], ['coc_status'], ['iced_multi_session'], ['iced']]
  "        \ },
  "        \ 'component_function': {
  "          \   'anzu': 'anzu#search_status',
  "          \   'iced': 'iced#repl#status',
  "          \   'iced_multi_session': 'iced_multi_session#current',
  "          \   'coc_status': 'MyCocStatus',
  "          \ },
  "          \ 'separator': { 'left': "\ue0b4", 'right': "\ue0b6"},
  "          \ 'subseparator': { 'left': "\ue0b5", 'right':  "\ue0b7" },
  "          \ 'tabline': { 'left': [[ 'tabs' ]], 'right': [[ 'bufnum' ]] }
  "          \ }

  let g:lightline = {
        \   'colorscheme': s:colorscheme,
        \   'active': { 'left': [], 'right': [] },
        \   'separator': { 'left': "\ue0b4", 'right': "\ue0b6"},
        \   'subseparator': { 'left': "\ue0b5", 'right':  "\ue0b7" },
        \   'tabline': {
        \     'left': [[ 'tabs' ]],
        \     'right': [['filetype', 'bufnum' ], ['anzu'], ['iced']]
        \   },
        \   'component_function': {
        \     'anzu': 'anzu#search_status',
        \     'iced': 'iced#repl#status',
        \     'iced_multi_session': 'iced_multi_session#current',
        \     'coc_status': 'MyCocStatus',
        \   },
        \ }
endif " }}}

if s:has_plug('vim-gitgutter')
  nmap gj <Plug>(GitGutterNextHunk)
  nmap gk <Plug>(GitGutterPrevHunk)

  aug MyGitGutterSetting
    au!
    au BufWritePost * GitGutter
  aug END
endif

if s:has_plug('vim-operator-replace') " {{{
  map <Leader>r <Plug>(operator-replace)
endif " }}}

if s:has_plug('vim-quickhl') " {{{
  nmap <LocalLeader>m <Plug>(quickhl-manual-this)
  xmap <LocalLeader>m <Plug>(quickhl-manual-this)
  nmap <LocalLeader>M <Plug>(quickhl-manual-reset)
  xmap <LocalLeader>M <Plug>(quickhl-manual-reset)

  let g:quickhl_manual_keywords = [
        \ 'TODO', 'FIXME',
        \ ]
endif " }}}

if s:has_plug('vim-quickrun') " {{{
  nmap <LocalLeader>r <Plug>(quickrun)

  " 結果を縦分割で表示
  let b:quickrun_config = {'_': {'split': 'vertical'}}
  " 横分割時は下､ 縦分割時は右へ新しいウィンドウを開く
  set splitbelow
  set splitright

  let g:quickrun_config = {
        \   '_': {
        \     'runner/vimproc/updatetime'      : 60,
        \     'hook/back_window/enable_exit'   : 1,
        \     'hook/back_window/priority_exit' : 100,
        \   },
        \   'go': {
        \     'command' : 'go',
        \     'exec'    : '%c run %s'
        \   },
        \   'matlab': {
        \     'command' : 'octave',
        \     'exec'    : '%c -q %s'
        \   },
        \   'make': {
        \     'command'   : 'make',
        \     'exec'      : '%c %o',
        \     'outputter' : 'error:buffer:quickfix'
        \   },
        \   'tla': {
        \     'command': 'tlc',
        \     'exec'   : '%c %s'
        \   },
        \   'julia': {
        \     'command': 'julia',
        \     'exec'   : '%c %s'
        \   },
        \   'yaml': {
        \     'command': 'actionlint',
        \     'exec'   : '%c %s'
        \   },
        \   'liz': {
        \     'command': 'sh',
        \     'exec'   : '%c -c ''liz %s && zig version''',
        \   },
        \   'typescript': {
        \     'command': 'deno',
        \     'exec'   : '%c run --allow-all --unstable %s'
        \   },
        \   'typescript_test': {
        \     'command': 'deno',
        \     'exec'   : '%c --unstable test --allow-all %s'
        \   },
        \   'zig': {
        \     'command': 'zig',
        \     'exec'   : '%c build',
        \   },
        \   'zig_test': {
        \     'command'   : 'zig',
        \     'exec'      : '%c build test',
        \     'outputter' : 'error:buffer:quickfix'
        \   },
        \   'watchdogs_checker/phpcs': {
        \     'command' : 'phpcs',
        \     'exec'    : '%c --report=emacs %s'
        \   },
        \   'php/watchdogs_checker': {
        \     'type'
        \       : executable('phpcs') ? 'watchdogs_checker/phpcs'
        \       : executable('php') ? 'watchdogs_checker/php'
        \       : ''
        \   },
        \   'watchdogs_checker/rubocop' : {
        \     'command'     : 'rubocop',
        \     'exec'        : 'bundle exec %c %o %s:p',
        \     'errorformat' : '%f:%l:%c:%m',
        \   },
        \   'ruby/watchdogs_checker': {
        \     'type'
        \       : executable('rubocop') ? 'watchdogs_checker/rubocop'
        \       : executable('ruby') ? 'watchdogs_checker/ruby'
        \       : '',
        \   },
        \ }

  aug MyQuickrunSetting
    au!
    au FileType quickrun AnsiEsc
  aug END
endif " }}}

if s:has_plug('vim-sandwich') " {{{
  let g:textobj_sandwich_no_default_key_mappings = 1

  omap ii <Plug>(textobj-sandwich-auto-i)
  xmap ii <Plug>(textobj-sandwich-auto-i)
  omap aa <Plug>(textobj-sandwich-auto-a)
  xmap aa <Plug>(textobj-sandwich-auto-a)
endif " }}}

if s:has_plug('vim-search-pulse') " {{{
  let g:vim_search_pulse_mode = 'cursor_line'
  let g:vim_search_pulse_disable_auto_mappings = 1
endif " }}}

if s:has_plug('vim-sonictemplate') " {{{
  let g:sonictemplate_vim_template_dir = '$HOME/.vim/template'

  function! s:ddu_sonictemplate() abort
    let candidates = sonictemplate#complete('', '', 0)
    let id = denops#callback#register(
          \ {s -> sonictemplate#apply(s, 'n')},
          \ {'once': v:true})

    stopinsert
    call ddu#start({
         \ 'sources': [{'name': 'custom-list',
         \              'params': {'texts': candidates, 'callbackId': id}}],
         \ 'uiParams': {'ff': {'startFilter': v:true}},
         \ })
  endfunction

  function! s:my_sonictemplate() abort
    let line = getline(line('.'))
    let input = trim(strpart(line, 0, col('.')))
    let pos = getcurpos()

    if empty(input)
      " call fzf#sonictemplate#run()
      call s:ddu_sonictemplate()
    else
      call sonictemplate#postfix()
      " 何も展開されなかった
      if pos == getcurpos()
        call fzf#sonictemplate#run()
      endif
    endif
  endfunction

  command! DduSonicTemplate call <SID>my_sonictemplate()
  nnoremap <silent> <C-l> <Cmd>call <SID>my_sonictemplate()<CR>
  inoremap <silent> <C-l> <Cmd>call <SID>my_sonictemplate()<CR>
endif " }}}

if s:has_plug('tig-explorer.vim') " {{{
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
  nnoremap <silent> <LocalLeader>gg :call <SID>tig_grep()<CR>
  nnoremap <LocalLeader>gs <Cmd>TigStatus<CR>
  nnoremap <LocalLeader>gb <Cmd>TigBlame<CR>
endif " }}}

if s:has_plug('gin.vim') " {{{
  let g:gin_patch_default_args = [
        \ '++no-head',
        \ ]
  let g:gin_log_default_args = [
        \ '--pretty=%C(yellow)%h%C(reset)%C(auto)%d%C(reset) %s %C(cyan)@%an%C(reset) %C(magenta)[%ar]%C(reset)',
        \ ]

  nnoremap <silent> <LocalLeader>gs :call uochan#gin#goto('GinStatus', #{reset: v:true})<CR>
  nnoremap <silent> <LocalLeader>gg :call uochan#gin#grep(expand('<cword>'))<CR>

  aug MyGinSetting
    au!
    au User GinComponentPost redrawtabline
    au FileType gin silent! call uochan#gin#au_gin_buffer()
    au FileType gitrebase silent! call uochan#gin#au_gitrebase()
    au FileType gitcommit silent! call uochan#gin#au_gitcommit()
    au FileType gin-status silent! call uochan#gin#au_gin_status()
    au FileType gin-log silent! call uochan#gin#au_gin_log()
    au Filetype gin-diff silent! call uochan#gin#au_gin_diff()
    au Filetype gin-branch silent! call uochan#gin#au_gin_branch()
    au BufReadCmd ginedit://* silent! call uochan#gin#au_gin_edit()
  aug END
endif " }}}

if s:has_plug('vim-which-key') " {{{
  call which_key#register('<Space>', "g:which_key_map")
  nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
  nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

  set timeoutlen=500

  if !exists('g:which_key_map')
    let g:which_key_map = {}
  endif

  let g:which_key_map["'"] = 'Make connection to nREPL'
  let g:which_key_map['"'] = 'Start REPL and connect to it'

  let g:which_key_map['e'] = {
        \ 'name' : '+evaluating',
        \ 'i': 'Evaluate inner element',
        \ 'e': 'Evaluate outer list',
        \ 't': 'Evaluate outer top list',
        \ 'n': 'Evaluate ns form',
        \ 'u': 'Undefine symbol',
        \ 'U': 'Undefine all symbols in ns',
        \ }

  let g:which_key_map['t'] = {
        \ 'name' : '+testing',
        \ }


  let g:which_key_map['s'] = {
        \ 'name' : '+stdout buffer',
        \ }
  let g:which_key_map['r'] = {
        \ 'name' : '+refactoring',
        \ }

  let g:which_key_map['h'] = {
        \ 'name' : '+help/document',
        \ }

  let g:which_key_map['b'] = {
        \ 'name' : '+browsing',
        \ }

  let g:which_key_map['j'] = {
        \ 'name' : '+jumping',
        \ }
endif " }}}

if s:has_plug('vim-lsp') " {{{
  " For debugging
  let g:lsp_log_verbose = 1
  let g:lsp_log_file = expand('~/vim-lsp.log')

  let g:lsp_signs_enabled = 1
  let g:lsp_fold_enabled = 0
  let g:lsp_diagnostics_float_cursor = 1

  let g:lsp_document_code_action_signs_enabled = v:false
  " let g:lsp_diagnostics_float_delay = 200
  " let g:lsp_diagnostics_signs_delay = 200

  " c.f. https://www.nerdfonts.com/cheat-sheet
  let g:lsp_diagnostics_signs_error = {'text': "\ufb8f"}
  let g:lsp_diagnostics_signs_warning = {'text': "\uf27a"}
  let g:lsp_diagnostics_signs_hint = {'text': "\uf27a"}
  "let g:lsp_document_code_action_signs_hint = {'text': "\uf0eb"}
  let g:lsp_document_code_action_signs_hint = {'text': "\uf089"}

  " TODO clojure-lsp の diagnostic は止めたい
  let g:lsp_settings = {
        \ 'clojure-lsp': {
        \   'disabled': v:false,
        \ },
        \ 'json-languageserver': {'disabled': v:true},
        \ 'efm-langserver': { 'disabled': v:false, 'allowlist': ['vim', 'yaml'] },
        \ 'deno': {'disabled': v:false},
        \ 'typescript-language-server': {'disabled': v:true},
        \ 'rome': {'disabled': v:true},
        \ 'eslint-language-server': {'disabled': v:true},
        \ 'sql-language-server': {'disabled': v:true},
        \ 'sqls': {'disabled': v:false, 'allowlist': ['sql']},
        \ 'vim-language-server': {'disabled': v:false},
        \}

  nmap <LocalLeader>ca <plug>(lsp-code-action)
  nmap <LocalLeader>cl <plug>(lsp-code-lens)

  aug VimLspSetting
    au FileType vim nmap <C-]> :<C-u>LspDefinition<CR>
    au FileType sql nmap K <plug>(lsp-hover)
  aug END
endif " }}}

if s:has_plug('parinfer-rust') " {{{
  let g:parinfer_mode = 'smart'
  "let g:parinfer_force_balance = v:true
  "let g:parinfer_logfile = '/tmp/parinfer.log'

  function! s:parinfer_toggle() abort
    if g:parinfer_mode ==# 'smart'
      let g:parinfer_mode = 'paren'
    else
      let g:parinfer_mode = 'smart'
    endif
    echo printf('Parinfer is "%s" mode now', g:parinfer_mode)
  endfunction

  command! ParinferToggle call <SID>parinfer_toggle()
  nnoremap <Leader>pt :<C-u>ParinferToggle<CR>
endif " }}}

if s:has_plug('previm') " {{{
  if has('unix')
    let g:previm_open_cmd = 'env DISPLAY=:0 xdg-open'
  endif
  if has('mac')
    " set empty to use open-browser.vim
    let g:previm_open_cmd = ''
  endif

  aug PrevimSettings
    au!
    au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
  aug END
endif " }}}

if s:has_plug('vim-easy-align') " {{{
  vmap <Enter> <Plug>(EasyAlign)
  let g:easy_align_delimiters = {
        \ '>': { 'pattern': '->\|=>' }
        \ }
endif " }}}

if s:has_plug('vim-easymotion') " {{{
  map e <Plug>(easymotion-prefix)
  let g:EasyMotion_keys='hklyuiopnm,qwertzxcvbasdgjf'
endif " }}}

if s:has_plug('vim-sexp') " {{{
  let g:sexp_filetypes = 'clojure,lisp'
  let g:sexp_enable_insert_mode_mappings=0
  let g:sexp_mappings = {
       \ 'sexp_indent': '',
       \ 'sexp_indent_top': '',
       \ }
endif " }}}

if s:has_plug('vim-submode') " {{{
  let g:submode_timeout = 0
  try
    call submode#enter_with('window', 'n', '', '<C-w><C-w>', '<Nop>')
    call submode#leave_with('window', 'n', '', '<Esc>')
    call submode#map('window', 'n', '', 'j', '<C-w>j')
    call submode#map('window', 'n', '', 'J', '<C-w>J')
    call submode#map('window', 'n', '', 'k', '<C-w>k')
    call submode#map('window', 'n', '', 'K', '<C-w>K')
    call submode#map('window', 'n', '', 'l', '<C-w>l')
    call submode#map('window', 'n', '', 'L', '<C-w>L')
    call submode#map('window', 'n', '', 'h', '<C-w>h')
    call submode#map('window', 'n', '', 'H', '<C-w>h')
    call submode#map('window', 'n', '', 's', '<C-w>s')
    call submode#map('window', 'n', '', 'v', '<C-w>v')
    call submode#map('window', 'n', '', 'x', ':q<CR>')
    call submode#map('window', 'n', '', '>', '<C-w>5>')
    call submode#map('window', 'n', '', '<', '<C-w>5<lt>')
    call submode#map('window', 'n', '', '+', '<C-w>5+')
    call submode#map('window', 'n', '', '-', '<C-w>5-')

    " c.f. vim-iced jumping signs
    call submode#enter_with('sign_jump', 'n', '', '<LocalLeader>n', ':<C-u>IcedJumpToNextSign<CR>')
    call submode#enter_with('sign_jump', 'n', '', '<LocalLeader>N', ':<C-u>IcedJumpToPrevSign<CR>')
    call submode#leave_with('sign_jump', 'n', '', '<Esc>')
    call submode#map('sign_jump', 'n', '', 'n', ':<C-u>IcedJumpToNextSign<CR>')
    call submode#map('sign_jump', 'n', '', 'N', ':<C-u>IcedJumpToPrevSign<CR>')

    " " c.f. ftplugin/clojure.vim
    " call submode#enter_with('slurp', 'n', '', '<LocalLeader><', ':<C-u>DPSlurpSexp<CR>')
    " call submode#enter_with('slurp', 'n', '', '<LocalLeader>>', ':<C-u>DPBarfSexp<CR>')
    " call submode#leave_with('slurp', 'n', '', '<Esc>')
    " call submode#map('slurp', 'n', '', 's', ':<C-u>DPSlurpSexp<CR>')
    " call submode#map('slurp', 'n', '', 'b', ':<C-u>DPBarfSexp<CR>')

    call submode#enter_with('slurp', 'n', '', '<LocalLeader>ks', ':<C-u>IcedSlurp<CR>')
    call submode#enter_with('slurp', 'n', '', '<LocalLeader>kb', ':<C-u>IcedBarf<CR>')
    call submode#leave_with('slurp', 'n', '', '<Esc>')
    call submode#map('slurp', 'n', '', 's', ':<C-u>IcedSlurp<CR>')
    call submode#map('slurp', 'n', '', 'b', ':<C-u>IcedBarf<CR>')
  catch
    echo 'submode is not installed'
    PlugInstall vim-submode
  endtry
endif " }}}

if s:has_plug('rainbow') " {{{
  let g:rainbow_active = 1
  let g:rainbow_conf = {
        \ 'ctermfgs': ['darkmagenta', 'red', 'darkcyan', 'brown', 'darkgreen', 'darkred'],
        \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
        \ 'separately': {'*': 0, 'clojure': {}}
        \ }
endif " }}}

if s:has_plug('vlime') " {{{
  let g:vlime_window_settings = {
        \ 'repl':      { 'pos': 'botright',   'size': 60, 'vertical': v:true},
        \ 'sldb':      { 'pos': 'belowright', 'size': 20},
        \ 'inspector': { 'pos': 'belowright', 'size': 10}
        \ }

  let g:vlime_compiler_policy = { 'DEBUG': 3 }
endif " }}}

if s:has_plug('vim-iced') " {{{
" call iced#hook#add('eval_prepared', {
"    \ 'type': 'function',
"    \ 'exec': {v -> iced#buffer#stdout#append(printf(";; Eval:\n%s", v['code']))},
"    \ })
" call iced#hook#add('evaluated', {
"   \ 'type': 'function',
"   \ 'exec': {v -> iced#buffer#stdout#append(printf(";; Ret:\n%s", v['result']['value']))},
"   \ })
endif " }}}

if s:has_plug('translate.vim') " {{{
  let g:translate_source = 'en'
  let g:translate_target = 'ja'

  xmap <LocalLeader>en <Plug>(VTranslate)
  xmap <LocalLeader>ja <Plug>(VTranslateBang)
endif " }}}

if s:has_plug('yankround.vim') " {{{
  nmap p <Plug>(yankround-p)
  xmap p <Plug>(yankround-p)
  nmap P <Plug>(yankround-P)
  nmap gp <Plug>(yankround-gp)
  xmap gp <Plug>(yankround-gp)
  nmap gP <Plug>(yankround-gP)
  nmap <Tab> <Plug>(yankround-prev)
  nmap <S-Tab> <Plug>(yankround-next)
  let g:yankround_use_region_hl = 1
endif " }}}

if s:has_plug('ddu.vim') " {{{

  call ddu#custom#patch_global({
    \ 'ui': 'ff',
    \ 'uiParams': {
    \   'ff': {
    \     'filterSplitDirection': has('nvim') ? 'floating' : 'botright',
    \     "autoAction" : { "name": "preview" },
    \     "previewWindowOptions": [ ["&signcolumn", "no"], ["&wrap", 0], ["&number", 0]],
    \     "previewSplit": "vertical",
    \     "previewWidth": 60,
    \   },
    \   'filer': {
    \     'split': 'no',
    \   },
    \ },
    \
    \ 'sources': [
    \   {'name': 'file_rec', 'params': {}},
    \ ],
    \ 'sourceOptions': {
    \   '_': {
    \     'matchers': ['matcher_fzf'],
    \     'sorters': ['sorter_fzf'],
    \   },
    \   'file_rec': {
    \     'matchers': ['matcher_fzf', 'matcher_hidden'],
    \   },
    \   'file_external': {
    \     'matchers': ['matcher_fzf', 'matcher_hidden'],
    \   },
    \   'line': {
    \     'matchers': ['matcher_kensaku'],
    \   },
    \ },
    \ 'sourceParams': {
    \   'file_rec': {
    \     'path': trim(system('git rev-parse --show-toplevel')),
    \     'ignoredDirectories': ['.git', '.cache', 'target', 'postgres', 'node_modules', '.shadow-cljs', '.cpcache'],
    \   },
    \   'file_external': {
    \     'cmd': ['fd', '.', '--type', 'f', '--hidden'],
    \   },
    \   'rg': {
    \     'path': trim(system('git rev-parse --show-toplevel')),
    \     'args': ['--json'],
    \   },
    \ },
    \
    \ 'kindOptions': {
    \   'file': {
    \     'defaultAction': 'open',
    \   },
    \   'custom-list': {
    \     'defaultAction': 'callback',
    \   },
    \   'window': {
    \     'defaultAction': 'open'
    \   },
    \   'action': {
    \     'defaultAction': 'do',
    \   },
    \   'word': {
    \     'defaultAction': "append",
    \   },
    \   'source': {
    \     'defaultAction': 'execute',
    \   },
    \ }
    \ })

  call ddu#custom#patch_global({
    \ 'filterParams': {
    \   'matcher_fzf': {
    \     'highlightMatched': 'SpellLocal',
    \   },
    \   'matcher_kensaku': {
    \     'highlightMatched': 'SpellLocal',
    \   },
    \ }})

  " call ddu#custom#patch_local('files', {
  "  \ 'uiParams': {
  "  \   'ff': {
  "  \     'split': has('nvim') ? 'floating' : 'horizontal',
  "  \   }
  "  \ },
  "  \ })

  " call ddu#custom#patch_global({
  "  \ 'ui': 'filer',
  "  \ 'actionOptions': {
  "  \   'narrow': {
  "  \     'quit': v:false,
  "  \   },
  "  \ }})

  function! s:resumable_ddu(...) abort
    let g:last_ddu_name = a:1
    exec printf('Ddu -name=%s %s', g:last_ddu_name, join(a:000[1:], ' '))
  endfunction

  function! s:ddu_resume() abort
    if ! exists('g:last_ddu_name') | return | endif
    call ddu#start({
          \ 'name': g:last_ddu_name,
          \ 'resume': v:true,
          \ 'uiParams': {'_': {'startFilter': v:false},
          \              'ff': {'startFilter': v:false}},
          \ })
  endfunction

  command! -nargs=* ResumableDdu call s:resumable_ddu(<f-args>)
  command! DduResumeLast call s:ddu_resume(<f-args>)

  function! s:ddu_file_rec(name) abort
    let g:last_ddu_name = a:name
    let has_git_dir = (finddir('.git', ';') !=# '')
    let source = (has_git_dir ? 'file_external' : 'file_rec')
    let path = trim(has_git_dir ? system('git rev-parse --show-toplevel') : '.')
    call ddu#start({
        \ 'name': g:last_ddu_name,
        \ 'sources': [{'name': source, 'options': {'path': path}}],
        \ 'uiParams': {'_': {'displaySourceName': 'short'},
        \              'ff': {'startFilter': v:true}},
        \ })
  endfunction

  function! s:ddu_rg(name) abort
    let g:last_ddu_name = a:name
    call ddu#start({
          \ 'name': g:last_ddu_name,
          \ 'input': expand('<cword>'),
          \ 'volatile': v:true,
          \ 'sources': [{'name': 'rg',
          \              'options': {'matchers': []}}],
          \ 'uiParams': {'ff': {'ignoreEmpty': v:false,
          \                     'autoResize': v:false}},
          \ })
  endfunction

  function! s:ddu_mr(name) abort
    let g:last_ddu_name = a:name
    call ddu#start({
          \ 'name': g:last_ddu_name,
          \ 'sources': [{'name': 'mr', 'params': {'kind': 'mrw'}}],
          \ 'uiParams': {'_': {'displaySourceName': 'short'},
          \              'ff': {'startFilter': v:true}},
          \ })
  endfunction

  nnoremap <Leader>dd <Cmd>DduResumeLast<CR>

  if s:has_plug('ctrlp.vim')
    nnoremap <LocalLeader>pp <Cmd>call <SID>ddu_file_rec('file')<CR>
	else
    nnoremap <C-p> <Cmd>call <SID>ddu_file_rec('file')<CR>
  endif
  nnoremap <Leader>dl <Cmd>ResumableDdu search line -ui-param-startFilter<CR>
  nnoremap <Leader>d* <Cmd>ResumableDdu search line -input=`expand('<cword>')` -ui-param-startFilter=v:false<CR>
  nnoremap <Leader>db <Cmd>ResumableDdu buffer buffer -ui-param-startFilter<CR>
  nnoremap <Leader>dg <Cmd>call <SID>ddu_rg('ripgrep')<CR>
  nnoremap <Leader>du <Cmd>call ddu#start({'sources': [{'name': 'source'}]})<CR>

  nnoremap <Leader>df <Cmd>Ddu -ui=filer -source-option-columns=filename file<CR>
  nnoremap <Leader><Leader> <Cmd>call <SID>ddu_mr('mr')<CR>

  "nnoremap <Leader>dD <Cmd>ResumableDdu git_diff git_diff -ui-param-startFilter=v:false<CR>

  "command! DduRgLive call <SID>ddu_rg_live()

  autocmd FileType ddu-ff call s:ddu_ff_my_settings()
  function! s:ddu_ff_my_settings() abort
    nnoremap <buffer><silent> <CR> <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
    nnoremap <buffer><silent> <Space> <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
    nnoremap <buffer><silent> i <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
    nnoremap <buffer><silent> a <Cmd>call ddu#ui#ff#do_action('chooseAction')<CR>
    nnoremap <buffer><silent> v <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'open', 'params': {'command': 'vsplit'}})<CR>
    nnoremap <buffer><silent> t <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'open', 'params': {'command': 'tabedit'}})<CR>
    nnoremap <buffer><silent> q <Cmd>call ddu#ui#ff#do_action('quit')<CR>
    nnoremap <buffer><silent> <Esc> <Cmd>call ddu#ui#ff#do_action('quit')<CR>
  endfunction

  autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
  function! s:ddu_filter_my_settings() abort
    inoremap <buffer> <CR> <Esc><Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>
    nnoremap <buffer> <CR> <Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>

    nnoremap <buffer><silent> q <Cmd>close<CR>
    nnoremap <buffer><silent> <Esc> <Cmd>close<CR>
  endfunction

  autocmd FileType ddu-filer call s:ddu_filer_my_settings()
  function! s:ddu_filer_my_settings() abort
    nnoremap <buffer><expr> <CR> ddu#ui#filer#is_directory()
          \ ? "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow'})<CR>"
          \ : "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open'})<CR>"
    nnoremap <buffer><expr> l ddu#ui#filer#is_directory()
          \ ? "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow'})<CR>"
          \ : "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open'})<CR>"
    nnoremap <buffer> h <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow', 'params': {'path': ".."}})<CR>
    nnoremap <buffer><silent> o <Cmd>call ddu#ui#filer#do_action('expandItem')<CR>
    nnoremap <buffer> q <Cmd>call ddu#ui#filer#do_action('quit')<CR>
    nnoremap <buffer> d <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'trash'})<CR>
    nnoremap <buffer> r <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'rename'})<CR>
    nnoremap <buffer> K <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newDirectory'})<CR>
    nnoremap <buffer> % <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newFile'})<CR>
    nnoremap <buffer> <C-l> <Cmd>call ddu#ui#filer#do_action('checkItems')<CR>
	endfunction

  " 先に ddu をロードしておく
  " call timer_start(10, { _ ->
  "      \ ddu#start({
  "      \   'ui': 'ff',
	 "     \   'uiParams': { 'ff': { 'ignoreEmpty': v:true } },
	 "     \   })
	 "     \ })

endif " }}}

if s:has_plug('ddc.vim') " {{{
  if s:has_plug('pum.vim')
    call pum#set_option(#{
          \ auto_select: v:false,
          \ horizontal_menu: v:false,
          \ max_width: 100,
          \ offset_cmdcol: 0,
          \ padding: v:true,
          \ use_complete: v:true,
          \ use_setline: v:false,
          \ })

    call pum#set_local_option('c', #{
          \   horizontal_menu: v:false,
          \ })

    let g:iced#util#pumvisible_fn = function('pum#visible')
  endif

  call ddc#custom#load_config(printf('%s/ddc.ts', expand('<sfile>:p:h')))

  inoremap <expr> <TAB>
        \ pum#visible() ?
        \   '<Cmd>call pum#map#insert_relative(+1, "loop")<CR>' :
        \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
        \   '<TAB>' : ddc#map#manual_complete()
  inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>

  inoremap <Down>   <Cmd>call pum#map#select_relative(+1)<CR>
  inoremap <Up>   <Cmd>call pum#map#select_relative(-1)<CR>
  inoremap <expr> <C-l>  ddc#map#manual_complete()

  " inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
  " inoremap <C-o>   <Cmd>call pum#map#confirm_word()<CR>
  " inoremap <Home>  <Cmd>call pum#map#insert_relative(-9999, 'ignore')<CR>
  " inoremap <End>   <Cmd>call pum#map#insert_relative(+9999, 'ignore')<CR>

  if s:has_plug('denops-popup-preview.vim')
    call popup_preview#enable()
  endif
endif " }}}

if s:has_plug('vim-test') " {{{
  aug MyVimTestSetting
    au!
    au FileType typescript,typescriptreact nmap <silent> <leader>tt :TestNearest<CR>
    au FileType typescript,typescriptreact nmap <silent> <leader>tb :TestFile<CR>
  aug END

  let g:test#javascript#runner = 'jest'
  let test#javascript#jest#executable = 'yarn jest'
  let test#strategy = "dispatch"
endif " }}}

if s:has_plug('gin.vim') " {{{
  nmap <buffer> <LocalLeader>gh <Plug>(gin-action-help)
endif " }}}

if s:has_plug('lexima.vim') " {{{
  "call lexima#add_rule({'char': ']', 'at': '\%#\[', 'leave': 1, 'filetype': 'zig'})
  "call lexima#add_rule({'char': '"', 'at': '\%#\[', 'leave': 1, 'filetype': 'clojure'})
endif " }}}

if s:has_plug('fuzzy-motion.vim') " {{{
  let g:fuzzy_motion_matchers = ['fzf', 'kensaku']

  nmap <LocalLeader>/ <Cmd>FuzzyMotion<CR>
endif " }}}

if s:has_plug('indent-blankline.nvim') " {{{
  let g:indent_blankline_indent_level = 40
  lua << END
    require("indent_blankline").setup {
      show_current_context = true,
      show_current_context_start = false,
      use_treesitter = true,
      char_highlight_list = {
        "FoldColumn",
      },
      context_highlight_list = {
        'Constant',
      },
      context_patterns = {
        "class",
        "^func",
        "method",
        "^if",
        "while",
        "for",
        "with",
        "try",
        -- clojure
        "list_lit",
        "vec_lit",
        "map_lit",
        "set_lit",
      },
    }
END
endif " }}}

if s:has_plug('SmoothCursor.nvim') " {{{
  lua << END
    vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#8aa872' })

    require('smoothcursor').setup {
      fancy = {
        enable = true,
        head = { cursor = "•", texthl = "SmoothCursor", linehl = nil },
        body = {
            { cursor = "•", texthl = "SmoothCursor" },
            { cursor = ".", texthl = "SmoothCursor" },
            { cursor = ".", texthl = "SmoothCursor" },
        },
        tail = { cursor = nil, texthl = "SmoothCursor" }
      }
    }

    local autocmd = vim.api.nvim_create_autocmd
    autocmd({ 'ModeChanged' }, {
      callback = function()
        local current_mode = vim.fn.mode()
        if current_mode == 'n' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#8aa872' })
          vim.fn.sign_define('smoothcursor', { text = '•'})
        elseif current_mode == 'v' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
          vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == 'V' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
          vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == '' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
          vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == 'i' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#668aab' })
          vim.fn.sign_define('smoothcursor', { text = '' })
        end
      end,
    })
END
endif " }}}

if s:has_plug('gitsigns.nvim') " {{{
  lua << END
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
    end
  }
END
endif " }}}

if s:has_plug('barbar.nvim') " {{{
  lua << END
  vim.g.barbar_auto_setup = false
  -- require('barbar').setup {
  --   hide = {extensions = false, inactive = true},
  --   clickable = false,
  -- }
END
endif " }}}

if s:has_plug('tabby.nvim') " {{{
  lua << END
  local theme = {
    fill = 'TabLineFill',
    -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
    head = 'TabLine',
    current_tab = 'TabLineSel',
    tab = 'TabLine',
    win = 'TabLine',
    tail = 'TabLine',
    active = 'StatusLine',
    nonactive = 'StatusLineNC',
    title = 'Title',
  }
  require('tabby.tabline').set(function(line)
    return {
      line.tabs().foreach(function(tab)
        local hl = tab.is_current() and theme.current_tab or theme.tab
        return {
          tab.is_current() and {' ' , hl = theme.active} or '',
          tab.name(),
          {'▎', hl = tab.is_current() and theme.active or theme.nonactive },
          hl = hl,
          margin = ' ',
        }
      end),

      line.spacer(),
      line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
        if win.is_current() then
          return {
            vim.fn['iced#repl#status'](),
            {'▎', hl = theme.nonactive },
            vim.fn['iced_multi_session#current'](),
            {'▎', hl = theme.nonactive },
            {win.buf().id, hl = theme.title },
            margin = ' ',
          }
        end
      end),
      hl = theme.fill,
    }
  end)
END
endif " }}}

if s:has_plug('mason.nvim') " {{{
  lua << END
  require('mason').setup()
END
endif " }}}

if s:has_plug('nvim-lspconfig') && s:has_plug('mason.nvim') " {{{
  lua << END
  local lspconfig = require("lspconfig")
  local mason_lspconfig = require('mason-lspconfig')

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      if not (ev.data and ev.data.client_id) then
        return
      end

      local bufnr = ev.buf
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      if client.supports_method('textDocument/inlayHint') then
        -- enable inlay hint
        --vim.lsp.buf.inlay_hint(bufnr, true)
        vim.lsp.inlay_hint(bufnr, true)
        -- toggle inly hint
        vim.keymap.set('n', 'gh', function()
          vim.lsp.inlay_hint(bufnr)
        end, bufopts)
        --vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = "#B6617F", bg = "#511D30" })
        vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = "#161820", bg = "#68843C" })
      end
    end,
  })

  mason_lspconfig.setup {
    ensure_installed = {
      "clojure_lsp",
      "denols",
      "eslint",
      "graphql",
      "tailwindcss",
      "tsserver",
      "vimls",
      "zls",
    },
  }

  mason_lspconfig.setup_handlers({ function(server_name)
    local opts = {}
    opts.on_attach = function(client, bufnr)
      local bufopts = { silent = true, buffer = bufnr }

      -- disable highlight
      client.server_capabilities.semanticTokensProvider = nil

      if server_name ~= "clojure_lsp" then
        vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      end
        --vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    end

    if server_name == 'denols' then
      local deno_root_dir = lspconfig.util.root_pattern("deno.jsonc")
      local is_deno_repo = deno_root_dir(vim.api.nvim_buf_get_name(0)) ~= nil
      if not is_deno_repo then
        return
      end

      opts.root_dir = deno_root_dir
      opts.init_options = {
        inlayHints = {
          parameterNames = {
            enabled = 'all',
            suppressWhenArgumentMatchesName = true,
          },
          parameterTypes = { enabled = true},
          variableTypes = {
            enabled = false,
            suppressWhenTypeMatchesName = false,
          },
          propertyDeclarationTypes = { enabled = true },
          functionLikeReturnTypes = { enabled = false },
          enumMemberValues = { enabled = true },
        }
      }

    elseif server_name == 'tsserver' then
      local node_root_dir = lspconfig.util.root_pattern("package.json")
      local is_node_repo = node_root_dir(vim.api.nvim_buf_get_name(0)) ~= nil
      if not is_node_repo then
        return
      end

      opts.root_dir = node_root_dir
      opts.settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = false,
            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = false,
            includeInlayEnumMemberValueHints = true,
          }
        }
      }

    elseif server_name == 'eslint' then
      local node_root_dir = lspconfig.util.root_pattern("package.json")
      local is_node_repo = node_root_dir(vim.api.nvim_buf_get_name(0)) ~= nil
      if not is_node_repo then
        return
      end
      opts.root_dir = node_root_dir
    end

    lspconfig[server_name].setup(opts)
  end })
END
endif " }}}

if s:has_plug('null-ls.nvim') && s:has_plug('mason.nvim') " {{{
  lua << END
	local mason = require("mason")
  local mason_package = require("mason-core.package")
  local mason_registry = require("mason-registry")
  local null_ls = require("null-ls")
	local null_sources = {}

	for _, package in ipairs(mason_registry.get_installed_packages()) do
    local package_categories = package.spec.categories[1]
		-- Formatter
		if package_categories == mason_package.Cat.Formatter then
      table.insert(null_sources, null_ls.builtins.formatting[package.name])
    end
		-- Linter
    if package_categories == mason_package.Cat.Linter then
      if package.name ~= "clj-kondo" then
        table.insert(null_sources, null_ls.builtins.diagnostics[package.name])
      end

    end
  end

  null_ls.setup({ sources = null_sources })

END

  aug MyNullLsSetting
    au!
    au BufWritePre *.js,*.ts,*.tsx lua vim.lsp.buf.format()
  aug END
endif " }}}

if s:has_plug('neogit') " {{{
  lua << END
  require('neogit').setup {}
END
endif " }}}

if s:has_plug('copilot.vim') " {{{
  imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true

  let g:copilot_filetypes = #{
        \ gitcommit: v:true,
        \ markdown: v:true,
        \ text: v:true,
        \ ddu-ff-filter: v:false,
        \ }

endif " }}}


if s:has_plug('nvim-cmp') " {{{
  lua << END
  local cmp = require('cmp')

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })
END
endif " }}}

" let g:foldmaker#use_marker = 1
" let g:foldmaker = {}
" let g:foldmaker.clojure = {
"      \ 'fdtype': 'pylike',
"      \ 'foldings': {
"      \   'function': {'start': '^\s*(def\s'},
"      \ }}


" if s:has_plug('fixme') " {{{
" endif " }}}

" タイマーによる遅延読み込み {{{
function! s:load_plug(timer_id) abort
  let l:load_plug_names = []
  for l:plug_name in keys(g:plugs)
    let l:on = get(g:plugs[l:plug_name], 'on')
    if type(l:on) == v:t_list && l:on == []
      call add(l:load_plug_names, l:plug_name)
    endif
  endfor

  " 対象が20以上あると Too many arguments になってしまうので分割してロードする
  let l:tmp = copy(l:load_plug_names)
  while !empty(l:tmp)
    call call('plug#load', l:tmp[:19])
    let l:tmp = l:tmp[20:]
  endwhile

  "call call('plug#load', l:load_plug_names)
endfunction

call timer_start(200, funcref('s:load_plug'))
" }}}

"let g:dps_parinfer_delay = 300

" MyCursorSign {{{
if ! has('nvim')
  sign define mycursorsign text=• texthl=Title
  function! s:cursor_sign() abort
    call sign_unplace('mycursorsign')
    call sign_place(0, 'mycursorsign', 'mycursorsign', expand('%:p'), {'lnum': line('.')})
  endfunction
  aug MyCursorSign
    au CursorMoved *.ts,*.tsx,*.clj,*.edn,*.json call s:cursor_sign()
  aug END
endif
" }}}

" developing plugins {{{
" http://www.kaoriya.net/blog/2015/12/01/vim-switch-developing-plugin/
let s:dirs = [ $HOME.'/src/github.com/liquidz' ]
for pattern in [ 'vim*', '*vim', 'dps*' ]
  for path in globpath(join(s:dirs, ','), pattern, 0, 1)
    if isdirectory(path) && filereadable(path . '/VIM_AUTO_RTP')
      "echom printf('VIM_AUTO_RTP: %s', path)
      let &runtimepath = &runtimepath.','.path
    end
  endfor
endfor " }}}




"     'split': has('nvim') ? 'floating' : 'horizontal',
"     "floatingBorder": "rounded",
"     "floatingTitlePos": "center",
"     "previewFloating": v:true,
"     "previewFloatingBorder": "rounded",
"     "previewFloatingTitle": [ ["Preview", "String"] ],
"     "previewFloatingTitlePos": "center",
