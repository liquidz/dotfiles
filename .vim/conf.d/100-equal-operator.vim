if empty(globpath(&rtp, 'plugin/operator.vim'))
  finish
endif

let equal_operator_default_mappings = 0

omap =h <Plug>(operator-lhs)
omap =l <Plug>(operator-rhs)
vmap =h <Plug>(visual-lhs)
vmap =l <Plug>(visual-rhs)
