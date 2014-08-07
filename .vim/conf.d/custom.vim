set directory=$HOME/.vim/backup

" auto saving
aug MyAutoSaving
    au!
    autocmd CursorHold * update
aug END
set updatetime=300000 "5min

aug MyIndent
    au!
    autocmd FileType vim set expandtab
    autocmd FileType php set noexpandtab
aug END
