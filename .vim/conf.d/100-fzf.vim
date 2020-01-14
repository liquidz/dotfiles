if empty(globpath(&rtp, 'autoload/fzf/vim.vim'))
  finish
endif

nnoremap <C-p> :<C-u>GFiles<CR>
