if empty(globpath(&rtp, 'autoload/brightest.vim'))
  finish
endif

let g:brightest#highlight = {
     \ "group" : "BrightestUndercurl"
     \}
" let g:brightest#highlight = {
"      \ "group" : "Underlined"
"      \}
