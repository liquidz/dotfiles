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

aug MyTags
    au!
    au BufNewFile,BufRead *.clj set tags+=$HOME/.tags/clojure.tags
    au BufNewFile,BufRead *.rb set tags+=$HOME/.tags/ruby.tags
    au BufNewFile,BufRead *.php set tags+=$HOME/.tags/php.tags
    au BufNewFile,BufRead *.inc set tags+=$HOME/.tags/php.tags
aug END

" external grep
if executable('pt')
    set grepprg=pt\ --nogroup\ -iS
    set grepformat=%f:%l:%m
endif
