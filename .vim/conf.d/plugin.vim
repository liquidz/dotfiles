scriptencoding utf-8
let g:dotfiles = $HOME.'/src/github.com/liquidz/dotfiles'

call plug#begin('~/.vim/repos')
" default {{{

Plug 'aklt/plantuml-syntax'
Plug 'cespare/vim-toml'
Plug 'cocopon/iceberg.vim'
Plug 'cocopon/vaffle.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gregsexton/gitv'
Plug 'haya14busa/vim-metarepeat'
Plug 'idanarye/vim-merginal'
Plug 'inside/vim-search-pulse'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-submode'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'kannokanno/previm'
Plug 'kien/rainbow_parentheses.vim'
Plug 'LeafCage/foldCC.vim'
Plug 'liquidz/ctrlme.vim'
Plug 'liquidz/kami.vim'
Plug 'liquidz/vim-ctrlp-help'
Plug 'liquidz/vim-textobj-value'
Plug 'osyo-manga/vim-anzu'
Plug 'rhysd/clever-f.vim'
Plug 'rhysd/vim-color-spring-night'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 't9md/vim-quickhl'
Plug 'tacahiroy/ctrlp-funky'
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-themis'
Plug 'thinca/vim-visualstar'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser.vim'
Plug 'vim-jp/vital.vim'
Plug 'vim-scripts/confluencewiki.vim'
Plug 'vim-scripts/gtags.vim'
Plug 'w0ng/vim-hybrid'

if has('channel')
  Plug 'neomake/neomake'
  Plug 'maralla/completor.vim'
else
  Plug 'ervandew/supertab'
endif

" /default }}}
" filetype {{{

Plug 'fatih/vim-go',                   {'for': 'go'}
Plug 'nelstrom/vim-textobj-rubyblock', {'for': 'ruby'}
Plug 'thinca/vim-prettyprint',         {'for': 'vim'}
Plug 'vim-scripts/ruby-matchit',       {'for': 'ruby'}
if has('unix')
  "Plug 'wakatime/vim-wakatime'
  Plug 'l04m33/vlime',                                 {'for': 'lisp'}
  Plug 'rust-lang/rust.vim',                           {'for': 'rust'}
  Plug 'racer-rust/vim-racer',                         {'for': 'rust'}
  Plug 'yuratomo/w3m.vim' | Plug 'rhysd/rust-doc.vim', {'for': 'rust'}
  Plug 'guns/vim-clojure-static',                      {'for': 'clojure'}
  Plug 'guns/vim-sexp',                                {'for': ['lisp', 'clojure']}
  Plug 'tpope/vim-classpath',                          {'for': 'clojure'}
  Plug 'tpope/vim-fireplace',                          {'for': 'clojure'}
endif

" /filetype }}}
call plug#end()

" =colorscheme {{{

set background=dark
"colorscheme hybrid
colorscheme iceberg
"colorscheme spring-night

" }}}
" =search puls {{{

let g:vim_search_pulse_mode = 'cursor_line'
let g:vim_search_pulse_disable_auto_mappings = 1

nmap n <Plug>(anzu-n)<Plug>Pulse
nmap N <Plug>(anzu-N)<Plug>Pulse
nmap * <Plug>(anzu-star)<Plug>Pulse
nmap # <Plug>(anzu-sharp)<Plug>Pulse

" }}}
" =clever-f {{{

let g:clever_f_across_no_line = 1
let g:clever_f_ignore_case = 1

" }}}
" =ctrlp {{{

let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く
let g:ctrlp_show_hidden         = 1   " 隠しファイルも表示
let g:ctrlp_match_window        = 'results:50'
let g:ctrlp_follow_symlinks     = 1
let g:ctrlp_root_markers        = ['.root', 'project.clj', 'Cargo.toml', 'pom.xml', 'README.md']
let g:ctrlp_custom_ignore = {
  \   'dir' : '\v[\/](\.git|\.hg|\.svn|cookbooks|target|Vendor|.dein|cache)$',
  \   'file': '\v\.(o|bk|org|exe|so|dll|skl|cgi|gitkeep)$',
  \   'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_prompt_mappings = {
  \ 'PrtCurLeft()'   : ['<c-b>', '<left>'],
  \ 'PrtCurRight()'  : ['<c-f>', '<right>'],
  \ 'PrtClearCache()': ['<c-l>'],
  \ }
