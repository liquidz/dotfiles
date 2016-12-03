scriptencoding utf-8

"setlocal iskeyword-=/
set tags+=$HOME/.tags/clojure.tags

" シングルクオートの補完を無効化
inoremap <buffer> ' '

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

function! s:myReloadWithStringException() abort
  let ns = fireplace#ns()
  let expr = printf("(try (require '%s :reload) (catch Exception e (-> e str)))", ns)
  execute ':Eval ' . expr
endfunction
command! MyReloadWithStringException call s:myReloadWithStringException()

function! s:myRefresh() abort
  execute ":Eval (do (require '[clojure.tools.namespace.repl :refer [refresh]]) (refresh))"
endfunction
command! Refresh call s:myRefresh()
"nnoremap <buffer> <Leader>R :<C-u>Refresh<CR>

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

"    \ 'hook/cd/directory': yacd#get_root_dir(expand('%:p:h'))
let g:quickrun_config.lein_test = {
    \ 'command'   : 'lein',
    \ 'exec'      : '%c test',
    \ }
nnoremap <buffer> <Leader>lt :QuickRun lein_test<CR>
