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
" command! RequireTufteProfiler call s:requireTufteProfiler()
" command! FigwheelConnect execute ':Piggieback (figwheel-sidecar.repl-api/repl-env)'
" command! -nargs=1 TmuxSendKeys call s:tmux_send_keys(<q-args>)

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

let g:iced#format#rule = {
    \ 'core-let': '[[:block 1]]',
    \ 'merr/let': '[[:block 2] [:inner 1]]',
    \ }

let g:iced_enable_default_key_mappings = v:true

aug MyClojureSetting
  au!

  au FileType clojure nnoremap <buffer> HH :lprevious<CR>
  au FileType clojure nnoremap <buffer> LL :lnext<CR>

  au FileType clojure imap <silent><buffer> <C-h> <Plug>(sexp_insert_backspace)
  au FileType clojure nmap <buffer> tt <Plug>(iced_toggle_src_and_test)
  au FileType clojure nmap <buffer> <Leader>go :<C-u>IcedEvalRepl (go)<CR>

  " au FileType clojure nmap <buffer> K <Plug>(iced_document_open)
  " au FileType clojure nmap <buffer> <Leader>ei <Plug>(iced_eval)<Plug>(sexp_inner_element)``
  " au FileType clojure nmap <buffer> <Leader>ee <Plug>(iced_eval)<Plug>(sexp_outer_list)``
  " au FileType clojure nmap <buffer> <Leader>et <Plug>(iced_eval)<Plug>(sexp_outer_top_list)``
  " au FileType clojure nmap <buffer> <Leader>eb <Plug>(iced_require)

  " au FileType clojure nmap <buffer> <Leader>ma <Plug>(iced_macroexpand)<Plug>(sexp_outer_list)``
  " au FileType clojure nmap <buffer> <Leader>m1 <Plug>(iced_macroexpand_1)<Plug>(sexp_outer_list)``

  " au FileType clojure nmap <buffer> <Leader>tt <Plug>(iced_test_under_cursor)
  " au FileType clojure nmap <buffer> <Leader>tn <Plug>(iced_test_ns)
  " au FileType clojure nmap <buffer> <Leader>tp <Plug>(iced_test_all)
  " au FileType clojure nmap <buffer> <Leader>ss <Plug>(iced_buffer_open)
  " au FileType clojure nmap <buffer> <C-]> <Plug>(iced_def_jump)
  " au FileType clojure nmap <buffer> <C-t> <Plug>(iced_def_back)
  " au FileType clojure nmap <buffer> <Leader>rcn <Plug>(iced_clean_ns)
  " au FileType clojure nmap <buffer> == <Plug>(iced_format)
  " au FileType clojure setl omnifunc=iced#complete#omni
  au FileType clojure setl updatetime=1000
  au CursorHoldI <buffer> execute "normal \<Plug>(iced_echo_form_document)"
aug END
