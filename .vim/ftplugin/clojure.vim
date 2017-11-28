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
let s:P = s:V.import('Process')

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

function! s:requireTufteProfiler() abort
  execute ":Eval (require '[taoensso.tufte :as tufte :refer [defnp p profiled profile]])"
  execute ':Eval (tufte/add-basic-println-handler! {})'
endfunction

"function! TmuxSendKeys(keys) abort
function! s:tmux_send_keys(keys) abort
  call s:P.system(printf('tmux send-keys -t 1 %s', a:keys))
  call s:P.system('tmux send-keys -t 1 Enter')
endfunction

command! MyToggleSourceTest call s:myToggleSourceTest()
command! RequireTufteProfiler call s:requireTufteProfiler()
command! FigwheelConnect execute ':Piggieback (figwheel-sidecar.repl-api/repl-env)'
command! -nargs=1 TmuxSendKeys call s:tmux_send_keys(<q-args>)

aug MyClojure
  au!
  au FileType clojure nnoremap <buffer> tt :<C-u>MyToggleSourceTest<CR>
  au FileType clojure nnoremap <buffer> HH :lprevious<CR>
  au FileType clojure nnoremap <buffer> LL :lnext<CR>

  au FileType clojure nmap <buffer> <Leader>ei <Plug>FireplacePrint<Plug>(sexp_inner_element)``
  au FileType clojure nmap <buffer> <Leader>ee <Plug>FireplacePrint<Plug>(sexp_outer_list)``
  au FileType clojure nmap <buffer> <Leader>et <Plug>FireplacePrint<Plug>(sexp_outer_top_list)``
  au FileType clojure nmap <buffer> <Leader>eb :<C-u>Require<CR>

  " run test under cursor
  au FileType clojure nmap <buffer> <Leader>tt :<C-u>.RunTests<CR>

  "" vim-fiace-repl
  au FileType clojure nmap <buffer> <LocalLeader>si <Plug>(cljbuf_eval)<Plug>(sexp_inner_element)``
  au FileType clojure nmap <buffer> <LocalLeader>ss <Plug>(cljbuf_eval)<Plug>(sexp_outer_list)``
  au FileType clojure nmap <buffer> <LocalLeader>sl <Plug>(cljbuf_repeat_last)
  au FileType clojure nmap <buffer> <LocalLeader>tt <Plug>(cljbuf_test_file)
  au FileType clojure nmap <buffer> <LocalLeader>ta <Plug>(cljbuf_test_all)
  au FileType clojure nmap <buffer> <LocalLeader>l  <Plug>(cljbuf_clear)

  "" vim-fireplace
  "au FileType clojure nmap <buffer> <LocalLeader>si <Plug>FireplacePrint<Plug>(sexp_inner_element)``
  "au FileType clojure nmap <buffer> <LocalLeader>ss <Plug>FireplacePrint<Plug>(sexp_outer_list)``
  au FileType clojure nmap <buffer> <LocalLeader>st <Plug>FireplacePrint<Plug>(sexp_outer_top_list)``
  au FileType clojure nmap <buffer> <LocalLeader>m1 <Plug>FireplaceCount1MacroExpand
  au FileType clojure nmap <buffer> <LocalLeader>cc <Plug>FireplaceCountEdit
  au FileType clojure nnoremap <buffer> <LocalLeader>r :<C-u>Require<CR>

  "" vim-clj-trace
  au FileType clojure nmap <buffer> <LocalLeader>ti <Plug>CljTraceVars
  au FileType clojure nmap <buffer> <LocalLeader>tn <Plug>CljTraceNs
  au FileType clojure nmap <buffer> <LocalLeader>tu <Plug>CljUntraceNs

  "" tmux
  au FileType clojure nnoremap <buffer> <LocalLeader>tr :<C-u>TmuxSendKeys '(reset)'<CR>

  "" lisp words
  au Filetype clojure setl lispwords+=doseq,testing,fn,loop,if-let,for,binding
  "" duct
  au Filetype clojure setl lispwords+=context,GET,POST,PUT,DELETE
aug END
