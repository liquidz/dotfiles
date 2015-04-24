if exists('g:loaded_foo')
  finish
endif
let g:loaded_foo = 1

let s:save_cpo = &cpo
set cpo&vim

" body

let &cpo = s:save_cpo
unlet s:save_cpo

