scriptencoding utf-8

if has('vim_starting')
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand($HOME . '/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" plugins {{{
if has('unix')
  NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \   'mac'   : 'make -f make_mac.mak',
      \   'linux' : 'make',
      \   'unix'  : 'gmake'
      \ }}
endif

NeoBundle 'vim-jp/vital.vim'
NeoBundle 'haya14busa/underscore.vim'
NeoBundle 'thinca/vim-themis'

NeoBundle 'Shougo/unite.vim'
NeoBundleLazy 'tsukkee/unite-tag', {
    \ 'autoload': {'unite_sources': ['tag']} }
NeoBundleLazy 'sorah/unite-ghq', {
    \ 'autoload': {'unite_sources': ['ghq']} }
NeoBundle 'LeafCage/yankround.vim'
"NeoBundleLazy 'liquidz/unite-bookmark-file', {
"    \ 'autoload': {'unite_sources': ['bookmark/file']} }
NeoBundleLazy 'Shougo/unite-help', {
    \ 'autoload': {'unite_sources': ['help']} }
NeoBundleLazy 'Shougo/vimfiler', {'autoload': {'commands': ['VimFiler']}}
NeoBundle 'liquidz/unite-circleci'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'kana/vim-submode'
NeoBundle 'tpope/vim-surround'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'pasela/edark.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'liquidz/ctrlp-gonosen.vim'
NeoBundle 'thinca/vim-quickrun'

NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'thinca/vim-ref'
NeoBundleLazy 'yuku-t/vim-ref-ri', {'autoload': {'filetypes': 'ruby'}}
NeoBundle 't9md/vim-quickhl'
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'idanarye/vim-merginal'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'osyo-manga/vim-watchdogs'
NeoBundle 'jceb/vim-hier'
NeoBundleLazy 'fatih/vim-go', {'autoload': {'filetypes': 'go'}}
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'ujihisa/shadow.vim'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'liquidz/vim-yacd'
NeoBundle 'liquidz/vim-oretag'
NeoBundle 'liquidz/vim-slack'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'aklt/plantuml-syntax'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'ujihisa/unite-colorscheme'

" neocomplete
if has('lua') && has('unix')
  NeoBundle 'Shougo/neocomplete.vim'
  NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', {
      \ 'autoload': {'filetype': 'ruby'},
      \ 'depends': ['Shougo/neocomplete.vim']}
endif

" neosnippet
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundleLazy 'vim-scripts/ruby-matchit', {'autoload': {'filetypes': 'ruby'}}
NeoBundleLazy 'nelstrom/vim-textobj-rubyblock', {'autoload': {'filetypes': 'ruby'}}
NeoBundle 'tpope/vim-endwise'
NeoBundle 'elixir-lang/vim-elixir'

if has('unix')
  NeoBundleLazy 'guns/vim-clojure-static', {'autoload': {'filetypes': 'clojure'}}
  NeoBundle 'kien/rainbow_parentheses.vim'
  NeoBundleLazy 'tpope/vim-fireplace', {'autoload': {'filetypes': 'clojure'}}
  NeoBundleLazy 'tpope/vim-classpath', {'autoload': {'filetypes': 'clojure'}}
  NeoBundleLazy 'typedclojure/vim-typedclojure', {'autoload': {'filetypes': 'clojure'}}
  NeoBundle 'majutsushi/tagbar'
endif

if system('uname') ==# "Darwin\n"
  NeoBundle 'rizzatti/dash.vim'
endif

call neobundle#end()
filetype plugin indent on

NeoBundleCheck
" }}}

" unite.vim {{{
let g:unite_enable_start_insert = 1
call unite#custom#source('file_rec', 'ignore_pattern',
    \ '\v[\/](bundle|target|cookbook|Vendor)')

