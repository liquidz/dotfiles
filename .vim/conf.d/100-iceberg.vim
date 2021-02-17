if empty(globpath(&rtp, 'colors/iceberg.vim'))
  finish
endif

" " set bg=light
" set termguicolors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" colorscheme iceberg

" " Important!!
" if has('termguicolors')
"   set termguicolors
" endif
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" " The configuration options should be placed before `colorscheme forest-night`.
" let g:forest_night_enable_italic = 0
" let g:forest_night_disable_italic_comment = 1
" let g:forest_night_diagnostic_line_highlight = 1
" colorscheme forest-night

" Important!!
if has('termguicolors')
  set termguicolors
endif
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" The configuration options should be placed before `colorscheme edge`.
"let g:edge_style = 'aura'
let g:edge_enable_italic = 0
let g:edge_disable_italic_comment = 1
colorscheme edge
