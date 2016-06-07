scriptencoding utf-8

let s:path = expand('~/.vim/cache')
let s:toml_dir = expand('~/.vim/conf.d')

if &compatible
  set nocompatible
endif
set runtimepath^=$HOME/.vim/cache/repos/github.com/Shougo/dein.vim

let s:toml      = s:toml_dir . '/dein.toml'
let s:toml_lazy = s:toml_dir . '/dein.lazy.toml'

if dein#load_state(s:path)
  call dein#begin(s:path, [expand('<sfile>')]
      \ + split(glob('~/.vim/conf.d/*.toml'), '\n'))

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif

" developing plugins
" http://www.kaoriya.net/blog/2015/12/01/vim-switch-developing-plugin/
let dirs = [ $HOME.'/src/github.com/liquidz' ]
for pattern in [ 'vim*', '*vim' ]
  for path in globpath(join(dirs, ','), pattern, 0, 1)
    if isdirectory(path) && filereadable(path . '/VIM_AUTO_RTP')
      "echomsg "VIM_AUTO_RTP: ".path
      let &runtimepath = &runtimepath.','.path
    end
  endfor
endfor

" vim:fdl=0
