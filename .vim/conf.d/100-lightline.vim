if empty(globpath(&rtp, 'autoload/lightline.vim'))
  finish
endif

"let s:colorscheme = 'iceberg'
let s:colorscheme = 'wombat'

let g:lightline = {
    \ 'colorscheme': s:colorscheme,
    \ 'active': {
    \   'left': [['mode', 'paste'],
    \            ['readonly', 'modified']],
    \   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'], ['anzu'], ['iced']]
    \ },
    \ 'component_function': {
    \   'anzu': 'anzu#search_status',
    \   'iced': 'iced#repl#status',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '|', 'right': '|' },
    \ 'tabline': { 'left': [[ 'tabs' ]], 'right': [[ 'bufnum' ]] }
    \ }
