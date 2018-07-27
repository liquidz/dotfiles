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
  redir => res
  silent execute printf(':Eval %s', a:sexp)
  redir END
  let result = []
  for line in split(res, '\r\?\n')
    if line == '該当するautocommandは存在しません'
      continue
    elseif line == 'No matching autocommands'
      continue
    endif

    echomsg line
    call add(result, line)
  endfor
  echomsg " "
  echo join(result, "\n")
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
  " move to var name
  call search(' \+[^\^]')
  " test var
  let reg_save = @@
  try
    silent exe "normal! wviwy"
    let var = printf("#'%s/%s", fireplace#ns(), @@)
    call uochan#clojure#eval(printf('(clojure.test/test-var %s)', var))
  finally
    let @@ = reg_save
    call cursor(current_pos[1], current_pos[2])
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

function! s:replace_namespace(ns) abort
  let current_pos = getcurpos()
  call cursor(1, 1)
  call search('(ns')
  let reg_save = @@
  try
    silent exe 'normal dab'
    let lnum = line('.') - 1
    call append(lnum, split(a:ns, '\n'))
  finally
    let @@ = reg_save
    call cursor(current_pos[1], current_pos[2])
  endtry
endfunction

function! uochan#clojure#clean_ns() abort
  let path = expand('%:p')
  let result = fireplace#message({'op': 'clean-ns', 'path': path})[0]
  if result['status'] == ['done']
    call s:replace_namespace(result['ns'])
  else
    echo "FAILED"
  endif
endfunction
