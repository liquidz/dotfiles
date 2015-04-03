setlocal iskeyword-=/
set tags+=$HOME/.tags/clojure.tags

" 今いる括弧をもひとつ括弧でくくる {{{2
nnoremap <Leader>( F(i(<Esc><Right>%a)<Esc>%a<Space><Left>
nnoremap <Leader>[ F[i[<Esc><Right>%a]<Esc>%a<Space><Left>
nnoremap <Leader>{ F{i{<Esc><Right>%a}<Esc>%a<Space><Left>

