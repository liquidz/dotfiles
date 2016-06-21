scriptencoding utf-8

setlocal iskeyword-=/
set tags+=$HOME/.tags/clojure.tags

" シングルクオートの補完を無効化
inoremap <buffer> ' '

" 今いる括弧をもひとつ括弧でくくる {{{2
" nnoremap <buffer> <Leader>( F(i(<Esc><Right>%a)<Esc>%a<Space><Left>
" nnoremap <buffer> <Leader>[ F[i[<Esc><Right>%a]<Esc>%a<Space><Left>
" nnoremap <buffer> <Leader>{ F{i{<Esc><Right>%a}<Esc>%a<Space><Left>

" Requires vim-fireplace
function! s:myRunTests() abort
  let ns = fireplace#ns()
  if match(ns, 'test$') ==# -1
    let test_ns = ns . '-test'
  else
    let test_ns = ns
    let ns = substitute(ns, '-test', '', '')
  endif
  execute ':Require ' . ns
  execute ':RunTests ' . test_ns
endfunction
command! MyRunTests call s:myRunTests()
nnoremap <buffer> <Leader>t :<C-u>MyRunTests<CR>

function! s:myRefresh() abort
  execute ":Eval (do (require '[clojure.tools.namespace.repl :refer [refresh]]) (refresh))"
endfunction
command! MyRefresh call s:myRefresh()
nnoremap <buffer> <Leader>R :<C-u>MyRefresh<CR>

nnoremap <buffer> <Leader>s :<C-u>Require<CR>

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
nnoremap <buffer> <Leader>lt :QuickRun lein_test<CR>
