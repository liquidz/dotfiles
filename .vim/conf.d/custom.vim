set directory=$HOME/.vim/backup

" auto saving
aug MyAutoSaving
    au!
    autocmd CursorHold * update
aug END
set updatetime=300000 "5min

" external grep
if executable('pt')
    set grepprg=pt\ --nogroup\ -iS
    set grepformat=%f:%l:%m
endif
