scriptencoding utf-8

if exists('g:loaded_clojure_ftplugin')
  finish
endif
let g:loaded_clojure_ftplugin = 1


"setlocal iskeyword-=/
"set tags+=$HOME/.tags/clojure.tags

" シングルクオートの補完を無効化
inoremap <buffer> ' '

let s:V = vital#of('vital')
let s:S = s:V.import('Data.String')

function! s:myToggleSourceTest() abort
  let current_file = expand('%:p')
  if stridx(current_file, '_test.clj') == -1
    let target = s:S.reverse(s:S.replace_first(s:S.reverse(current_file), 'jlc.', 'jlc.tset_'))
    let target = s:S.reverse(s:S.replace_first(s:S.reverse(target), '/crs/', '/tset/'))
  else
    let target = s:S.reverse(s:S.replace_first(s:S.reverse(current_file), 'jlc.tset_', 'jlc.'))
    let target = s:S.reverse(s:S.replace_first(s:S.reverse(target), '/tset/', '/crs/'))
  endif
  execute printf(':e %s', target)
endfunction

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
"nnoremap <buffer> <Leader>t :<C-u>MyRunTests<CR>

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

command! MyToggleSourceTest call s:myToggleSourceTest()
command! FigwheelConnect execute ':Piggieback (figwheel-sidecar.repl-api/repl-env)'

aug MyClojure
  au!
  au FileType clojure nnoremap <buffer> tt :<C-u>MyToggleSourceTest<CR>
  au FileType clojure nnoremap <buffer> HH :lprevious<CR>
  au FileType clojure nnoremap <buffer> LL :lnext<CR>
  au FileType clojure nmap <buffer> <LocalLeader>si <Plug>FireplacePrint<Plug>(sexp_inner_element)``
  au FileType clojure nmap <buffer> <LocalLeader>ss <Plug>FireplacePrint<Plug>(sexp_outer_list)``
  au FileType clojure nmap <buffer> <LocalLeader>st <Plug>FireplacePrint<Plug>(sexp_outer_top_list)``
  au FileType clojure nmap <buffer> <LocalLeader>m1 <Plug>FireplaceCount1MacroExpand
  au FileType clojure nmap <buffer> <LocalLeader>cs <Plug>FireplaceCountEdit
  au FileType clojure nmap <buffer> <LocalLeader>cc <Plug>FireplacePrompt

  au Filetype clojure setl lispwords+=doseq,testing,fn,loop,if-let,for
  "au Filetype clojure setl lispwords+=testing
  "au FileType clojure setl lispwords+=ns,are
  "" compojure
  "au FileType clojure setl lispwords+=defroutes,GET,POST
  "" midje
  "au FileType clojure setl lispwords+=facts,fact
  "" conjure
  "au FileType clojure setl lispwords+=stubbing
aug END
