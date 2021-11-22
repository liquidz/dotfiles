if empty(globpath(&rtp, 'colors/ayu.vim'))
  finish
endif


" Important!!
if has('termguicolors')
  set termguicolors
endif

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"let ayucolor="dark"   " for dark version of theme
let ayucolor="mirage" " for mirage version of theme

colorscheme ayu
