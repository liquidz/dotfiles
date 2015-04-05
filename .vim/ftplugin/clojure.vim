setlocal iskeyword-=/
set tags+=$HOME/.tags/clojure.tags

" 今いる括弧をもひとつ括弧でくくる {{{2
nnoremap <Leader>( F(i(<Esc><Right>%a)<Esc>%a<Space><Left>
nnoremap <Leader>[ F[i[<Esc><Right>%a]<Esc>%a<Space><Left>
nnoremap <Leader>{ F{i{<Esc><Right>%a}<Esc>%a<Space><Left>

aug MyLispWords
  au!
  au FileType clojure set lispwords+=ns
  " compojure
  au FileType clojure set lispwords+=defroutes,GET,POST
  " misaki
  au FileType clojure set lispwords+=defvalidate,validate,testing,defhtml,bind-config,defcompilertest
  " midje
  au FileType clojure set lispwords+=facts,fact
  " conjure
  au FileType clojure set lispwords+=stubbing
aug END
