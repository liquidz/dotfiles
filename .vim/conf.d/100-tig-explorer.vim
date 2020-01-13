if empty(globpath(&rtp, 'autoload/tig_explorer.vim'))
  finish
endif

nnoremap <LocalLeader>gf :<C-u>TigOpenCurrentFile<CR>
nnoremap <LocalLeader>gg :<C-u>TigGrep<CR>
nnoremap <LocalLeader>gs :<C-u>TigStatus<CR>
nnoremap <LocalLeader>gb :<C-u>TigBlame<CR>
