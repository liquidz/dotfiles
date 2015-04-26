scriptencoding utf-8

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

let g:quickrun_config.lein_test = {
    \ 'command'   : 'lein',
    \ 'exec'      : '%c test',
    \ 'hook/cd/directory': yacd#get_root_dir(expand('%:p:h'))
    \ }
nnoremap <Leader>t :QuickRun lein_test<CR>
