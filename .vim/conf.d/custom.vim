set directory=$HOME/dotfiles/.vim/backup

" auto saving
aug MyAutoSaving
    au!
    autocmd CursorHold * update
aug END
set updatetime=300000 "5min

aug MyIndent
    au!
    autocmd FileType php set noexpandtab
aug END

aug MyTemplate
    au!
	autocmd BufNewFile *.clj  0r $HOME/.vim/template/clj.clj
	autocmd BufNewFile *.html 0r $HOME/.vim/template/html.html
	autocmd BufNewFile *.htm  0r $HOME/.vim/template/html.html
	autocmd BufNewFile *.js   0r $HOME/.vim/template/js.js
	autocmd BufNewFile *.go   0r $HOME/.vim/template/go.go
	autocmd BufNewFile *.sh   0r $HOME/.vim/template/sh.sh
aug END
