if empty(globpath(&rtp, 'plugin/lens.vim'))
  finish
endif

let g:lens#disabled_filetypes = ['fzf']

let g:lens#width_resize_max = 128
let g:lens#height_resize_max = 20
