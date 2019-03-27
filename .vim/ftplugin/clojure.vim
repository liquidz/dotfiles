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

" command! -nargs=1 TmuxSendKeys call s:tmux_send_keys(<q-args>)

let g:clojure_fuzzy_indent_patterns = [
    \ '^with', '^def', '^let', '^\w\+-let'
    \ ]

let g:iced#buffer#stdout#mods = 'vertical'
let g:iced#buffer#stdout#file = '/tmp/.vim-iced-buffer.clj'
let g:iced#nrepl#cljs#default_env = 'custom'
let g:iced#nrepl#auto#does_switch_session = v:true
let g:iced#format#rule = {
     \ 'core-let': '[[:block 1]]',
     \ 'merr.core/let': '[[:block 2] [:inner 1]]',
     \ 'clojure.spec.alpha/fdef': '[[:block 1]]',
     \ 're-frame.core/reg-event-db': '[[:block 1]]',
     \ 're-frame.core/reg-event-fx': '[[:block 1]]',
     \ 're-frame.core/reg-sub': '[[:block 1]]',
     \ }

" let g:iced#format#does_overwrite_rules = v:true
" let g:iced#format#rule = {
"      \ '#"^\w"': '[[:inner 0]]',
"      \ }

let g:iced#eastwood#option = {
      \ 'linters': ['all'],
      \ 'exclude-linters': ['implicit-dependencies', 'keyword-typos', 'constant-test'],
      \ }
let g:iced#lint#message_max_length = 200

function! s:notify(title, body, reporter) abort
  let q = printf('mutation {notify(title: \"%s\", body: \"%s\", reporter: \"%s\") {result}}',
       \ a:title, a:body, a:reporter)
  let q = printf('curl -d "%s" localhost:8443/graphql', q)
  return q
endfunction

function! s:tmux_notify(title, body) abort
  return printf('tmux-notify "%s" "%s"', a:title, a:body)
endfunction

" function! s:notify_test_finished(param) abort
"   return s:notify_command(
"        \ printf('Test %s', a:param['result']),
"        \ a:param['summary'],
"        \ 'iced')
" endfunction

" let g:iced#hook = {
"      \ 'test_finished': {'type': 'shell',
"      \                   'exec': {v -> s:notify(printf('Test %s', v.result), v.summary, 'iced')}},
"      \ 'session_switched': {'type': 'shell',
"      \                   'exec': {v -> s:notify('Session switched', 'switched to ' . v.session, 'iced')}},
"      \ }

let g:iced#hook = {
      \ 'test_finished': {'type': 'shell',
      \                   'exec': {v -> printf('tmux display-message "Test %s: %s"', v.result, v.summary)}},
      \ 'session_switched': {'type': 'shell',
      \                   'exec': {v -> printf('tmux display-message "Session: switch to %s"', v.session)}},
      \ }

let g:iced_enable_default_key_mappings = v:true
"let g:iced_enable_auto_linting = v:true
let g:iced_enable_auto_indent = v:true
let g:iced_sign = {'error': 'E', 'trace': 'T', 'lint': 'L'}

" call arpeggio#load()
" call arpeggio#map('n', '', 0, 'jk', '<LocalLeader>p')

aug MyClojureSetting
  au!

  au FileType clojure nnoremap <buffer> HH :lprevious<CR>
  au FileType clojure nnoremap <buffer> LL :lnext<CR>

  au FileType clojure imap <silent><buffer> <C-h> <Plug>(sexp_insert_backspace)
  au FileType clojure inoremap <buffer> >> ->

  au FileType clojure nmap <buffer> tt <Plug>(iced_toggle_src_and_test)
  au FileType clojure nnoremap <buffer> <Leader>go :<C-u>IcedEvalRepl (go)<CR>
  au FileType clojure nnoremap <buffer> <Leader>stop :<C-u>IcedEvalRepl (stop)<CR>
  au FileType clojure nnoremap <buffer> <Leader>Go :<C-u>IcedEvalRepl (reset)<CR>

  au FileType clojure nmap <buffer> <Leader>jss :<C-u>IcedStartCljsRepl<CR>
  au FileType clojure nmap <buffer> <Leader>jsq :<C-u>IcedQuitCljsRepl<CR>

  au FileType clojure setl completeopt=menu
  au FileType clojure setl updatetime=1000
  au CursorHoldI *.clj,*.cljs,*.cljc call iced#nrepl#document#current_form()

  au FileType qf nnoremap <buffer> q :<C-u>q<CR>

  "" vim-sexp
  au FileType clojure nmap <silent><buffer> <LocalLeader>kk <Plug>(sexp_swap_list_backward)
  au FileType clojure xmap <silent><buffer> <LocalLeader>kk <Plug>(sexp_swap_list_backward)
  au FileType clojure nmap <silent><buffer> <LocalLeader>kj <Plug>(sexp_swap_list_forward)
  au FileType clojure xmap <silent><buffer> <LocalLeader>kj <Plug>(sexp_swap_list_forward)
  au FileType clojure nmap <silent><buffer> <LocalLeader>kh <Plug>(sexp_swap_element_backward)
  au FileType clojure xmap <silent><buffer> <LocalLeader>kh <Plug>(sexp_swap_element_backward)
  au FileType clojure nmap <silent><buffer> <LocalLeader>kl <Plug>(sexp_swap_element_forward)
  au FileType clojure xmap <silent><buffer> <LocalLeader>kl <Plug>(sexp_swap_element_forward)
aug END
