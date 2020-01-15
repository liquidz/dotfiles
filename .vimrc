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
set signcolumn=yes
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

" let mapleader=','
" let maplocalleader=' ' "<space>
let mapleader=' ' "<space>
let maplocalleader=','

" }}}
" spell {{{

set spelllang=en,cjk " スペルチェック時に日本語は除外する
nnoremap <silent> ss :<C-u>setlocal spell!<CR>

" }}}
" mapping {{{

inoremap jj <Esc>
cnoremap jj <Esc>
inoremap jk <Esc>

nnoremap <C-k> {
nnoremap <C-j> }
vnoremap <C-k> {
vnoremap <C-j> }
cnoremap <C-j> <Esc>
inoremap <C-j> <Esc>
"vnoremap <C-j> <Esc>

nnoremap mz :<C-u>10messages<CR>

nnoremap zk ^
nnoremap zp %
nnoremap zh 0
nnoremap zl $

inoremap zp %
inoremap zk ^
inoremap zl -
inoremap zj _

cnoremap zk ^
cnoremap zl -
cnoremap zj _

nnoremap <LocalLeader>sh :<C-u>terminal ++close zsh<CR>
tnoremap zk ^
tnoremap zl -
tnoremap zj _

" git commit じゃない場合
if $HOME ==# $USERPROFILE || $GIT_EXEC_PATH !=# ''
  " Esc で terminal から抜け出せるようにする
  if !has('nvim')
    tnoremap <Esc> <C-\><C-n
  else
    tnoremap <Esc> <C-\><C-n>
    set notimeout ttimeout timeoutlen=100
  endif
end

" Linux 上では xkb を使って入れ替えているため
"if system('uname') !=# "Linux\n"
  nnoremap ; :
  nnoremap : ;
"endif

nnoremap > %
nnoremap < %

" command-line window を開く
cnoremap <C-e> <C-f>
" カーソル移動など
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
" 補完のポップアップ上でのカーソル移動
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Esc>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

nnoremap <LocalLeader><LocalLeader> :<C-u>Ex<CR>
nnoremap <C-]> g<C-]>

" <Nul> means Ctrl+Space in terminal
nnoremap <Nul> za
if has('win32')
  nnoremap <C-Space> za
endif

" auto indent 後に insert mode を抜けても indent を削除しないようにする
" c.f. https://vim-jp.org/vim-users-jp/2010/04/06/Hack-137.html
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>

nnoremap QQ :<C-u>bd!<CR>

" }}}
" copy to clipboard {{{

if has('win32')
  vnoremap <C-c> "*y
  " paste from clipboard
  nnoremap <C-y> i<C-r><C-o>+<Esc>l
  cnoremap <C-y> <C-r><C-o>+
  inoremap <C-y> <C-r><C-o>+
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
  autocmd QuickFixCmdPost grep cwindow
  "autocmd QuickFixCmdPost l* lopen
aug END

function! s:clean_extra_spaces() abort
  if &ft ==# 'help' | return | endif
  let v = winsaveview()
  try
    exec ':%s/\s\+$//ge'
  finally
    call winrestview(v)
  endtry
endfunction

aug MyAutoDeleteExtraSpaces
  au!
  autocmd BufWritePre * call s:clean_extra_spaces()
aug END

" if $TMUX !=# ''
"   augroup titlesettings
"     autocmd!
"     autocmd BufEnter * call system("tmux rename-window " . "'[vim] " . expand("%:t") . "'")
"     autocmd VimLeave * call system("tmux rename-window zsh")
"     autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
"   augroup END
" endif

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

function! MyComplete() abort
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~# '\k\|<\|/'
    return "\<tab>"
  endif

  " let c = nr2char(getchar())
  " if c ==# 'j'
  "   return "\<c-x>\<c-n>"
  " elseif c ==# 'k'
  "   return "\<c-x>\<c-p>"
  " elseif c ==# 'f'
  "   return "\<c-x>\<c-f>"
  " else
  "   return "\<c-x>\<c-o>"
  " endif
  return "\<c-x>\<c-o>"
endfunction

inoremap <expr><tab> pumvisible() ? "\<c-n>" : MyComplete()

" }}}
" matchit {{{

source $VIMRUNTIME/macros/matchit.vim
let b:match_ignorecase = 1

" }}}
" netrw {{{

aug MyNetrw
  au!
  au FileType netrw nnoremap <buffer> q :close<CR>
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

set grepprg=git\ grep\ --no-index\ -I\ --line-number\ --no-color

" }}}
" load conf.d {{{

set runtimepath+=$HOME/.vim/
runtime! conf.d/*.vim
exec printf(':runtime! conf.d/%s/*.vim', hostname())

" }}}
" vim:fdl=0
