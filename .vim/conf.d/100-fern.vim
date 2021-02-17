if empty(globpath(&rtp, 'autoload/fern.vim'))
  finish
endif

nnoremap <LocalLeader><LocalLeader> :<C-u>Fern %:h<CR>

aug MyFernFileSetting
  au!
	" lambdalisue/fern-bookmark.vim
  au FileType fern nmap <buffer><nowait> b :<C-u>Fern bookmark:///<CR>
aug END