nnoremap [Unite] <Nop>
nmap <Space> [Unite]
"nnoremap <C-p>    :<C-u>UniteWithProjectDir file_rec<CR>
nnoremap [Unite]<Space> :<C-u>Unite<Space>
"nnoremap [Unite]f :<C-u>Unite file<CR>
"nnoremap [Unite]b :<C-u>Unite buffer<CR>
nnoremap [Unite]l :<C-u>Unite line<CR>
nnoremap [Unite]m :<C-u>Unite output:messages<CR>
"nnoremap [Unite]cd :<C-u>Unite -default-action=rec ghq bookmark bookmark/file<CR>
" レポジトリ配下であればルートディレクトリからgrepするようにする
function! s:mygrep() abort
  if exists('b:yacd_buf_root_dir') && b:yacd_buf_root_dir !=# ''
    execute ':Unite grep:' . b:yacd_buf_root_dir
  else
    execute ':Unite grep:.'
  endif
endfunction
nnoremap [Unite]gg :call <SID>mygrep()<CR>
"" unite-tag
nnoremap [Unite]t :<C-u>Unite tag<CR>
" unite-help"
nnoremap [Unite]h :<C-u>Unite help<CR>
"" yankround
nnoremap [Unite]y :<C-u>Unite yankround<CR><Esc>

augroup MyUnite
  autocmd!
  autocmd FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
  autocmd FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
augroup END

if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif

let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.git = {
    \ 'description' : 'Git commands',
    \ }
let g:unite_source_menu_menus.git.command_candidates = {
    \ 'git status'      : 'Gstatus',
    \ 'git branch'      : 'Merginal',
    \ 'git add'         : 'Gwrite',
    \ 'git diff'        : 'Gdiff',
    \ 'git log'         : 'Gitv',
    \ 'git commit'      : 'Gcommit -av',
    \ 'git push'        : 'Gpush',
    \ 'git pull'        : 'Gpull',
    \ 'git pull-request': 'Git pull-request',
    \ 'git ci-status'   : 'Git ci-status',
    \ 'git browse'      : 'Git browse',
    \ }
nnoremap [Unite]gi :Unite menu:git<CR>
" }}}

" VimFiler {{{
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer  = 1
let g:vimfiler_sort_type            = 'filename'
let g:vimfiler_enable_auto_cd       = 1

nnoremap <Leader><leader> :VimFiler<CR>

aug VimFilerKeyMapping
  au!
  autocmd FileType vimfiler call s:vimfiler_local()

  function! s:vimfiler_local()
    " キーマップのカスタマイズ
    nmap <buffer> <C-r> <Plug>(vimfiler_rename_file)
    nmap <buffer> a <Plug>(vimfiler_toggle_mark_all_lines)
    nmap <buffer> m <Plug>(vimfiler_set_current_mask)
    nmap <buffer> M <Plug>(vimfiler_move_file)
    nmap <buffer> D <Plug>(vimfiler_make_directory)
    nmap <buffer> h <Plug>(vimfiler_smart_h)
    nmap <buffer> F <Plug>(vimfiler_new_file)

    " 関連付け
    if has('unix')
      call vimfiler#set_execute_file('sh', 'sh')
      call vimfiler#set_execute_file('html,htm,pdf,jpg,gif,png,svg,lzh,mp3,mpg,wmv,rm,flv', 'open')
    endif

    " Unite bookmark連携
    nnoremap <buffer> z <C-u>:Unite bookmark<CR>
    nnoremap <buffer> A <C-u>:UniteBookmarkAdd<CR>
    " Unite bookmarkのアクションをVimFilerに
    call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
  endfunction
aug END
" }}}

" osyo-manga/vim-anzu {{{
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
" }}}

" submode {{{
let g:submode_timeout = 0
"" window
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

"" tab
call submode#enter_with('tab', 'n', '', 'tt', '<Nop>')
call submode#leave_with('tab', 'n', '', '<Esc>')
call submode#map('tab', 'n', '', 'l', ':tabn<CR>')
call submode#map('tab', 'n', '', 'h', ':tabp<CR>')
call submode#map('tab', 'n', '', 'q', ':q<CR>')
call submode#map('tab', 'n', '', 'Q', ':q!<CR>')
" }}}