nnoremap <Leader>ct  :CtrlPTag<CR>
nnoremap <Leader>b   :CtrlPBuffer<CR>
nnoremap <Leader>cd  :CtrlPGonosen<CR>
nnoremap <Leader>ccc :CtrlPClearCache<CR>

" }}}
" =ctrlp-funky {{{

nnoremap <Leader>f :CtrlPFunky<Cr>

" }}}
" =previm {{{

let g:previm_open_cmd = ''  " set empty to use open-browser.vim
aug PrevimSettings
  au!
  au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
aug END

" }}}
" =quickrun {{{

" 結果を縦分割で表示
let b:quickrun_config = {'_': {'split': 'vertical'}}
" 横分割時は下､ 縦分割時は右へ新しいウィンドウを開く
set splitbelow
set splitright

"     \     'runner'                         : 'vimproc',
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
    \   'clojure': {
    \     'runner' : 'vimscript',
    \     'exec'   : ':Require'
    \   },
    \
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
    \   'watchdogs_checker/fireplace': {
    \     'runner'      : 'vimscript',
    \     'exec'        : ':MyReloadWithStringException',
    \     'outputter'   : 'quickfix',
    \     'errorformat' : '"%m:(%.%#/%f:%l:%c)"'
    \   },
    \   'clojure/watchdogs_checker': {
    \     'type': 'watchdogs_checker/fireplace'
    \   },
    \ }

" }}}
" =previm {{{

let g:previm_open_cmd = ''  " set empty to use open-browser.vim
aug PrevimSettings
  au!
  au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
aug END

" }}}
" =quickhl {{{

nmap <LocalLeader>m <Plug>(quickhl-manual-this)
xmap <LocalLeader>m <Plug>(quickhl-manual-this)
nmap <LocalLeader>M <Plug>(quickhl-manual-reset)
xmap <LocalLeader>M <Plug>(quickhl-manual-reset)

" }}}
" =vim-fugitive {{{

  nnoremap <Leader>ga  :Gwrite<CR>
  nnoremap <Leader>gs  :Gstatus<CR>
  nnoremap <Leader>gd  :Gdiff<CR>
  nnoremap <Leader>gc  :Gcommit -av<CR>
  nnoremap <Leader>go  :Git browse<CR>

" }}}
" =gitv {{{

nnoremap <Leader>gl  :Gitv<CR>

" }}}
" =vim-merginal {{{

nnoremap <Leader>gb  :Merginal<CR>

" }}}
" =lightline.vim {{{

function! MyFugitive()
  let l:branch = exists('*fugitive#head') ? fugitive#head() : ''
  if l:branch ==# 'master'
    let l:branch = printf('!! %s !!', toupper(l:branch))
  endif

  return l:branch
endfunction

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [['mode', 'paste'],
    \            ['fugitive', 'readonly', 'modified']],
    \   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'], ['anzu']]
    \ },
    \ 'component_function': {
    \   'ale': 'ALEGetStatusLine',
    \   'fugitive': 'MyFugitive',
    \   'anzu': 'anzu#search_status',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '|', 'right': '|' },
    \ 'tabline': { 'left': [[ 'tabs' ]], 'right': [[ 'bufnum' ]] }
    \ }

" }}}
" =vim-easy-align {{{

vmap <Enter> <Plug>(EasyAlign)
let g:easy_align_delimiters = {
    \ '>': { 'pattern': '->\|=>' }
    \ }

" }}}
" =gtags.vim {{{

if executable('gtags')
    nnoremap <Leader>gg :GtagsCursor<CR>
endif

" }}}
" =fireplace {{{

aug VimFireplaceSetting
  au!
  au Filetype clojure nnoremap <buffer> <Leader>r :Require<CR>
  au Filetype clojure nnoremap <buffer> <Leader>R :Require!<CR>
  au Filetype clojure nmap <buffer> cc <Plug>FireplaceCountPrint
  " vim-ref の K と競合するため再定義
  au Filetype clojure nmap <buffer> K <Plug>FireplaceK
aug END

" }}}
" =vim-sexp {{{

let g:sexp_enable_insert_mode_mappings = 0

" }}}
" =vim-submode {{{

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
catch
  echo 'submode is not installed'
  PlugInstall vim-submode
endtry

