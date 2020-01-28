if empty(globpath(&rtp, 'autoload/search_pulse.vim'))
  finish
endif

let g:vim_search_pulse_mode = 'cursor_line'
let g:vim_search_pulse_disable_auto_mappings = 1
