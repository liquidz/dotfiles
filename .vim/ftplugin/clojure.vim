scriptencoding utf-8

setlocal iskeyword-=/
set tags+=$HOME/.tags/clojure.tags

" 今いる括弧をもひとつ括弧でくくる {{{2
nnoremap <Leader>( F(i(<Esc><Right>%a)<Esc>%a<Space><Left>
nnoremap <Leader>[ F[i[<Esc><Right>%a]<Esc>%a<Space><Left>
nnoremap <Leader>{ F{i{<Esc><Right>%a}<Esc>%a<Space><Left>

" Requires vim-fireplace
function! s:myRunTests() abort
  let ns = fireplace#ns()
  let test_ns = ns . (match(ns, 'test$') ==# -1 ? '-test' : '')
  execute ':RunTests ' . test_ns
endfunction
command! MyRunTests call s:myRunTests()
nnoremap <Leader>t :<C-u>MyRunTests<CR>

aug MyLispWords
  au!
  au FileType clojure set lispwords+=ns,are
  " compojure
  au FileType clojure set lispwords+=defroutes,GET,POST
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
nnoremap <Leader>lt :QuickRun lein_test<CR>
