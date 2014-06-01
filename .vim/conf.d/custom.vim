set directory=$HOME/dotfiles/.vim/backup

" auto saving
aug MyAutoSaving
    au!
    autocmd CursorHold * update
aug END
set updatetime=300000 "5min

aug MyClojure
    au!

    " compojure
	au FileType clojure set lispwords+=defroutes,GET,POST
    " misaki
	au FileType clojure set lispwords+=defvalidate,validate,testing,defhtml,bind-config,defcompilertest
    " midje
	au FileType clojure set lispwords+=facts,fact
    " conjure
	au FileType clojure set lispwords+=stubbing
aug END
