scriptencoding utf-8

if exists('g:loaded_clojure_ftplugin')
  finish
endif
let g:loaded_clojure_ftplugin = 1

let g:clojure_fuzzy_indent_patterns = [
    \ '^with', '^def', '^let', '^\w\+-let'
    \ ]

let g:iced#buffer#stdout#mods = 'vertical'
let g:iced#buffer#stdout#max_line = 512
let g:iced#nrepl#auto#does_switch_session = v:true
let g:iced#format#rule = {
     \ 'core-let': '[[:block 1]]',
     \ 'merr.core/let': '[[:block 2] [:inner 1]]',
     \ 'clojure.spec.alpha/fdef': '[[:block 1]]',
     \ 're-frame.core/reg-event-db': '[[:block 1]]',
     \ 're-frame.core/reg-event-fx': '[[:block 1]]',
     \ 're-frame.core/reg-sub': '[[:block 1]]',
     \ }
let g:iced#grep#prg = 'git grep -I --line-number --no-color'
let g:iced#hook = {
      \ 'test_finished': {'type': 'shell',
      \                   'exec': {v -> printf('tmux display-message "Test %s: %s"', v.result, v.summary)}},
      \ 'session_switched': {'type': 'shell',
      \                   'exec': {v -> printf('tmux display-message "Session: switch to %s"', v.session)}},
      \ }

let g:iced_enable_default_key_mappings = v:true
let g:iced_enable_auto_indent = v:true
let g:iced_sign = {'error': 'E', 'trace': 'T', 'lint': 'L'}

function! s:auto_connect() abort
  if expand('%:t') ==# 'project.clj' || expand('%:e') ==# 'edn'
    return
  endif
  IcedConnect
endfunction

aug MyClojureSetting
  au!
  au VimEnter * call s:auto_connect()

  au FileType clojure nnoremap <buffer> HH :lprevious<CR>
  au FileType clojure nnoremap <buffer> LL :lnext<CR>

  au FileType clojure imap <silent><buffer> <C-h> <Plug>(sexp_insert_backspace)
  au FileType clojure inoremap <buffer> >> ->

  au FileType clojure nmap <buffer> tt <Plug>(iced_cycle_src_and_test)
  au FileType clojure nmap <buffer> <C-l><C-l><C-l> <Plug>(iced_clean_all)
  au FileType clojure nnoremap <buffer> <Leader>go :<C-u>IcedEval (user/go)<CR>
  au FileType clojure nnoremap <buffer> <Leader>stop :<C-u>IcedEval (user/stop)<CR>
  au FileType clojure nnoremap <buffer> <Leader>Go :<C-u>IcedEval (user/reset)<CR>
  au FileType clojure nmap <buffer> <Leader>gg <Plug>(iced_grep)

  au FileType clojure nmap <buffer> <Leader>jss :<C-u>IcedStartCljsRepl<CR>
  au FileType clojure nmap <buffer> <Leader>jsq :<C-u>IcedQuitCljsRepl<CR>

  au FileType clojure setl completeopt=menu
  au FileType clojure setl updatetime=1000
  au CursorHoldI *.clj,*.cljs,*.cljc call iced#nrepl#document#current_form()

  au FileType qf nnoremap <buffer> q :<C-u>q<CR>

  au FileType clojure nmap <buffer> <Leader>eae <Plug>(iced_eval_and_tap)<Plug>(sexp_outer_list)``
  au FileType clojure nmap <buffer> <Leader>eat <Plug>(iced_eval_and_tap)<Plug>(sexp_outer_top_list)``

  au FileType clojure nmap <buffer> <Leader>ere <Plug>(iced_eval_and_replace)<Plug>(sexp_outer_list)``
  au FileType clojure nmap <buffer> <Leader>ert <Plug>(iced_eval_and_replace)<Plug>(sexp_outer_top_list)``

  "" vim-sexp
  au FileType clojure nmap <silent><buffer> <LocalLeader>kk <Plug>(sexp_swap_list_backward)
  au FileType clojure xmap <silent><buffer> <LocalLeader>kk <Plug>(sexp_swap_list_backward)
  au FileType clojure nmap <silent><buffer> <LocalLeader>kj <Plug>(sexp_swap_list_forward)
  au FileType clojure xmap <silent><buffer> <LocalLeader>kj <Plug>(sexp_swap_list_forward)
  au FileType clojure nmap <silent><buffer> <LocalLeader>kh <Plug>(sexp_swap_element_backward)
  au FileType clojure xmap <silent><buffer> <LocalLeader>kh <Plug>(sexp_swap_element_backward)
  au FileType clojure nmap <silent><buffer> <LocalLeader>kl <Plug>(sexp_swap_element_forward)
  au FileType clojure xmap <silent><buffer> <LocalLeader>kl <Plug>(sexp_swap_element_forward)

  "" vim-iced-kaocha
  au FileType clojure nmap <silent><buffer> <Leader>ktt <Plug>(iced_kaocha_test_under_cursor)
  au FileType clojure nmap <silent><buffer> <Leader>ktn <Plug>(iced_kaocha_test_ns)
  au FileType clojure nmap <silent><buffer> <Leader>ktr <Plug>(iced_kaocha_test_redo)
  au FileType clojure nmap <silent><buffer> <Leader>ktl <Plug>(iced_kaocha_test_rerun_last)
aug END
