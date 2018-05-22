let s:V = vital#of('vital')
let s:S = s:V.import('Data.String')
let s:P = s:V.import('Process')

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

function! uochan#clojure#run_test_under_cursor() abort
  let current_pos = getcurpos()
  " move to prev top element
  call sexp#move_to_adjacent_element('n', 1, 0, 0, 1)
  " move right
  execute ':normal l'
  " move to next element head
  call sexp#move_to_adjacent_element('n', 2, 1, 0, 0)
  " eval outer list
  execute ':normal ,ee'
  " restore cursor position
  call cursor(current_pos[1], current_pos[2])
endfunction
