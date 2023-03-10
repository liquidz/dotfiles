scriptencoding utf-8
let g:dotfiles = $HOME.'/src/github.com/liquidz/dotfiles'

let g:use_ddu = v:true
let g:use_vim_diced = v:false

function! s:has_plug(name) abort
  return exists('g:plugs') && !empty(get(g:plugs, a:name))
endfunction

call plug#begin('~/.vim/repos')

" default {{{

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
  Plug 'matsui54/ddu-source-file_external'
  Plug '~/src/github.com/liquidz/ddu-source-custom-list'
  Plug 'shun/ddu-source-rg'

  Plug 'lambdalisue/mr.vim' | Plug 'kuuote/ddu-source-mr'
  "Plug 'kuuote/ddu-source-git_diff'

  " Install your filters
  Plug 'yuki-yano/ddu-filter-fzf'
  Plug 'Shougo/ddu-filter-matcher_substring'
  Plug 'Shougo/ddu-filter-matcher_hidden'
  Plug 'lambdalisue/kensaku.vim' | Plug 'Milly/ddu-filter-kensaku'
  " Install your kinds
  Plug 'Shougo/ddu-kind-file'
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
"Plug 'itchyny/lightline.vim'
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
if has('nvim')
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  "Plug 'nvim-treesitter/playground'
  Plug 'nvim-treesitter/nvim-treesitter-context'
  Plug 'mfussenegger/nvim-treehopper'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'gen740/SmoothCursor.nvim'
  Plug 'github/copilot.vim'
endif

" /default }}}
" filetype {{{

Plug 'nelstrom/vim-textobj-rubyblock', {'for': 'ruby'}
Plug 'thinca/vim-prettyprint',         {'for': 'vim'}
Plug 'vim-scripts/ruby-matchit',       {'for': 'ruby'}

if has('unix')
  Plug 'neoclide/coc.nvim', {'on': [], 'for': 'clojure', 'branch': 'release'}


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
  if g:use_vim_diced
  else
    Plug '~/src/github.com/liquidz/vim-iced-coc-source', {'on': [], 'for': 'clojure'}
  endif
    " Plug '~/src/github.com/liquidz/vim-diced-coc-source', {'for': 'clojure'}

  " }}}
endif

" /filetype }}}

call plug#end()

if s:has_plug('denops.vim') " {{{
  if ! executable('deno')
    let g:denops#deno = printf('%s/.deno/bin/deno', $HOME)
  endif

  let g:denops_server_addr = '127.0.0.1:32123'
  "call denops#plugin#check_type()

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
    ensure_installed = { "clojure", "vim", "help" },
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

if s:has_plug('nvim-treesitter-context')
lua <<EOC
  require'treesitter-context'.setup{
    enable = true,
  }
EOC
endif

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
       \ 'coc-diagnostic',
       \ 'coc-eslint',
       \ 'coc-lines',
       \ 'coc-prettier',
       \ 'coc-tsserver',
       \ ]
  " coc-tsserver と一緒に入っていると ts プロジェクトにて
  " tsserver を無効にする .vim/coc-settings.json がプロジェクトルートに作成さ
  " れてしまうので一旦 uninstall
  "     \ 'coc-deno',

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
    au FileType typescript,css nnoremap <buffer> K :call CocActionAsync('doHover')<CR>
  aug END
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
  let g:ctrlp_match_func          = {'match': 'ctrlp_matchfuzzy#matcher'}
  let g:ctrlp_custom_ignore = {
        \   'dir' : '\v[\/](\.git|cookbooks|target|Vendor|cache|node_modules|\.cache|\.cpcache|\.shadow-cljs)$',
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

  let g:lightline = {
        \ 'colorscheme': s:colorscheme,
        \ 'active': {
          \   'left': [['mode', 'readonly'],
          \            ['paste', 'modified']],
          \   'right': [['lineinfo'], ['fileformat', 'filetype'], ['anzu'], ['coc_status'], ['iced_multi_session'], ['iced']]
          \ },
          \ 'component_function': {
            \   'anzu': 'anzu#search_status',
            \   'iced': 'iced#repl#status',
            \   'iced_multi_session': 'iced_multi_session#current',
            \   'coc_status': 'MyCocStatus',
            \ },
            \ 'separator': { 'left': "\ue0b4", 'right': "\ue0b6"},
            \ 'subseparator': { 'left': "\ue0b5", 'right':  "\ue0b7" },
            \ 'tabline': { 'left': [[ 'tabs' ]], 'right': [[ 'bufnum' ]] }
            \ }
endif " }}}

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
    \ 'sources': [
    \   {'name': 'file_rec', 'params': {}},
    \ ],
    \ 'sourceOptions': {
    \   '_': {
    \     'matchers': ['matcher_fzf'],
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
    \ 'uiParams': {
    \   'ff': {
    \     'winHeight': 10,
    \     'filterSplitDirection': has('nvim') ? 'floating' : 'botright',
    \   },
    \   'filer': {
    \     'split': 'no',
    \   },
    \ },
    \ 'kindOptions': {
    \   'file': {
    \     'defaultAction': 'open',
    \   },
    \   'custom-list': {
    \     'defaultAction': 'callback',
    \   },
    \   'action': {
    \     'defaultAction': 'do',
    \   },
    \ }
    \ })

    "\     'split': has('nvim') ? 'floating' : 'horizontal',
    "\     'floatingBorder': 'rounded',
    "\     'previewFloating': v:true,
    "\     'previewVertical': v:true,
    "\     'highlights': {'floating': 'Normal' },

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

  if !s:has_plug('ctrlp.vim')
    nnoremap <C-p>      <Cmd>call <SID>ddu_file_rec('file')<CR>
  endif
  nnoremap <Leader>dl <Cmd>ResumableDdu search line -ui-param-startFilter<CR>
  nnoremap <Leader>d* <Cmd>ResumableDdu search line -input=`expand('<cword>')` -ui-param-startFilter=v:false<CR>
  nnoremap <Leader>db <Cmd>ResumableDdu buffer buffer -ui-param-startFilter<CR>
  nnoremap <Leader>dg <Cmd>call <SID>ddu_rg('ripgrep')<CR>

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
    inoremap <buffer><silent> <CR> <Esc><Cmd>call ddu#ui#ff#close()<CR>
	  nnoremap <buffer><silent> <CR> <Cmd><Cmd>call ddu#ui#ff#close()<CR>

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
      char_highlight_list = {
        "FoldColumn",
      },
    }
END
endif " }}}

" if s:has_plug('vim-iced')
" lua << END
"   vim.fn['iced#hook#add']('connected', {
"     type = "function",
"     exec = function()
"       vim.diagnostic.disable(vim.fn.bufnr("iced_stdout"))
"     end
"   })
" END
" endif

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

if s:has_plug('copilot.vim') " {{{
  imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true
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

" icedon
nnoremap <buffer> <Leader>i' <Plug>(icedon_connect)
nnoremap <buffer> <Leader>iss <Plug>(icedon_open_info_buffer)
nnoremap <buffer> <Leader>isq <Plug>(icedon_close_info_buffer)
nnoremap <buffer> <Leader>iet <Plug>(icedon_eval_outer_top_form)
nnoremap <buffer> <Leader>iee <Plug>(icedon_eval_outer_form)



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
