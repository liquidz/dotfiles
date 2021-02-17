if empty(globpath(&rtp, 'autoload/which_key.vim'))
  finish
endif

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

set timeoutlen=500

if !exists('g:which_key_map')
  let g:which_key_map = {}
endif

let g:which_key_map["'"] = 'Make connection to nREPL'
let g:which_key_map['"'] = 'Start REPL and connect to it'

let g:which_key_map['e'] = {
      \ 'name' : '+evaluating',
      \ 'i': 'Evaluate inner element',
      \ 'e': 'Evaluate outer list',
      \ 't': 'Evaluate outer top list',
      \ 'n': 'Evaluate ns form',
      \ 'u': 'Undefine symbol',
      \ 'U': 'Undefine all symbols in ns',
      \ }

let g:which_key_map['t'] = {
      \ 'name' : '+testing',
      \ }


let g:which_key_map['s'] = {
      \ 'name' : '+stdout buffer',
      \ }
let g:which_key_map['r'] = {
      \ 'name' : '+refactoring',
      \ }

let g:which_key_map['h'] = {
      \ 'name' : '+help/document',
      \ }

let g:which_key_map['b'] = {
      \ 'name' : '+browsing',
      \ }

let g:which_key_map['j'] = {
      \ 'name' : '+jumping',
      \ }
