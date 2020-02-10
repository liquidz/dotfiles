if empty(globpath(&rtp, 'autoload/fern.vim'))
  finish
endif

" nnoremap <LocalLeader><LocalLeader> :<C-u>Fern %:h -drawer -reveal=% -toggle<CR>
"
" aug MyFernFileSetting
"   au!
"   au FileType fern nmap <buffer><nowait> % <Plug>(fern-action-new-file)
"   au FileType fern nmap <buffer><nowait> d <Plug>(fern-action-new-dir)
"   au FileType fern nmap <buffer><nowait> x <Plug>(fern-action-trash)
"   au FileType fern nmap <buffer><nowait> q :<C-u>close<CR>
" aug END
