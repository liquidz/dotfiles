scriptencoding utf-8

if exists('g:loaded_clojure_ftplugin')
  finish
endif
let g:loaded_clojure_ftplugin = 1

"set tags+=$HOME/.tags/clojure.tags

" シングルクオートの補完を無効化
inoremap <buffer> ' '

let s:V = vital#of('vital')
let s:S = s:V.import('Data.String')
let s:P = s:V.import('Process')

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

function! s:my_start_repl() abort
  execute ":terminal lein repl"
endfunction

command! MyToggleSourceTest call uochan#clojure#toggle_source_test()
command! RequireTufteProfiler call s:requireTufteProfiler()
command! FigwheelConnect execute ':Piggieback (figwheel-sidecar.repl-api/repl-env)'
command! -nargs=1 TmuxSendKeys call s:tmux_send_keys(<q-args>)
command! StartRepl call s:my_start_repl()

aug MyClojure
  au!
  au FileType clojure nnoremap <buffer> tt :<C-u>MyToggleSourceTest<CR>
  au FileType clojure nnoremap <buffer> HH :lprevious<CR>
  au FileType clojure nnoremap <buffer> LL :lnext<CR>

  "" vimpire
  "au FileType clojure nmap <buffer> <Leader>ei <Plug>(vimpire_eval)<Plug>(sexp_inner_element)``
  "au FileType clojure nmap <buffer> <Leader>ee <Plug>(vimpire_eval)<Plug>(sexp_outer_list)``
  "au FileType clojure nmap <buffer> <Leader>et <Plug>(vimpire_eval)<Plug>(sexp_outer_top_list)``
  "au FileType clojure nmap <buffer> <Leader>eb <Plug>(vimpire_require_file)
  "au FileType clojure nmap <buffer> <Leader>ss :<C-u>VimpireRepl<CR>
  "au FileType clojure nmap <buffer> <Leader>tn <Plug>(vimpire_run_tests)

  " run test under cursor
  "au FileType clojure nmap <buffer> <Leader>tt :<C-u>.RunTests<CR>

  "" vim-fiace-repl
  "au FileType clojure nmap <buffer> <LocalLeader>si <Plug>(cljbuf_eval)<Plug>(sexp_inner_element)``
  "au FileType clojure nmap <buffer> <LocalLeader>ss <Plug>(cljbuf_eval)<Plug>(sexp_outer_list)``
  "au FileType clojure nmap <buffer> <LocalLeader>sl <Plug>(cljbuf_repeat_last)
  "au FileType clojure nmap <buffer> <LocalLeader>tt <Plug>(cljbuf_test_file)
  "au FileType clojure nmap <buffer> <LocalLeader>ta <Plug>(cljbuf_test_all)
  "au FileType clojure nmap <buffer> <LocalLeader>l  <Plug>(cljbuf_clear)

  "" vim-fireplace
  au FileType clojure nmap <buffer> <Leader>ei <Plug>FireplacePrint<Plug>(sexp_inner_element)``
  au FileType clojure nmap <buffer> <Leader>ee <Plug>FireplacePrint<Plug>(sexp_outer_list)``
  au FileType clojure nmap <buffer> <Leader>et <Plug>FireplacePrint<Plug>(sexp_outer_top_list)``
  au FileType clojure nmap <buffer> <Leader>eb :<C-u>Require<CR>
  au FileType clojure nmap <buffer> <Leader>m1 <Plug>FireplaceCount1MacroExpand
  au FileType clojure nmap <buffer> <Leader>cc <Plug>FireplaceCountEdit
  "au FileType clojure nnoremap <buffer> <LocalLeader>r :<C-u>Require<CR>

  "" vim-clj-trace
  "au FileType clojure nmap <buffer> <LocalLeader>ti <Plug>CljTraceVars
  "au FileType clojure nmap <buffer> <LocalLeader>tn <Plug>CljTraceNs
  "au FileType clojure nmap <buffer> <LocalLeader>tu <Plug>CljUntraceNs

  "" tmux
  au FileType clojure nnoremap <buffer> <LocalLeader>tr :<C-u>TmuxSendKeys '(reset)'<CR>

  "" lisp words
  au Filetype clojure setl lispwords+=doseq,testing,fn,loop,if-let,for,binding
  "" duct
  au Filetype clojure setl lispwords+=context,GET,POST,PUT,DELETE
aug END
