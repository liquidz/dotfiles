scriptencoding utf-8

if 1 && filereadable($VIM . '/gvimrc_local.vim')
  source $VIM/gvimrc_local.vim
  if exists('g:gvimrc_local_finish') && g:gvimrc_local_finish != 0
    finish
  endif
endif

if 0 && exists('$HOME') && filereadable($HOME . '/.gvimrc_first.vim')
  unlet! g:gvimrc_first_finish
  source $HOME/.gvimrc_first.vim
  if exists('g:gvimrc_first_finish') && g:gvimrc_first_finish != 0
    finish
  endif
endif

if 1 && (!exists('g:no_gvimrc_example') || g:no_gvimrc_example == 0)
  source $VIMRUNTIME/gvimrc_example.vim
endif

colorscheme hybrid

if has('win32')
  set guifont=VL_Gothic:h10
  " 行間隔の設定
  set linespace=1
  " 一部のUCS文字の幅を自動計測して決める
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif has('mac')
  set guifont=Osaka－等幅:h14
elseif has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
endif

set columns=80
set lines=25
set cmdheight=2

if has('multi_byte_ime') || has('xim')
  highlight CursorIM guibg=Purple guifg=NONE
  set iminsert=0 imsearch=0
endif

set mouse=a
set nomousefocus
set mousehide

if &guioptions =~# 'M'
  let &guioptions = substitute(&guioptions, '[mT]', '', 'g')
endif

if has('printer')
  if has('win32')
    set printfont=VL_Gothic:h10
  endif
endif

" ツールバーを非表示
set guioptions-=T
" メニューバーを非表示
set guioptions-=menu
set guioptions+=menu
set guioptions-=menu
