if empty(globpath(&rtp, 'autoload/tig_explorer.vim'))
  finish
endif

nnoremap <LocalLeader>tt :<C-u>TigOpenProjectRootDir<CR>
nnoremap <LocalLeader>tf :<C-u>TigOpenCurrentFile<CR>
nnoremap <LocalLeader>tg :<C-u>TigGrep<CR>
nnoremap <LocalLeader>ts :<C-u>TigStatus<CR>
nnoremap <LocalLeader>tb :<C-u>TigBlame<CR>