" hybrid {{{
colorscheme hybrid
if system('uname') ==# "Darwin\n"
  highlight Normal ctermbg=none
endif
" }}}

" clever_f {{{
let g:clever_f_across_no_line = 1
let g:clever_f_ignore_case = 1
" }}}

" easymotion {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
nmap s <Plug>(easymotion-s2)
" }}}

" ctrlp{{{
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く
let g:ctrlp_show_hidden         = 1   " 隠しファイルも表示
let g:ctrlp_match_window        = 'results:50'
let g:ctrlp_follow_symlinks     = 1
let g:ctrlp_custom_ignore = {
    \   'dir' : '\v[\/](\.git|\.hg|\.svn|cookbooks|target|Vendor)$',
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
nnoremap <Leader>f  :CtrlPCurFile<CR>
nnoremap <Leader>cd  :CtrlPGonosen<CR>
nnoremap <Leader>ccc :CtrlPClearCache<CR>
" }}}

" quickrun {{{
" 結果を縦分割で表示
let b:quickrun_config = {'_': {'split': 'vertical'}}
" 横分割時は下､ 縦分割時は右へ新しいウィンドウを開く
set splitbelow
set splitright

" hook/copen, hook/back で QuickFix にフォーカスを奪われないようにする
let g:quickrun_config = {
    \   '_': {
    \     'runner'                         : 'vimproc',
    \     'runner/vimproc/updatetime'      : 60,
    \     'hook/back_window/enable_exit'   : 1,
    \     'hook/back_window/priority_exit' : 100,
    \   },
    \   'go': {
    \     'command' : 'go',
    \     'exec'    : '%c run %s'
    \   },
    \   'make': {
    \     'command'   : 'make',
    \     'exec'      : '%c %o',
    \     'outputter' : 'error:buffer:quickfix'
    \   },
    \ 
    \   'watchdogs_checker/phpcs': {
    \     'command' : 'phpcs',
    \     'exec'    : '%c --report=emacs %s'
    \   },
    \   'php/watchdogs_checker': {
    \     'type' : 'watchdogs_checker/phpcs',
    \   },
    \   'ruby/watchdogs_checker': {
    \     'type'
    \       : executable('rubocop') ? 'watchdogs_checker/rubocop'
    \       : executable('ruby') ? 'watchdogs_checker/ruby'
    \       : '',
    \   },
    \   'watchdogs_checker/elixir': {
    \     'command'     : 'elixir',
    \     'exec'        : '%c %s',
    \     'errorformat' : '**\ (%.%#Error)\ %f:%l:\ %m,%-G%.%#',
    \     'hook/cd/directory': yacd#get_root_dir(expand('%:p:h'))
    \   },
    \   'elixir/watchdogs_checker': {
    \     'type' : 'watchdogs_checker/elixir',
    \   }
    \ }


if has('unix')
  let g:quickrun_config.markdown = {
      \  'outputter' : 'null',
      \  'command' : 'open',
      \  'cmdopt' : '-a',
      \  'args' : 'Marked',
      \  'exec' : '%c %o %a %s',
      \ }
endif
" }}}

" rainbow_parentheses {{{
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

if neobundle#is_installed('rainbow_parentheses.vim')
  aug MyRainbowParentheses
    au!
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
  aug END
endif
" }}}

" previm {{{
let g:previm_open_cmd = '' " set empty to use open-browser.vim

aug PrevimSettings
  au!
  au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
aug END
" }}}

" gist-vim {{{
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_get_multiplefile = 1
nnoremap <Leader>todo :Gist 1ec3a489823690e31661<CR><C-w>o
" }}}

" vim-ref {{{
let g:ref_phpmanual_path = $HOME . '/.vim/vim-ref/php-chunked-xhtml'
let g:ref_source_webdict_sites = {
    \   'weblio' : {
    \     'url'  : 'http://ejje.weblio.jp/content/%s',
    \     'line' : 70
    \   },
    \   'chef' : {
    \     'url'  : 'http://docs.opscode.com/resource_%s.html',
    \     'line' : 40
    \   }
    \ }
nnoremap <Leader>dic :Ref webdict
aug VimRefKeyMapping
  au!
  autocmd FileType php nnoremap <Space>r :Unite ref/phpmanual<CR>
aug END
" }}}

" vim-yacd {{{
let g:yacd#enable = 1
let g:yacd#root_names = ['Rakefile', 'mix.exs', '.root', '.git']
" }}}

"let g:vim_spy_auto_start = 1

" vim-slack {{{
nnoremap <Leader>sp  :SlackPost<Space>
" }}}

" neocomplete {{{
if neobundle#is_installed('neocomplete.vim')
  " neocomplete用設定
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'

  aug NeoCompleteLock
    au!
    au FileType clojure nested NeoCompleteLock
  aug END
endif
" }}}

" neosnippet {{{
let g:neosnippet#snippets_directory = $HOME . '/.vim/snippets'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
nnoremap [Unite]s :Unite neosnippet<CR>
" }}}

" vim-fireplace {{{
if neobundle#is_installed('vim-fireplace')
  aug VimFireplaceSetting
    au!
    au Filetype clojure nnoremap <Leader>r :Require!<CR>
    " vim-ref の K と競合するため再定義
    au Filetype clojure nmap <buffer> K <Plug>FireplaceK
  aug END
endif
" }}}

" vim-quickhl {{{
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
" }}}

" vim-operator {{{
map - <Plug>(operator-replace)
" }}}

" vim-fugitive, gitv, merginal {{{
nnoremap <Leader>ga  :Gwrite<CR>
nnoremap <Leader>gs  :Gstatus<CR>
nnoremap <Leader>gd  :Gdiff<CR>
nnoremap <Leader>gc  :Gcommit -av<CR>
nnoremap <Leader>gl  :Gitv<CR>
nnoremap <Leader>go  :Git browse<CR>
nnoremap <Leader>gb  :Merginal<CR>
" push, pull, pull-request は間違って実行しないよう
" マッピングはあえてしない
" }}}

" lightline.vim {{{
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [['mode', 'paste'],
    \            ['fugitive', 'readonly', 'filename', 'modified']],
    \   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'], ['anzu']]
    \ },
    \ 'component_function': {
    \   'fugitive': 'MyFugitive',
    \   'anzu': 'anzu#search_status',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '|', 'right': '|' }
    \ }

