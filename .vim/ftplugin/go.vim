set tags+=$HOME/.tags/go.tags
set noexpandtab

exe 'set rtp+=' . globpath($GOPATH, 'src/github.com/nsf/gocode/vim')

nnoremap <buffer> <Leader>t :<C-u>GoTest<CR>
