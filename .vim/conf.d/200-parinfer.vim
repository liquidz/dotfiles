if empty(globpath(&rtp, 'plugin/parinfer.vim'))
  finish
endif

let g:parinfer_mode = 'smart'
let g:parinfer_force_balance = v:true

function! s:parinfer_toggle() abort
  if g:parinfer_mode ==# 'smart'
    let g:parinfer_mode = 'paren'
  else
    let g:parinfer_mode = 'smart'
  endif
  echo printf('Parinfer is "%s" mode now', g:parinfer_mode)
endfunction

command! ParinferToggle call <SID>parinfer_toggle()
nnoremap <Leader>pt :<C-u>ParinferToggle<CR>
