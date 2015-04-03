" vim: foldmethod=marker
" vim: foldlevel=0

" plugins {{{
call plug#begin('~/.vim/bundle')

function! BuildVimproc(info)
    if (a:info.status == 'installed' || a:info.force) && has('unix')
        let uname = system("uname")
        if uname == 'Darwin'
            !make -f make_mac.mak
        else
            !make
        end
    endif
endfunction
Plug 'Shougo/vimproc.vim', { 'do': function('BuildVimproc')}

Plug 'vim-jp/vital.vim'
Plug 'Shougo/unite.vim'
"Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimfiler', {'on': ['VimFiler']}
Plug 'thinca/vim-visualstar'
Plug 'kana/vim-submode'
Plug 'tpope/vim-surround'
Plug 'w0ng/vim-hybrid'
Plug 'rhysd/clever-f.vim'
Plug 'fuenor/qfixgrep'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'thinca/vim-quickrun'
Plug 'LeafCage/yankround.vim'

Plug 'tyru/open-browser.vim'
Plug 'kannokanno/previm'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'thinca/vim-ref'
Plug 'yuku-t/vim-ref-ri', {'for': 'ruby'}
Plug 't9md/vim-quickhl'
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-operator-user'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'itchyny/lightline.vim'
Plug 'soramugi/auto-ctags.vim'
Plug 'osyo-manga/shabadou.vim'
Plug 'osyo-manga/vim-watchdogs'
Plug 'jceb/vim-hier'
Plug 'vim-jp/vim-go-extra', {'for': 'go'}
Plug 'glidenote/memolist.vim'
Plug 'ujihisa/shadow.vim'
Plug 'kana/vim-textobj-user'
Plug 'kshenoy/vim-signature'

" neocomplete
if has('lua')
    Plug 'Shougo/neocomplete.vim'
    Plug 'marcus/rsense', {'for': 'ruby'}
    Plug 'supermomonga/neocomplete-rsense.vim', {'for': 'ruby'}
endif

" neosnippet
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'vim-scripts/ruby-matchit', {'for': 'ruby'}
Plug 'nelstrom/vim-textobj-rubyblock', {'for': 'ruby'}
Plug 'tpope/vim-endwise'
Plug 'thinca/vim-themis'

if has("unix")
    Plug 'guns/vim-clojure-static', {'for': 'clojure'}
    Plug 'kien/rainbow_parentheses.vim'
    Plug 'tpope/vim-fireplace', {'for': 'clojure'}
    Plug 'tpope/vim-classpath', {'for': 'clojure'}
    Plug 'typedclojure/vim-typedclojure', {'for': 'clojure'}

    Plug 'Shougo/unite-build'
    Plug 'liquidz/unite_bundle_builder'
endif

call plug#end() " }}}

" VimShell {{{
"nnoremap <Leader>ss :VimShell<CR>
"nnoremap <Leader>sp :VimShellPop<CR>
" }}}

" VimFiler {{{
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
" }}}

" unite.vim {{{
let g:unite_enable_start_insert = 1
nnoremap <Space>b :Unite file buffer tab<CR>
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
" }}}

" hybrid {{{
colorscheme hybrid
" }}}

" clever_f {{{
let g:clever_f_across_no_line = 1
let g:clever_f_ignore_case = 1
" }}}

" ctrlp{{{
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く
let g:ctrlp_show_hidden         = 1   " 隠しファイルも表示
let g:ctrlp_follow_symlinks     = 1
let g:ctrlp_custom_ignore = {
\    'dir':  '\v[\/](\.git|\.hg|\.svn|cookbooks)$',
\    'file': '\v\.(o|bk|org|exe|so|dll|skl|cgi|gitkeep)$',
\    'link': 'some_bad_symbolic_links',
\ }
nnoremap <Leader>ct :CtrlPTag<CR>
nnoremap <Leader>cb :CtrlPBuffer<CR>
nnoremap <Leader>ccc :CtrlPClearCache<CR>
" }}}

" quickrun {{{
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
\   },
\   "ruby/watchdogs_checker": {
\       "type"
\           : executable("rubocop") ? "watchdogs_checker/rubocop"
\           : executable("ruby") ? "watchdogs_checker/ruby"
\           : "",
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
" }}}

" yankround {{{
nnoremap <Space>y :Unite yankround<CR><Esc>
" }}}

" vim-clojure-static {{{
aug MyLispWords
    au!
	au FileType clojure set lispwords+=ns
    " compojure
	au FileType clojure set lispwords+=defroutes,GET,POST
    " misaki
	au FileType clojure set lispwords+=defvalidate,validate,testing,defhtml,bind-config,defcompilertest
    " midje
	au FileType clojure set lispwords+=facts,fact
    " conjure
	au FileType clojure set lispwords+=stubbing
aug END
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

aug MyRainbowParentheses
    au!
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
aug END
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
" }}}

" neocomplete {{{
if has('lua')
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
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory = $HOME . '/.vim/snippets'
aug NeoSnippetIndent
    au!
    autocmd FileType neosnippet set noexpandtab
aug END
" }}}

" vim-fireplace {{{
if has('unix')
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

" vim-fugitive, gitv {{{
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Glame<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit -av<CR>
nnoremap <Leader>gl :Gitv<CR>
" }}}

" lightline.vim {{{
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
" }}}

" auto-ctags {{{
if has("unix")
    let g:auto_ctags = 1
    let g:auto_ctags_directory_list = [$HOME . '/.tags']
    let g:auto_ctags_filetype_mode = 1
endif
" }}}

" unite-build {{{
nnoremap <Space>b :Unite build<CR>
" }}}

" vim-watchdog {{{
let g:watchdogs_check_BufWritePost_enable = 1
call watchdogs#setup(g:quickrun_config)
" }}}

" memolist.vim {{{
let g:memolist_path = $HOME . "/.vim/memo"
let g:memolist_memo_suffix = "md"
let g:memolist_template_dir_path = $HOME . "/.vim/template/memolist"
let g:memolist_ex_cmd = 'CtrlP'
nnoremap <Leader>mn :MemoNew<CR>
nnoremap <Leader>ml :MemoList<CR>
nnoremap <Leader>mg :MemoGrep<CR>
" }}}
