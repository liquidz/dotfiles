aug MyClojure
    au!

    " 今いる括弧をもひとつ括弧でくくる(Lisp用)
    au FileType clojure nnoremap <Leader>( F(i(<Esc><Right>%a)<Esc>%a<Space><Left>
    au FileType clojure nnoremap <Leader>[ F[i[<Esc><Right>%a]<Esc>%a<Space><Left>
    au FileType clojure nnoremap <Leader>{ F{i{<Esc><Right>%a}<Esc>%a<Space><Left>

    " compojure
	au FileType clojure set lispwords+=defroutes,GET,POST
    " misaki
	au FileType clojure set lispwords+=defvalidate,validate,testing,defhtml,bind-config,defcompilertest
    " midje
	au FileType clojure set lispwords+=facts,fact
    " conjure
	au FileType clojure set lispwords+=stubbing
aug END
