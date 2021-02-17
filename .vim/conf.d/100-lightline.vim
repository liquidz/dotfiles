if empty(globpath(&rtp, 'autoload/lightline.vim'))
  finish
endif

"let s:colorscheme = 'iceberg'
"let s:colorscheme = 'wombat'
"let s:colorscheme = 'forest_night'
let s:colorscheme = 'edge'

function! MyCocStatus() abort
  return get(g:, 'coc_status', '')
endfunction

let g:lightline = {
    \ 'colorscheme': s:colorscheme,
    \ 'active': {
    \   'left': [['mode', 'readonly'],
    \            ['paste', 'modified']],
    \   'right': [['lineinfo'], ['fileformat', 'filetype'], ['anzu'], ['coc_status'], ['iced_multi_session'], ['iced']]
    \ },
    \ 'component_function': {
    \   'anzu': 'anzu#search_status',
    \   'iced': 'iced#repl#status',
    \   'iced_multi_session': 'iced_multi_session#current',
    \   'coc_status': 'MyCocStatus',
    \ },
    \ 'separator': { 'left': "\ue0b4", 'right': "\ue0b6"},
    \ 'subseparator': { 'left': "\ue0b5", 'right':  "\ue0b7" },
    \ 'tabline': { 'left': [[ 'tabs' ]], 'right': [[ 'bufnum' ]] }
    \ }