function! MyFugitive()
  let l:branch = exists('*fugitive#head') ? fugitive#head() : ''
  if l:branch ==# 'master'
    let l:branch = '*' . toupper(l:branch) . '*'
  endif
  return l:branch
endfunction
" }}}

" oretag {{{
let g:oretag#enable = 1
let g:oretag#tag_dir = expand('$HOME/.tags')
" }}}

" vim-watchdog {{{
let g:watchdogs_check_BufWritePost_enable = 1
call watchdogs#setup(g:quickrun_config)
" }}}

" memolist.vim {{{
let g:memolist_path              = $HOME . '/.vim/memo'
let g:memolist_memo_suffix       = 'md'
let g:memolist_template_dir_path = $HOME . '/.vim/template/memolist'
"let g:memolist_unite = 1
let g:memolist_ex_cmd = 'CtrlP'
nnoremap <Leader>mn :MemoNew<CR>
nnoremap <Leader>ml :MemoList<CR>
nnoremap <Leader>mg :MemoGrep<CR>
" }}}

" tagbar {{{
let g:tagbar_foldlevel = 1
"let g:tagbar_autofocus = 1
"let g:tagbar_autoclose = 1
let g:tagbar_iconchars = ['+', '-']
nnoremap <Leader>T :<C-u>TagbarOpenAutoClose<CR>
" }}}

" vim-textobj-multiblock {{{
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
xmap ab <Plug>(textobj-multiblock-a)
xmap ib <Plug>(textobj-multiblock-i)
" }}}

" unite-colorscheme {{{
nnoremap <silent> [Unite]c :<C-u>Unite colorscheme<CR>
" }}}

" vim:fdl=0
