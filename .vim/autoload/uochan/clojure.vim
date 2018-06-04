let s:V = vital#of('vital')
let s:S = s:V.import('Data.String')
let s:L = s:V.import("Data.List")
let s:Promise = s:V.import('Async.Promise')

let s:tempname = tempname()
let s:tagstack = []

function! s:next_tick()
  return s:Promise.new({resolve -> timer_start(0, resolve)})
endfunction

function! uochan#clojure#project_root() abort
  return ''
endfunction

function! uochan#clojure#toggle_source_test() abort
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

function! s:eval(sexp) abort
  execute(':redir! > ' . s:tempname)
  silent execute printf(':Eval %s', a:sexp)
  execute(':redir END')
  execute printf(':pedit %s', s:tempname)
endfunction

function! uochan#clojure#eval(sexp) abort
  call s:next_tick()
      \.then({-> s:eval(a:sexp)})
      \.catch({err -> execute('echom ' . string(err), '')})
endfunction

function! uochan#clojure#eval_operation(type) abort
  let reg_save = @@
  try
    silent exe "normal! `[v`]y"
    call uochan#clojure#eval(@@)
  finally
    let @@ = reg_save
  endtry
endfunction

function! uochan#clojure#run_test_under_cursor() abort
  let current_pos = getcurpos()
  " move to prev top element
  execute "normal \<Plug>(sexp_move_to_prev_top_element)"
  " select test bodies
  execute ':normal lvibo'
  execute search('(')

  " run selected s-exps
  let reg_save = @@
  try
    silent exe "normal! gvy"
    call uochan#clojure#eval(printf('(do %s)', @@))
  finally
    let @@ = reg_save
  endtry
endfunction

function! uochan#clojure#run_all_tests() abort
  execute ":terminal ++hidden ++open lein test"
endfunction

function! uochan#clojure#jump() abort
  let pos = getcurpos()
  let pos[0] = bufnr('%')
  call s:L.push(s:tagstack, pos)

  execute "normal \<Plug>FireplaceDjump"
endfunction

function! uochan#clojure#back() abort
  if empty(s:tagstack)
    echo "Local tag stack is empty"
  else
    let last_position = s:L.pop(s:tagstack)
    execute printf(':buffer %d', last_position[0])
    call cursor(last_position[1], last_position[2])
  endif
endfunction
