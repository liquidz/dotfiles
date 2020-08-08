scriptencoding utf-8

if exists('g:loaded_clojure_ftplugin')
  finish
endif
let g:loaded_clojure_ftplugin = 1


let g:iced_formatter = 'cljstyle'
"let g:iced_formatter = 'joker'
"let g:iced_formatter = 'zprint'

let g:clojure_fuzzy_indent_patterns = [
    \ '^with', '^def', '^let', '^\w\+-let'
    \ ]

"let g:iced_default_key_mapping_leader = '<LocalLeader>'

let g:iced#buffer#stdout#max_line = 512
let g:iced#buffer#stdout#mods = 'vertical'
let g:iced#clojuredocs#use_clj_docs_on_cljs = v:true
let g:iced#grep#prg = 'git grep -I --line-number --no-color'
let g:iced#nrepl#auto#does_switch_session = v:true
let g:iced#nrepl#complete#ignore_context = v:true
let g:iced#nrepl#skip_evaluation_when_buffer_size_is_exceeded = v:true
let g:iced#repl#babashka_repl_type = 'nrepl'
let g:iced_enable_auto_indent = v:true
let g:iced_enable_default_key_mappings = v:true

" nf-fa-bomb
let g:iced_sign = {'error': "\uf1e2", 'trace': 'T', 'lint': 'L'}

" let g:iced#format#rule = {
"     \ 'core-let': '[[:block 1]]',
"     \ 'merr.core/let': '[[:block 2] [:inner 1]]',
"     \ 'clojure.spec.alpha/fdef': '[[:block 1]]',
"     \ 're-frame.core/reg-event-db': '[[:block 1]]',
"     \ 're-frame.core/reg-event-fx': '[[:block 1]]',
"     \ 're-frame.core/reg-sub': '[[:block 1]]',
"     \ }

" tonsky
let g:iced#format#rule = {'#"^\w"': '[[:inner 0]]'}

let g:iced#hook = {
      \ 'session_switched': {'type': 'shell',
      \                   'exec': {v -> printf('tmux display-message "Session: switch to %s"', v.session)}},
      \ }

let s:counter = 0
function! s:test_finished(v) abort
  let s:counter += 1
  if s:counter > 10
    let s:counter = 0
  endif

  let success_color = ['AACF53', '7BA23F']
  let failure_color = ['E95464', 'D0104C']

  let idx = s:counter % 2
  let color = (a:v.result ==# 'succeeded' ? success_color[idx] : failure_color[idx])

  return ['curl', '-XPOST', printf('localhost:8890/%s', color)]
endfunction

let g:iced#hook['test_finished'] = {'type': 'shell', 'exec': funcref('s:test_finished')}

function! s:auto_connect() abort
  if expand('%:t') ==# 'project.clj' || expand('%:e') ==# 'edn'
    return
  endif
  call timer_start(250, {-> execute(':IcedConnect')})
endfunction

function! s:auto_format_current_form() abort
  let x = iced#format#current()
  if iced#promise#is_promise(x)
    return iced#promise#wait(x)
  endif
endfunction

nmap <Leader>em <Plug>(iced_eval_at_mark)
nmap <Leader>eM <Plug>(iced_macroexpand_1_outer_list)
nmap <Nop>(disable_expand_all) <Plug>(iced_macroexpand_outer_list)

aug MyClojureSetting
  au!
  "au VimEnter * call s:auto_connect()

  au FileType clojure nnoremap <buffer> HH :lprevious<CR>
  au FileType clojure nnoremap <buffer> LL :lnext<CR>

  au FileType clojure imap <silent><buffer> <C-h> <Plug>(sexp_insert_backspace)
  au FileType clojure inoremap <buffer> >> ->
  au FileType clojure inoremap <buffer> ## #_

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

  "" cljstyle auto fix
  au BufWritePre *.clj,*.cljs,*.cljc  call s:auto_format_current_form()
aug END
