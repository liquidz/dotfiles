if (exists('g:loaded_ctrlp_dotbookmark') && g:loaded_ctrlp_dotbookmark ) || v:version < 700 || &cp
  finish
endif
let g:loaded_ctrlp_dotbookmark = 1

let s:V = vital#of('vital')
let s:FP = s:V.import('System.Filepath')
let s:_ = s:V.import('Underscore').import()

let g:dotbookmark#bookmark_file = '~/.bookmark'

function! s:glob_dir(dir, ...) abort
  let name = s:FP.join(a:dir, '*')
  return split(glob(name), "\n")
endfunction

function! s:is_dir(dir, ...) abort
  return isdirectory(a:dir)
endfunction

call add(g:ctrlp_ext_vars, {
      \ 'init'     : 'ctrlp#dotbookmark#init()',
      \ 'accept'   : 'ctrlp#dotbookmark#accept',
      \ 'lname'    : '.bookmark',
      \ 'sname'    : '.bookmark',
      \ 'type'     : 'line',
      \ 'sort'     : 0,
      \ 'specinput': 0,
      \ })

function! ctrlp#dotbookmark#init() abort
  let lines = readfile(expand(g:dotbookmark#bookmark_file))
  return s:_.chain(lines)
        \.map(function('s:glob_dir'))
        \.flatten()
        \.filter(function('s:is_dir'))
        \.value()
endfunction

function! ctrlp#dotbookmark#accept(mode, str) abort
  call ctrlp#exit()
  execute ':CtrlP ' . a:str
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#dotbookmark#id() abort
  return s:id
endfunction
