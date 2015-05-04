let s:save_cpo = &cpo
set cpo&vim

let s:unite_sources = {
    \ 'name': 'foo',
    \ 'default_kind': 'command',
    \ }

function! s:unite_sources.gather_candidates(args, context) abort
  return [{
      \ 'word': 'foo',
      \ 'action__command': 'echo "bar"',
      \ }]
endfunction

function! unite#sources#foo#define() abort
  return s:unite_sources
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

