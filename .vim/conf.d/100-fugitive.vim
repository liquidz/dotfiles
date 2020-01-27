if empty(globpath(&rtp, 'autoload/fugitive.vim'))
  finish
endif

nnoremap <LocalLeader>gc :<C-u>Gcommit -av<CR>
