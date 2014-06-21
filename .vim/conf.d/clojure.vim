aug MyClojure
    au!

    " 今いる括弧をもひとつ括弧でくくる(Lisp用)
    au FileType clojure nnoremap <Leader>( F(i(<Esc><Right>%a)<Esc>%a<Space><Left>
    au FileType clojure nnoremap <Leader>[ F[i[<Esc><Right>%a]<Esc>%a<Space><Left>
    au FileType clojure nnoremap <Leader>{ F{i{<Esc><Right>%a}<Esc>%a<Space><Left>
aug END
