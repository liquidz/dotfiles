set nocompatible

" for vim-ref
if has('win32')
    let &termencoding = &encoding
endif

" =encoding {{{
"    cf. http://www.kawaz.jp/pukiwiki/?vim
" 文字コードの自動認識
if &encoding !=# 'utf-8'
	set encoding=japan
	set fileencoding=japan
endif
if has('iconv')
	let s:enc_euc = 'euc-jp'
	let s:enc_jis = 'iso-2022-jp'
	" iconvがeucJP-msに対応しているかをチェック
	if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'eucjp-ms'
		let s:enc_jis = 'iso-2022-jp-3'
		" iconvがJISX0213に対応しているかをチェック
	elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'euc-jisx0213'
		let s:enc_jis = 'iso-2022-jp-3'
	endif
	" fileencodingsを構築
	if &encoding ==# 'utf-8'
		let s:fileencodings_default = &fileencodings
		let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
		let &fileencodings = &fileencodings .','. s:fileencodings_default
		unlet s:fileencodings_default
	else
		let &fileencodings = &fileencodings .','. s:enc_jis
		set fileencodings+=utf-8,ucs-2le,ucs-2
		if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
			set fileencodings+=cp932
			set fileencodings-=euc-jp
			set fileencodings-=euc-jisx0213
			set fileencodings-=eucjp-ms
			let &encoding = s:enc_euc
			let &fileencoding = s:enc_euc
		else
			let &fileencodings = &fileencodings .','. s:enc_euc
		endif
	endif
	" 定数を処分
	unlet s:enc_euc
	unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
	function! AU_ReCheck_FENC()
		if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
			let &fileencoding=&encoding
		endif
	endfunction
	autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
	set ambiwidth=double
endif
" }}}

" =search {{{
" -----------------------------------------------
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 検索結果をハイライト表示
set hlsearch
" インクリメンタルサーチ
set incsearch
" 自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
" }}}

" =visual {{{
" -----------------------------------------------
"  タブバーを表示
set showtabline=2
" タブの画面上での幅
set tabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" 行番号を非表示 (number:表示)
set nonumber
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set list
set listchars=tab:\ \ ,trail:_,eol:\ ,extends:>,precedes:>

" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 高度なインデント(?)
set smartindent
" 高度なタブ(?)
set smarttab
" シフト移動幅(?)
set shiftwidth=4

" カーソル行(ウインドウ分割対応版)
set cursorline
augroup cch
	autocmd! cch
	autocmd WinLeave * set nocursorline
	autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" ウインドウ分割時のサイズ自動調整OFF
set noequalalways
" }}}

" =fold {{{
" -----------------------------------------------
" 折りたたみ設定
set foldmethod=marker
set foldlevel=0
" }}}

" =buffer {{{
" -----------------------------------------------
" 変更中でも保存なしで他ファイルを表示
set hidden
" 変更を自動反映
set autoread
" }}}

" =system {{{
" -----------------------------------------------
" スワップファイル用
if has('win32')
    set directory=C:\backup
else
    set directory=$HOME/.backup
endif
" <Leader>をカンマ
let mapleader=","
let maplocalleader="\\"
" 自動保存 cf. http://user.ecc.u-tokyo.ac.jp/~tt076524/vim/autosave.html
autocmd CursorHold * update
set updatetime=300000 " 5min
" 編集中にsudo
command! Sudo :w !sudo tee %<CR>
" }}}

set tags=tags;

" =map {{{
" -----------------------------------------------
map <C-j> <Esc>
" }}}

