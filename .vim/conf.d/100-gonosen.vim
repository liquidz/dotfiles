if empty(globpath(&rtp, 'autoload/gonosen.vim'))
  finish
endif

nnoremap <LocalLeader>go :<C-u>Gonosen<CR>
