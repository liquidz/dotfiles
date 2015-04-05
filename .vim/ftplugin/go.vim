filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

set tags+=$HOME/.tags/go.tags
set noexpandtab

exe 'set rtp+=' . globpath($GOPATH, 'src/github.com/nsf/gocode/vim')
