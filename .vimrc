"                                ____
"               ,--,           ,'  , `.
"             ,--.'|        ,-+-,.' _ |  __  ,-.
"        .---.|  |,      ,-+-. ;   , ||,' ,'/ /|
"      /.  ./|`--'_     ,--.'|'   |  ||'  | |' | ,---.
"    .-' . ' |,' ,'|   |   |  ,', |  |,|  |   ,'/     \
"   /___/ \: |'  | |   |   | /  | |--' '  :  / /    / '
"   .   \  ' .|  | :   |   : |  | ,    |  | ' .    ' /
"    \   \   ''  : |__ |   : |  |/     ;  : | '   ; :__
"  ___\   \   |  | '.'||   | |`-'      |  , ; '   | '.'|
" /  .\\   \ |;  :    ;|   ;/           ---'  |   :    :
" \  ; |'---" |  ,   / '---'                   \   \  /
"  `--"        ---`-'                           `----'

" basic {{{

if &compatible
  set nocompatible " for gvim on windows
endif
set modeline
set modelines=3
set textwidth=0
let g:vim_indent_cont = 4

if has('unix')
  set nofixendofline
endif

if !has('nvim')
  set cryptmethod=blowfish2
endif

" }}}
" encoding {{{

set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp

"set fileencoding=utf-8
"set fileencodings=utf-8,cp932
"if &encoding !=# 'utf-8'
"  set encoding=japan
"  set fileencoding=japan
"endif
"if has('iconv')
"  let s:enc_euc = 'euc-jp'
"  let s:enc_jis = 'iso-2022-jp'
"  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'eucjp-ms'
"    let s:enc_jis = 'iso-2022-jp-3'
"  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'euc-jisx0213'
"    let s:enc_jis = 'iso-2022-jp-3'
"  endif
"  if &encoding ==# 'utf-8'
"    let s:fileencodings_default = &fileencodings
"    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
"    let &fileencodings = &fileencodings .','. s:fileencodings_default
"    unlet s:fileencodings_default
"  else
"    let &fileencodings = &fileencodings .','. s:enc_jis
"    set fileencodings+=utf-8,ucs-2le,ucs-2
"    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
"      set fileencodings+=cp932
"      set fileencodings-=euc-jp
"      set fileencodings-=euc-jisx0213
"      set fileencodings-=eucjp-ms
"      let &encoding = s:enc_euc
"      let &fileencoding = s:enc_euc
"    else
"      let &fileencodings = &fileencodings .','. s:enc_euc
"    endif
"  endif
"  unlet s:enc_euc
"  unlet s:enc_jis
"endif
"if has('autocmd')
"  function! AU_ReCheck_FENC()
"    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
"      let &fileencoding=&encoding
"    endif
"  endfunction
"
"  augroup check_fenc
"    autocmd BufReadPost * call AU_ReCheck_FENC()
"  augroup END
"endif
scriptencoding utf-8

" }}}
" color scheme {{{

syntax enable
colorscheme desert

" }}}
" search {{{

set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" }}}
" paste {{{

set pastetoggle=<C-e>

" }}}
" visual {{{

set showtabline=2
set tabstop=4
set expandtab
set autoindent
set backspace=indent,eol,start
set showmatch
set wildmenu
set formatoptions+=mM
set nonumber
set ruler
set list
set listchars=tab:>-,trail:_,eol:\ ,extends:>,precedes:>
set wrap
set cmdheight=2
set showcmd
set smartindent
set smarttab
set shiftwidth=4
set noequalalways
set cursorline
set breakindent
set nocursorcolumn
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" }}}
" fold {{{

set foldmethod=marker
set foldlevel=2

" }}}
" buffer {{{

set hidden
set autoread

" }}}
" system {{{

let mapleader=','
let maplocalleader=' ' "<space>

" }}}
" spell {{{

set spelllang=en,cjk " スペルチェック時に日本語は除外する
nnoremap <silent> ss :<C-u>setlocal spell!<CR>

" }}}
" mapping {{{

nnoremap <C-j> <Esc>
cnoremap <C-j> <Esc>
inoremap <C-j> <Esc>
inoremap jj <Esc>
vnoremap <C-j> <Esc>

if !has('nvim')
  tnoremap <Esc> <C-\><C-n>
else
  tnoremap <Esc> <C-W>N
  set notimeout ttimeout timeoutlen=100
endif

" Linux 上では xkb を使って入れ替えているため
if system('uname') !=# "Linux\n"
  nnoremap ; :
  nnoremap : ;
endif

nnoremap > %
nnoremap < %

cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Delete>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

inoremap () ()<Left>
inoremap [] []<Left>
inoremap {} {}<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>

nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <silent> <C-j><C-j> :nohlsearch<CR><Esc>

nnoremap <Leader><Leader> :<C-u>Ex<CR>
nnoremap <C-]> g<C-]>

nnoremap <Nul> za
if has('win32')
  nnoremap <C-Space> za
endif

nnoremap QQ :<C-u>bd!<CR>

nnoremap <LocalLeader>gg :terminal ++close tig<CR>

" }}}
" copy to clipboard {{{

if has('win32')
  vnoremap <C-c> "*y
  " paste from clipboard
  nnoremap <C-y> i<C-r><C-o>+<Esc>l
  cnoremap <C-y> <C-r><C-o>+
  inoremap <C-y> <C-r><C-o>+
endif
if system('uname') ==# "Darwin\n"
  set clipboard=unnamed,autoselect
endif

" viminfo 経由でヤンクデータを共有
" c.f. http://shirakiya.hatenablog.com/entry/2015/01/30/025257
if system('uname') ==# "Linux\n"
  nnoremap sss :wv<CR>:rv!<CR>
endif

" }}}
" tab {{{

nnoremap tn :<C-u>tabnew<CR>
nnoremap th :<C-u>tabp<CR>
nnoremap tl :<C-u>tabn<CR>
nnoremap t0 :<C-u>tabfirst<CR>
nnoremap t$ :<C-u>tablast<CR>

" }}}
" command {{{

command! ToUTF8 set fileencoding=utf-8
command! ToEUC  set fileencoding=euc-jp
command! ToSJIS set fileencoding=sjis
command! ToUNIX set fileformat=unix
command! ReloadVimrc source $HOME/src/github.com/liquidz/dotfiles/.vimrc

" }}}
" auto command {{{

aug MyAutoCompletion
  au!
  " XML, HTML補完
  autocmd FileType eruby,html,xml,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType xml,html inoremap <buffer> </ </<C-x><C-o>
aug END

aug MyAutoOpenCWindow
  au!
  autocmd QuickFixCmdPost *grep* cwindow
  "autocmd QuickFixCmdPost l* lopen
aug END

if $TMUX !=# ''
  augroup titlesettings
    autocmd!
    autocmd BufEnter * call system("tmux rename-window " . "'[vim] " . expand("%:t") . "'")
    autocmd VimLeave * call system("tmux rename-window zsh")
    autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
  augroup END
endif

" }}}
" status line {{{

set statusline=[%n]\        " バッファ番号
set statusline+=%f\         " 相対ファイル名
set statusline+=%m\         " バッファ状態[+]
set statusline+=%r          " 読み取り専用フラグ
set statusline+=%<%=        " 右寄せ
set statusline+=%{'['.(&fenc!=''?&fenc:'?').'-'.&ff.']'}\   " フォーマット＆文字コード
set statusline+=%y\         " タイプ
set statusline+=%4l,%2c\    " 行、列
set statusline+=%3p%%\      " 何％
set laststatus=2

" }}}
" omni completion {{{

function! InsertTabWrapper(type)
  let col = col('.') - 1
  "omni補完の場合、omini以外にも上下左右の移動もする
  if a:type ==# 'omni'
    if pumvisible()
      return "\<c-n>"
    endif
    if !col || getline('.')[col - 1] !~# '\k\|<\|/'
      return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc ==# ''
      return "\<c-n>"
    else
      return "\<c-x>\<c-o>"
    endif
    "keywordの場合、該当のとき以外は何もしない
  else
    if pumvisible() || !col || getline('.')[col - 1] !~# '\k\|<\|/'
      return ''
    else
      return "\<c-x>\<c-p>"
    endif
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper('omni')<cr><c-r>=InsertTabWrapper('keyword')<cr>

" }}}
" matchit {{{

source $VIMRUNTIME/macros/matchit.vim
let b:match_ignorecase = 1

" }}}
" netrc {{{

aug MyNetrw
  au!
  au FileType netrw nnoremap <buffer> q :q<CR>
  au FileType netrw nmap <buffer> l <CR>
  au FileType netrw nmap <buffer> h -
  au FileType netrw nmap <buffer> <space> mfj
aug END

let g:netrw_banner = 0

" show preview in split right window
let g:netrw_preview = 1
let g:netrw_alto = &spr

" }}}
" other {{{

set wildignore=*.o,*.bk,*.org,*.exe,*.so
    \,*.dll,*.swp,*.zip,*.pyc,.gitkeep
" }}}
" load conf.d {{{

set runtimepath+=$HOME/.vim/
runtime! conf.d/*.vim

" }}}
" vim:fdl=0