" =nmap (ノーマルモード) {{{
" -----------------------------------------------
nmap <C-j> <Esc>
" 最後に編集したところへ移動
nmap <Leader>. `.zz
" }}}

" =nnoremap {{{
" -----------------------------------------------
" Esc２回で検索ハイライトをクリア
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <C-j><C-j> :nohlsearch<CR><Esc>
" marks
nnoremap <Leader>m :marks<CR>
" バッファ関連
"nnoremap [Buf] <Nop>
"nmap <C-b> [Buf]
"nnoremap [Buf]h :<C-u>bp<CR>
"nnoremap [Buf]l :<C-u>bn<CR>
"nnoremap [Buf]0 :<C-u>bf<CR>
"nnoremap [Buf]$ :<C-u>bl<CR>
"nnoremap [Buf]n :<C-u>badd<CR>
"http://nanasi.jp/articles/vim/kwbd_vim.html
nnoremap [Buf]q :<C-u>:Kwbd<CR>
" タブ関連
nnoremap [Tab] <Nop>
nmap <C-t> [Tab]
nnoremap [Tab]n :<C-u>tabnew<CR>
nnoremap [Tab]c :<C-u>tabclose<CR>
nnoremap [Tab]o :<C-u>tabonly<CR>
nnoremap [Tab]j :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
nnoremap [Tab]k gT
nnoremap [Tab]a :<C-u>tab ball
nnoremap [Tab]h :<C-u>tabp<CR>
nnoremap [Tab]l :<C-u>tabn<CR>
nnoremap [Tab]0 :<C-u>tabfirst<CR>
nnoremap [Tab]$ :<C-u>tablast<CR>
nnoremap >> :<C-u>tabp<CR>
nnoremap >> :<C-u>tabn<CR>
" タグ関連
nnoremap [Tag] <Nop>
nmap <Leader>t [Tag]
nnoremap [Tag]t <C-]>
nnoremap [Tag]b :<C-u>pop<CR>
nnoremap [Tag]u :<C-u>!ctags -R<CR><Esc><Esc>
" Window
nnoremap <C-w><C-w> <C-w>r

" ; を : に、: を ; に
nnoremap ; :
nnoremap : ;
" z で末尾
nnoremap zz zz
nnoremap z $
" fold
nnoremap [Fold] <Nop>
nmap <C-f> [Fold]
nnoremap [Fold]m zm
nnoremap [Fold]R zR
nnoremap [Fold]c zc
nnoremap [Fold]f zf
" mark jump
" help
nnoremap <C-h> :<C-u>help<Space>
" paste
nnoremap <C-y> i<C-r><C-o>+<Esc>l

" スペルチェックのOn/Off
nnoremap s <Nop>
nnoremap ss :<C-u>set spell!<CR>

" 対応する括弧に移動
nnoremap > %
nnoremap < %

" 今いる括弧をもひとつ括弧でくくる(Lisp用)
nnoremap <Leader>( F(i(<Esc><Right>%a)<Esc>%a<Space><Left>
nnoremap <Leader>[ F[i[<Esc><Right>%a]<Esc>%a<Space><Left>
nnoremap <Leader>{ F{i{<Esc><Right>%a}<Esc>%a<Space><Left>
" 単語を括弧でくくる
"nnoremap <Leader>w( bi(<Esc>f<Space>i)<Esc>%a<Space><Left>
" 一番近い括弧とその関数名を削除する
"nnoremap <Leader>d( F(<Right>dwF(xf)x
" 強制的にWinEnterイベントを発生(要Unite)
" autoreadを明示的に行うため
nnoremap <C-l><C-l> :Unite buffer<CR>:q<CR>
" }}}

" =cnoremap (コマンドモード) {{{
" -----------------------------------------------
cmap <C-j> <Esc>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
" }}}

" =command {{{
" -----------------------------------------------
command! ToUTF8 set fileencoding=utf-8
command! ToEUC set fileencoding=euc-jp
command! ToSJIS set fileencoding=sjis
command! Reload source $HOME/.vimrc
function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)
" }}}

" =imap {{{
imap () ()<Left>
imap [] []<Left>
imap {} {}<Left>
imap "" ""<Left>
imap '' ''<Left>
" }}}

" =inoremap (挿入モード) {{{
" -----------------------------------------------
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-j> <Esc>
" paste
inoremap <C-y> <C-r><C-o>+
" date, time print
inoremap <Leader>date <C-R>=strftime('%Y-%m-%d')<CR>
inoremap <Leader>time <C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR>
"<TAB>でOmni補完
function! InsertTabWrapper()
	if pumvisible()
		return "\<c-n>"
	endif
	let col = col('.') - 1
	if !col || getline('.')[col -1] !~ '\k\|<\|/'
		return "\<tab>"
	elseif exists('&omnifunc') && &omnifunc == ''
		return "\<c-n>"
	else
		return "\<c-x>\<c-o>"
	endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
" }}}

" =vmap (ビジュアルモード) {{{
vmap <C-j> <Esc>
vnoremap z $
if has("win32")
    vnoremap <C-c> "*y
endif

" ビジュアルモードでインデントしても選択したままにする
vnoremap < <gv
vnoremap > >gv
" }}}

" =statusline {{{
" -----------------------------------------------
set statusline=[%n]\ 						" バッファ番号
set statusline+=%f\ 						" 相対ファイル名
set statusline+=%m\ 						" バッファ状態[+]
set statusline+=%r							" 読み取り専用フラグ
set statusline+=%<%=						" 右寄せ
set statusline+=%{'['.(GitBranch()).']'}\ 	" git branch
set statusline+=%{'['.(&fenc!=''?&fenc:'?').'-'.&ff.']'}\ 	" フォーマット＆文字コード
set statusline+=%y\ 						" タイプ
set statusline+=%4l,%2c\ 					" 行、列
set statusline+=%3p%%\ 						" 何％
set laststatus=2
" }}}

" neobundle.vim {{{
set nocompatible
filetype off

if has('vim_starting')

    if has("win32")
        set runtimepath+=c:\opt\bundle\neobundle.vim
        call neobundle#rc(expand('c:\opt\bundle'))

        let g:neobundle#log_filename = 'c:\opt\log'
    else
        set runtimepath+=~/.vim/bundle/neobundle.vim/
        call neobundle#rc(expand('~/.vim/bundle/'))
    endif
endif
"NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'thinca/vim-ref'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'motemen/git-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'tpope/vim-classpath'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'liquidz/lein-vim'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'kana/vim-submode'
NeoBundle 'liquidz/vimfiler-sendto'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'taka84u9/unite-git'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'vim-scripts/VOoM'
NeoBundle 'adimit/prolog.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kana/vim-surround'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'w0ng/vim-hybrid'

"NeoBundle 'git://github.com/ujihisa/shadow.vim.git'

filetype plugin indent on
" }}}

" neocomplcache {{{
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_lock_buffer_name_pattern = '*wiki*'
"imap <C-l> <Plug>(neocomplcache_snippets_expand)
" }}}

" =projects.vim {{{
" ファイルを開いたら Project は閉じる
let g:proj_flags = "imstc"
nnoremap <silent> <Leader>p :Project<CR>

" 畳み込みを開いた状態にする
autocmd BufAdd .vimprojects silent! %foldopen!

" load current directory .vimprojects
" ~/.vim/after/plugin/project.vim
" }}}

" =unite.vim {{{
nnoremap <Leader>. :Unite file_mru<CR>
nnoremap <Leader>f :Unite file<CR>
nnoremap <Leader>b :Unite buffer<CR>
nnoremap <Leader>todo :Unite git_grep:TODO<CR>
nnoremap <Leader>grep :Unite git_grep:
" }}}

" =java settings {{{
if !exists("g:java_compiler") || g:java_compiler == ""
	let g:java_compiler = "javac"
endif
if !exists("g:java_executor") || g:java_executor == ""
	let g:java_executor = "java"
endif

function! CompileJava()
	execute printf("!%s -d . %%", g:java_compiler)
endfunction

function! ExecuteJava()
	execute printf("!%s %%<", g:java_executor)
endfunction
" }}}

" =git.vim {{{
nnoremap <Leader>gc :GitCommit -m ""<Left>
nnoremap <Leader>gp :GitPush<Enter>
" }}}

"=vimfiler {{{

let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_sort_type = "Time"
let g:vimfiler_sendto = {
\   'test' : 'test %d %p - %f - %F'
\ , 'unzip' : 'unzip %f'
\ , 'zip' : 'zip -r %F.zip %*'
\ , 'tar' : 'tar cvfz %d%N.tar.gz %*'
\ , 'Inkscape ベクターグラフィックエディタ' : 'inkspace &'
\ , 'GIMP 画像エディタ' : 'gimp %* &'
\ , 'gedit' : 'gedit &'
\ , 'totem' : 'totem %* &'
\ }

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
        nmap <buffer> h <Plug>(vimfiler_smart_h)zz
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
        " incremental search
        "nnoremap <buffer> / /^\s*\(\|-\\|\|+\\|+\\|-\) \zs
    endfunction
aug END

"}}}

" =submode {{{
let g:submode_timeout = 0
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

call submode#enter_with('tab', 'n', '', '<C-t><C-t>', '<Nop>')
call submode#leave_with('tab', 'n', '', '<Esc>')
call submode#map('tab', 'n', '', 'n', ':<C-u>tabnew<CR>')
call submode#map('tab', 'n', '', 'j', ':<C-u>tabn<CR>')
call submode#map('tab', 'n', '', 'k', ':<C-u>tabp<CR>')
call submode#map('tab', 'n', '', 'l', ':<C-u>tabn<CR>')
call submode#map('tab', 'n', '', 'h', ':<C-u>tabp<CR>')
" }}}

" =vim-clojure-static {{{
let g:clojure_align_multiline_strings = 1


let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" }}}

" =lightline.vim {{{
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'component': {
    \   'readonly': '%{&readonly?"(R)":""}'
    \   }
    \ }
" }}}

" =voom {{{
if has('win32')
    nnoremap <Leader>vom :open C:\opt\voom\main.md<CR>:Voom markdown<CR>
else
    nnoremap <Leader>vom :open $HOME/.vim/voom/main.md<CR>:Voom markdown<CR>
endif
nnoremap <Leader>vog :Voomgrep 
" }}}

" =vim-ref {{{

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
let g:ref_clojure_cmd = ['java', '-cp', $HOME . '/.m2/repository/org/clojure/clojure/1.5.1/clojure-1.5.1.jar', 'clojure.main']
nnoremap <Leader>dic :Ref webdict 

"augroup vimrc-checktime
"	au FileType php nnoremap L <Nop>
"	au FileType php nnoremap LL :<C-u>source %<CR>
"augroup END
" }}}

" smartchr
"inoremap <expr> = smartchr#one_of(' = ', ' == ', ' === ', '=')

let g:echodoc_enable_at_startup = 1

" vimshell
let g:vimshell_user_prompt = '"(" . getcwd() . ")"'
let g:vimshell_prompt = '$ '
"let g:vimshell_right_prompt = 'vimshell#vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
let g:vimshell_ignore_case = 1
let g:vimshell_smart_case = 1
nnoremap <Leader>is :VimShell<CR>


function! s:system_jark(command)
    "let cmd = 'jark ' . b:vimclojure_namespace . ' ' . a:command
    let result = system('jark ns load ' . expand('%'))
    echo(system('jark ' . b:vimclojure_namespace . ' ' . a:command))
endfunction

augroup vimrc-checktime
	autocmd!
	autocmd WinEnter * checktime
augroup END


"function! s:compile_cljs()
"	let pwd = getcwd()
"endfunction


" =auto command {{{
aug MyAutoCommand
	au!
	" C
	au FileType c nnoremap <Leader>cc :make clean<CR><Esc><Esc>:make!<CR>
	au FileType c nnoremap <Leader>c :copen<CR>
	au FileType c nnoremap <Leader>c0 :cc<CR>

	" vim script
	au FileType vim nnoremap L <Nop>
	au FileType vim nnoremap LL :<C-u>source %<CR>
	au FileType vim nnoremap LS :<C-u>Reload<CR>
	" XML, HTML補完
	autocmd FileType xml inoremap <buffer> </ </<C-x><C-o>
	autocmd FileType html inoremap <buffer> </ </<C-x><C-o>
	autocmd FileType jsp inoremap <buffer> </ </<C-x><C-o>
	" javafx
	au FileType fx :let! g:java_compiler = "javafxc"
	au FileType fx :let! g:java_executor = "javafx"
	" java
	au FileType java command! Javac :call CompileJava()<CR>
	au FileType java command! Java :call ExecuteJava()<CR>
	au FileType java nmap <Leader>jc :Javac<CR>
	au FileType java nmap <Leader>jj :Java<CR>
	" schemeインデント設定
	au FileType scheme setl cindent& lispwords=define 
	" cd.vim
	au BufEnter * execute ":lcd " . expand("%:p:h")
	" scheme.vim
	" Gauche対応シンタックス(http://e.tir.jp/wiliki?vim%3Ascheme.vim)
	au FileType scheme :let is_gauche=1
	" scala
	"   make
	au FileType scala set makeprg=ant\ -find\ build.xml
	au FileType scala set efm=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,\%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
	"   scalac
	au FileType scala :let g:java_compiler = "scalac"
	au FileType scala :let g:java_executor = "scala"
	au FileType scala command! Scalac :call CompileJava()<CR>
	au FileType scala command! Scala :call ExecuteJava()<CR>
    " kawa(scheme) make
	au FileType scheme set makeprg=ant\ -find\ build.xml
	au FileType scheme set efm=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,\%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

	" java
	au FileType java set makeprg=ant\ -find\ build.xml

    " clojure lein test
	"au FileType clojure nnoremap <Leader>lr :ClojureRepl<CR>
    "au FileType clojure inoremap <Leader>lu <C-R>\(use 'test-this)<CR>
    "au FileType clojure inoremap <Leader>lt <C-R>\(run-tests)<CR>
    "au FileType clojure nnoremap <Leader>lt G$a(run-tests)

    " clojure fireplace
    au FileType clojure nmap <Leader>D <Plug>FireplaceDjump
    au FileType clojure nmap <Leader>W <Plug>FireplaceDsplit
	
	" clojure additional indent
	au FileType clojure set lispwords+=defproject,defsentence,deftest,are,deftest=,defroutes,GET,POST,if-let-and
    " misaki
	au FileType clojure set lispwords+=defvalidate,validate,testing,defhtml,bind-config,defcompilertest
    " midje
	au FileType clojure set lispwords+=facts,fact

    " rainbow
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces

aug END

" }}}

augroup templatedload
	autocmd!
	autocmd BufNewFile *.html 0r ~/.vim/template/html.html
	autocmd BufNewFile *.htm  0r ~/.vim/template/html.html
	autocmd BufNewFile *.js   0r ~/.vim/template/js.js
	autocmd BufNewFile *.clj  0r ~/.vim/template/clj.clj
	autocmd BufNewFile *.md   0r ~/.vim/template/md.md
augroup END

inoreabbrev <expr> **** repeat('*', 50 - col('.'))
inoreabbrev <expr> ---- repeat('-', 50 - col('.'))
inoreabbrev <expr> ==== repeat('=', 50 - col('.'))

" -----------------------------------------------
syntax on
filetype on
filetype plugin on
filetype plugin indent on
colorscheme hybrid

"let vimclojure#WantNailgun = 1
let vimclojure#NailgunPort = 2113
if has('mac')
    "echo "this is unix"
    let vimclojure#NailgunClient="/Users/uochan/bin/ng"
else
    "echo "this is mac"
    let vimclojure#NailgunClient="/home/masa/bin/ng"
endif
"let vimclojure#NailgunClient="/home/masa/bin/ng"
let vimclojure#HighlightBuiltins = 1
let vimclojure#SplitPos = "right"
let vimclojure#SplitSize = 35
let vimclojure#ParenRainbow = 1
let g:clj_paren_rainbow = 1

" quickrun
let b:quickrun_config = {'outputter/buffer/split': 10}
let g:quickrun_config = {}
let g:quickrun_config.markdown = {
            \ 'outputter': 'null',
            \ 'command'  : 'open',
            \ 'cmdopt'   : '-a',
            \ 'args'     : 'Marked',
            \ 'exec'     : '%c %o %a %s'
            \ }
let g:quickrun_config.javascript = {
            \ 'command'  : 'phantomjs',
            \ 'args'     : $HOME . '/opt/js/underscore/underscore-min.js',
            \ 'exec'     : '%c %s %a'
            \ }


highlight SpecialKey ctermfg=green

" 全角スペースを視覚化
highlight JpSpace cterm=underline ctermbg=blue
aug MyJpSpace
	au!
	au BufNewFile,BufRead * match JpSpace /　/
aug END

if !has("win32")
    NeoBundleCheck
endif
