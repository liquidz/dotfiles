" vim: foldmethod=marker
" vim: foldlevel=0

" basic {{{1
if has('vim_starting')
    set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand($HOME . '/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" plugins {{{1

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'mac'   : 'make -f make_mac.mak',
\     'linux' : 'make',
\    },
\ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundleLazy 'Shougo/vimfiler', {'autoload': {'commands': ['VimFiler']}}
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'kana/vim-submode'
NeoBundle 'tpope/vim-surround'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'osyo-manga/vim-over'

NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'kana/vim-operator-replace.git'
NeoBundle 'kana/vim-operator-user.git'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'sorah/unite-ghq'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'osyo-manga/vim-watchdogs'
NeoBundle 'jceb/vim-hier'
NeoBundle 'vim-jp/vim-go-extra'
NeoBundle 'glidenote/memolist.vim'

" neocomplete
if has('lua')
    NeoBundle 'Shougo/neocomplete'
endif
" neosnippet
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

if has("unix")
    NeoBundle 'tpope/vim-fireplace'
    NeoBundle 'tpope/vim-classpath'
    NeoBundle 'typedclojure/vim-typedclojure'
    NeoBundle 'Shougo/unite-build'
endif

"NeoBundle 'osyo-manga/vim-marching'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" VimShell {{{2
nnoremap <Leader>ss :VimShell<CR>
nnoremap <Leader>sp :VimShellPop<CR>

" VimFiler {{{2
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_sort_type = "filename"
let g:vimfiler_enable_auto_cd = 1

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
        " sendto呼び出し
        nnoremap <buffer> <Leader>s :Unite sendto<CR>

        " 関連付け
        if has('unix')
            call vimfiler#set_execute_file('sh', 'sh')
            call vimfiler#set_execute_file('html,htm,pdf,jpg,gif,png,svg,lzh,mp3,mpg,wmv,rm,flv', 'xdg-open')
        endif

        " Unite bookmark連携
        nnoremap <buffer> z <C-u>:Unite bookmark<CR>
        nnoremap <buffer> A <C-u>:UniteBookmarkAdd<CR>
        " Unite bookmarkのアクションをVimFilerに
        call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
    endfunction
aug END

" unite.vim {{{2
let g:unite_enable_start_insert = 1
nnoremap <Space>b :Unite file buffer tab<CR>

" submode {{{2
let g:submode_timeout = 0
" window {{{3
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

" hybrid {{{2
colorscheme hybrid

" clever_f {{{2
let g:clever_f_across_no_line = 1
let g:clever_f_ignore_case = 1


" ctrlp{{{2
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く
let g:ctrlp_show_hidden         = 1   " 隠しファイルも表示
nnoremap <Leader>ccc :CtrlPClearCache<CR>

" quickrun {{{2
" 結果を縦分割で表示
let b:quickrun_config = {'_': {'split': 'vertical'}}
" 横分割時は下､ 縦分割時は右へ新しいウィンドウを開く
set splitbelow
set splitright

let g:quickrun_config = {
\   "_": {
\       "runner"                    : "vimproc",
\       "runner/vimproc/updatetime" : 60
\   },
\   "go": {
\       'command' : 'go',
\       'exec'    : '%c run %s'
\   },
\   "make": {
\       "command"   : "make",
\       "exec"      : "%c %o",
\       "outputter" : "error:buffer:quickfix"
\   },
\
\   "watchdogs_checker/phpcs": {
\       "command" : "phpcs",
\       "exec"    : "%c --report=emacs %s"
\   },
\   "php/watchdogs_checker": {
\       "type" : "watchdogs_checker/phpcs",
\   }
\ }

if has("unix")
    let g:quickrun_config.markdown = {
    \    'outputter' : 'null',
    \    'command' : 'open',
    \    'cmdopt' : '-a',
    \    'args' : 'Marked',
    \    'exec' : '%c %o %a %s',
    \}
endif


" yankround {{{2
"nmap P <Plug>(yankround-p)
nnoremap <Space>y :Unite yankround<CR>

" vim-clojure-static {{{2
aug MyLispWords
    au!
    " compojure
	au FileType clojure set lispwords+=defroutes,GET,POST
    " misaki
	au FileType clojure set lispwords+=defvalidate,validate,testing,defhtml,bind-config,defcompilertest
    " midje
	au FileType clojure set lispwords+=facts,fact
    " conjure
	au FileType clojure set lispwords+=stubbing
aug END

" rainbow_parentheses {{{2
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
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

" vim-over {{{2
nnoremap <silent> <Leader>m :OverCommandLine<CR>
" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

" previm {{{2
let g:previm_open_cmd = '' " set empty to use open-browser.vim

aug PrevimSettings
    au!
    au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
aug END

" gist-vim {{{2
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_get_multiplefile = 1
nnoremap <Leader>todo :Gist 1ec3a489823690e31661<CR><C-w>o

" vim-ref {{{2
let g:ref_phpmanual_path = $HOME . '/.vim/vim-ref/php-chunked-xhtml'
let g:ref_source_webdict_sites = {
\   'weblio' : {
\       'url'  : 'http://ejje.weblio.jp/content/%s',
\       'line' : 70
\   },
\   'chef' : {
\       'url'  : 'http://docs.opscode.com/resource_%s.html',
\       'line' : 40
\   }
\ }
nnoremap <Leader>dic :Ref webdict
aug VimRefKeyMapping
    au!
    autocmd FileType php nnoremap <Space>r :Unite ref/phpmanual<CR>
aug END

" neocomplete {{{2
if neobundle#is_installed('neocomplete')
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

" neosnippet {{{2
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory = $HOME . '/.vim/snippets'
aug NeoSnippetIndent
    au!
    autocmd FileType neosnippet set noexpandtab
aug END


" vim-fireplace {{{2
if neobundle#is_installed('vim-fireplace')
    aug VimFireplaceSetting
        au!
        " vim-ref の K と競合するため再定義
        au Filetype clojure nmap <buffer> K <Plug>FireplaceK
    aug END
endif

" vim-quickhl {{{2
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

" vim-operator {{{2
map - <Plug>(operator-replace)

" vim-fugitive, gitv {{{2
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Glame<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit -av<CR>
nnoremap <Leader>gl :Gitv<CR>

" lightline.vim {{{2
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [['mode', 'paste'],
    \            ['fugitive', 'readonly', 'filename', 'modified']]
    \ },
    \ 'component_function': {
    \   'fugitive': 'MyFugitive',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': "|", 'right': '|' }
    \ }

function! MyFugitive()
    let l:branch = exists('*fugitive#head') ? fugitive#head() : ''
    if l:branch ==# 'master'
        let l:branch = '*' . toupper(l:branch) . '*'
    endif
    return l:branch
endfunction

" unite-ghq {{{2
nnoremap <buffer> <Space>q :Unite ghq<CR>

" auto-ctags {{{2
let g:auto_ctags = 1
let g:auto_ctags_directory_list = [$HOME . '/.tags']
let g:auto_ctags_filetype_mode = 1

" unite-tag {{{2
nnoremap <Space>t :Unite tag<CR>

" unite-build {{{2
nnoremap <Space>b :Unite build<CR>

" vim-watchdog {{{2
let g:watchdogs_check_BufWritePost_enable = 1
call watchdogs#setup(g:quickrun_config)

" vim-marching {{{2
"" clang コマンドの設定
let g:marching_clang_command = "/usr/bin/clang"
" オプションを追加する
" filetype=cpp に対して設定する場合
let g:marching#clang_command#options = {
\   "cpp" : "-std=gnu++1y"
\}
" neocomplete.vim と併用して使用する場合
let g:marching_enable_neocomplete = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.cpp =
    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
" 処理のタイミングを制御する
" 短いほうがより早く補完ウィンドウが表示される
" ただし、marching.vim 以外の処理にも影響するので注意する
set updatetime=400
" オムニ補完時に補完ワードを挿入したくない場合
imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)
" キャッシュを削除してからオムに補完を行う
imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete)

" memolist.vim {{{2
let g:memolist_path = $HOME . "/.vim/memo"
let g:memolist_memo_suffix = "md"
let g:memolist_template_dir_path = $HOME . "/.vim/template/memolist"
let g:memolist_ex_cmd = 'CtrlP'
nnoremap <Leader>mn :MemoNew<CR>
nnoremap <Leader>ml :MemoList<CR>
nnoremap <Leader>mg :MemoGrep<CR>