" }}}
" =rainbow_parentheses.vim {{{

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
"  aug MyRainbowParentheses
"    au!
"    au VimEnter * RainbowParenthesesToggle
"    au Syntax * RainbowParenthesesLoadRound
"    au Syntax * RainbowParenthesesLoadSquare
"    au Syntax * RainbowParenthesesLoadBraces
"  aug END

" }}}
" =neomake {{{

"aug MyNeoMake
"  au!
"  au BufWritePost * Neomake
"  au BufWritePost *.rs Neomake! cargo
"aug END
"let g:neomake_go_run_maker = {
"    \ 'args': ['--verbose'],
"    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
"    \ }
"
"let g:neomake_rust_cargo_maker = neomake#makers#cargo#cargo()
"let g:neomake_rust_enabled_makers = ['cargo']

" }}}
" =kami {{{

nnoremap <Leader>ko :KamiOpenFromList<CR>
nnoremap <Leader>kk :KamiOpenToday<CR>
let g:kami#ext = 'adoc'
let g:kami#timestamp_format = '== %s'

" }}}
" =completor {{{

"let g:completor_gocode_binary = $HOME.'/bin/gocode'
let g:completor_go_omni_trigger = '(?:\b[^\W\d]\w*|[\]\)])\.(?:[^\W\d]\w*)?'
"let g:completor_racer_binary = $HOME.'/.cargo/bin/racer'

" }}}
" =ctrlme {{{

    let g:ctrlme_toml_file = g:dotfiles . '/.vim/conf.d/ctrlme.toml'
    nnoremap <Leader>e :CtrlMe<CR>
    vnoremap <Leader>e :CtrlMe<CR>

" }}}
" =foldCC.vim {{{

set foldtext=FoldCCtext()

" }}}
" =ultisnips {{{

let g:UltiSnipsExpandTrigger='<c-k>'
let g:UltiSnipsJumpForwardTrigger='<c-l>'
""let g:UltiSnipsJumpBackwardTrigger='<c-z>'
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
"
""  let g:neosnippet#snippets_directory = $HOME . '/.vim/snippets'
""  imap <C-k> <Plug>(neosnippet_expand_or_jump)
""  smap <C-k> <Plug>(neosnippet_expand_or_jump)
""  xmap <C-k> <Plug>(neosnippet_expand_target)
""  nnoremap [Unite]s :Unite neosnippet<CR>

" }}}
" =rust.vim {{{

let g:rustfmt_autosave = 1

" }}}
" vim-ctrlp-help {{{

nnoremap <Leader>h :CtrlPHelp<CR>

" }}}
" =vim-racer {{{
"if has('unix')
"  aug MyVimRacer
"    au!
"    au FileType rust nmap <C-]> <Plug>(rust-def)
"    "au FileType rust nmap gs <Plug>(rust-def-split)
"  aug END
"endif
" }}}
" =w3m.vim {{{

function! s:w3m_local_vsplit(path) abort
  let path = substitute(a:path, "'", '', 'g')
  execute(printf(':W3mVSplit local %s', path))
endfunction
command! -nargs=1 W3mLocalVSplit call s:w3m_local_vsplit(<q-args>)

" }}}
" =rust-doc.vim {{{

let g:rust_doc#vim_open_cmd = 'W3mLocalVSplit'
let g:rust_doc#downloaded_rust_doc_dir = '~/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu'

" }}}
" =vaffle.vim {{{

nnoremap <Leader><Leader> :<C-u>Vaffle<CR>

" }}}
" =vlime {{{

let g:vlime_window_settings = {
    \ 'repl':      { -> {'pos': 'botright', 'size': winwidth('.') / 3, 'vertical': v:true}},
    \ 'sldb':      { -> {'pos': 'belowright', 'size': winheight('.') / 4}},
    \ 'inspector': { -> {'pos': 'belowright', 'size': winheight('.') / 2}}
    \ }

" }}}
" developing plugins {{{
" http://www.kaoriya.net/blog/2015/12/01/vim-switch-developing-plugin/
let dirs = [ $HOME.'/src/github.com/liquidz' ]
for pattern in [ 'vim*', '*vim' ]
  for path in globpath(join(dirs, ','), pattern, 0, 1)
    if isdirectory(path) && filereadable(path . '/VIM_AUTO_RTP')
      "echomsg "VIM_AUTO_RTP: ".path
      let &runtimepath = &runtimepath.','.path
    end
  endfor
endfor " }}}

" vim:foldlevel=0
