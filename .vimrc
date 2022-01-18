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


" let g:did_install_default_menus = 1
" let g:did_install_syntax_menu   = 1
" let g:did_indent_on             = 1
" let g:did_load_filetypes        = 1
" let g:did_load_ftplugin         = 1
" let g:loaded_2html_plugin       = 1
" let g:loaded_gzip               = 1
" let g:loaded_man                = 1
" let g:loaded_matchit            = 1
" let g:loaded_matchparen         = 1
" let g:loaded_netrwPlugin        = 1
" let g:loaded_remote_plugins     = 1
" let g:loaded_shada_plugin       = 1
" let g:loaded_spellfile_plugin   = 1
" let g:loaded_tarPlugin          = 1
" let g:loaded_tutor_mode_plugin  = 1
" let g:loaded_zipPlugin          = 1
" let g:skip_loading_mswin        = 1

" basic {{{

if &compatible
  set nocompatible " for gvim on windows
endif
set modeline
set modelines=3
set textwidth=0
set hidden

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

set pastetoggle=<C-x><C-p>

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
" :hi clear CursorLine
" :hi CursorLine gui=underline
" highlight CursorLine ctermbg=black guibg=black

" }}}
" fold {{{

set foldmethod=marker
set foldlevel=2

" }}}
" buffer {{{

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

nnoremap mz :<C-u>10messages<CR>

nnoremap <LocalLeader>sh :<C-u>terminal ++close zsh<CR>

" git commit の画面である場合
if $HOME ==# $USERPROFILE || $GIT_EXEC_PATH !=# ''
  " Esc で terminal から抜け出せるようにする
  if !has('nvim')
    tnoremap <Esc> <C-\><C-n
  else
    tnoremap <Esc> <C-\><C-n>
    set notimeout ttimeout timeoutlen=100
  endif
end

" Mac 上では Karabiner-Elements を使って入れ替えているため
if system('uname') !=# "Darwin\n"
  nnoremap ; :
  nnoremap : ;
endif

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

nnoremap <LocalLeader><LocalLeader> <Cmd>e %:h<CR>
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

" コマンドラインでのTab補完時に smartcase を無効にする
" 途中まで case sensitive、途中から case insensible で書いても
" 補完できるようにする
set wildcharm=<Tab>
cnoremap <expr> <Tab> '<Cmd>set nosmartcase<CR><Tab><Cmd>let &smartcase = ' .. &smartcase .. '<CR>'

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
command! LastSession source $HOME/.my_last_session

" }}}
" auto command {{{
aug MyAutoOpenCWindow
  au!
  autocmd QuickFixCmdPost grep cwindow
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


if !has('nvim')
  aug MyWinColor
    au!
    " c.f. iceberg の Normal ハイライト
    "      ctermfg=252 ctermbg=234 guifg=#c6c8d1 guibg=#16182
    au ColorScheme * highlight NormalNC ctermfg=244 ctermbg=233
    au WinEnter,BufWinEnter * setlocal wincolor=
    au WinLeave * setlocal wincolor=NormalNC
  aug END
endif

aug MySaveSession
	au!
	au VimLeavePre * mksession! $HOME/.my_last_session
aug END

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

" zip ファイルの更新は行えないようにする
" これにより Clojure の REPL 上で定義ジャンプした先への変更を誤って記録しないようにする
" https://vim-jp.org/vimdoc-ja/pi_zip.html
let g:zip_zipcmd= ''

" }}}
" load conf.d {{{

if has('nvim')
  set runtimepath+=$HOME/.vim/
endif
" if has('nvim')
"   runtime! conf.nvim.d/*.vim
" endif

runtime! conf.d/*.vim
"runtime! conf.test/*.vim
exec printf(':runtime! conf.d/%s/*.vim', hostname())

" }}}
