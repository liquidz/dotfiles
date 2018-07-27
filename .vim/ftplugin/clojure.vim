scriptencoding utf-8

if exists('g:loaded_clojure_ftplugin')
  finish
endif
let g:loaded_clojure_ftplugin = 1

" シングルクオートの補完を無効化
inoremap <buffer> ' '

let s:V = vital#of('vital')
let s:S = s:V.import('Data.String')
let s:P = s:V.import('Process')

function! s:requireTufteProfiler() abort
  execute ":Eval (require '[taoensso.tufte :as tufte :refer [defnp p profiled profile]])"
  execute ':Eval (tufte/add-basic-println-handler! {})'
endfunction

"function! TmuxSendKeys(keys) abort
function! s:tmux_send_keys(keys) abort
  call s:P.system(printf('tmux send-keys -t 1 %s', a:keys))
  call s:P.system('tmux send-keys -t 1 Enter')
endfunction


"command! MyToggleSourceTest call uochan#clojure#toggle_source_test()
command! RequireTufteProfiler call s:requireTufteProfiler()
command! FigwheelConnect execute ':Piggieback (figwheel-sidecar.repl-api/repl-env)'
command! -nargs=1 TmuxSendKeys call s:tmux_send_keys(<q-args>)

" command! MyDeepSlurp call uochan#slurp#deep_slurp()
" command! MyBarf call uochan#slurp#barf()
" command! MyRunTestUnderCursor call uochan#clojure#run_test_under_cursor()
" command! MyRunAllTests call uochan#clojure#run_all_tests()
" nnoremap <silent> <Plug>(my_eval) :<C-u>set opfunc=uochan#clojure#eval_operation<CR>g@
" command! MyDJumpWithStack call uochan#clojure#jump()
" command! MyDBackWithStack call uochan#clojure#back()
" command! MyCleanNamespace call uochan#clojure#clean_ns()

let g:clojure_fuzzy_indent_patterns = [
    \ '^with', '^def', '^let', '^\w\+-let'
    \ ]

aug MyClojureSetting
  au!

  au FileType clojure nnoremap <buffer> HH :lprevious<CR>
  au FileType clojure nnoremap <buffer> LL :lnext<CR>
  au FileType clojure nmap <buffer> tt <Plug>(cljstack_toggle_source_and_test)

  au FileType clojure imap <silent><buffer> <C-h> <Plug>(sexp_insert_backspace)

  " au FileType clojure nmap <buffer> <Leader>ei <Plug>(cljstack_eval)<Plug>(sexp_inner_element)``
  " au FileType clojure nmap <buffer> <Leader>ee <Plug>(cljstack_eval)<Plug>(sexp_outer_list)``
  " au FileType clojure nmap <buffer> <Leader>et <Plug>(cljstack_eval)<Plug>(sexp_outer_top_list)``
  " au FileType clojure nmap <buffer> <Leader>eb :<C-u>Require<CR>

  au FileType clojure nmap <buffer> K <Plug>(nrepl_document_open)
  au FileType clojure nmap <buffer> <Leader>ei <Plug>(nrepl_eval)<Plug>(sexp_inner_element)``
  au FileType clojure nmap <buffer> <Leader>ee <Plug>(nrepl_eval)<Plug>(sexp_outer_list)``
  au FileType clojure nmap <buffer> <Leader>et <Plug>(nrepl_eval)<Plug>(sexp_outer_top_list)``
  au FileType clojure nmap <buffer> <Leader>eb <Plug>(nrepl_load_buffer)

  au FileType clojure nmap <buffer> <Leader>m1 <Plug>FireplaceCount1MacroExpand
  au FileType clojure nmap <buffer> <Leader>cc <Plug>FireplaceCountEdit
  au FileType clojure nmap <buffer> <Leader>tn <Plug>(cljstack_run_ns_tests)
  au FileType clojure nmap <buffer> <Leader>tt <Plug>(cljstack_run_test_under_cursor)
  au FileType clojure nmap <buffer> <Leader>tp <Plug>(cljstack_run_all_tests)

  au FileType clojure nmap <buffer> <Leader>rcn <Plug>(cljstack_clean_ns)

  au FileType clojure nmap <buffer> <Leader>' <Plug>(cljstack_jack_in)

  " C-] で定義元へジャンプ
  au FileType clojure nmap <buffer> <C-]> <Plug>(cljstack_jump)
  " C-t で戻る
  au FileType clojure nmap <buffer> <C-t> <Plug>(cljstack_back)

  "" tmux
  au FileType clojure nnoremap <buffer> <LocalLeader>tr :<C-u>TmuxSendKeys '(reset)'<CR>
aug END
