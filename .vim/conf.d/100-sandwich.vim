if empty(globpath(&rtp, 'autoload/sandwich.vim'))
  finish
endif

let g:textobj_sandwich_no_default_key_mappings = 1

omap ii <Plug>(textobj-sandwich-auto-i)
xmap ii <Plug>(textobj-sandwich-auto-i)
omap aa <Plug>(textobj-sandwich-auto-a)
xmap aa <Plug>(textobj-sandwich-auto-a)
