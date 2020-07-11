if empty(globpath(&rtp, 'autoload/lightline.vim'))
  finish
endif

"let s:colorscheme = 'iceberg'
let s:colorscheme = 'wombat'

let g:lightline = {
    \ 'colorscheme': s:colorscheme,
    \ 'active': {
    \   'left': [['mode', 'readonly'],
    \            ['paste', 'modified']],
    \   'right': [['lineinfo'], ['percent'], ['fileformat', 'filetype'], ['anzu'], ['iced']]
    \ },
    \ 'component_function': {
    \   'anzu': 'anzu#search_status',
    \   'iced': 'iced#repl#status',
    \ },
    \ 'separator': { 'left': "\ue0b4", 'right': "\ue0b6"},
    \ 'subseparator': { 'left': "\ue0b5", 'right':  "\ue0b7" },
    \ 'tabline': { 'left': [[ 'tabs' ]], 'right': [[ 'bufnum' ]] }
    \ }
