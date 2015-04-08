if (exists('g:loaded_ctrlp_dotbookmark') && g:loaded_ctrlp_dotbookmark ) || v:version < 700 || &cp
  finish
endif
let g:loaded_ctrlp_dotbookmark = 1

let s:V  = vital#of('vital')
let s:FP = s:V.import('System.Filepath')
let s:_  = s:V.import('Underscore').import()

let g:dotbookmark#bookmark_file = '~/.bookmark'

function! s:get_directories(dir, ...) abort
  return [a:dir]
        \ + split(glob(s:FP.join(a:dir, '*')), "\n")
        \ + split(glob(s:FP.join(a:dir, '.[^.]*')), "\n")
endfunction

function s:does_not_match_custom_ignore(dir, ...) abort
  if exists('g:ctrlp_custom_ignore["dir"]')
    return (match(a:dir, g:ctrlp_custom_ignore['dir']) ==# -1)
  endif
  return 1
endfunction

call add(g:ctrlp_ext_vars, {
      \ 'init'     : 'ctrlp#dotbookmark#init()',
      \ 'accept'   : 'ctrlp#dotbookmark#accept',
      \ 'lname'    : '.bookmark',
      \ 'sname'    : '.bookmark',
      \ 'type'     : 'path',
      \ 'sort'     : 0,
      \ 'specinput': 0,
      \ })

function! ctrlp#dotbookmark#init() abort
  let file = expand(g:dotbookmark#bookmark_file)
  if filereadable(file)
    let lines = readfile(file)
    return s:_.chain(lines)
          \.map(function('s:get_directories'))
          \.flatten()
          \.filter('isdirectory(v:val)')
          \.filter(function('s:does_not_match_custom_ignore'))
          \.uniq()
          \.value()
  endif
  return []
endfunction

function! ctrlp#dotbookmark#accept(mode, str) abort
  call ctrlp#exit()
  execute ':CtrlP ' . a:str
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#dotbookmark#id() abort
  return s:id
endfunction
