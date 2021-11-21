if empty(globpath(&rtp, 'autoload/tig_explorer.vim'))
  finish
endif

function! s:tig_grep() abort
  let reg_save = @@
  try
    normal! yiw
    let pattern = @@
    if empty(pattern)
      silent execute ':TigGrep'
    else
      call feedkeys(printf(':TigGrep %s', pattern), 'n')
    endif
  finally
    let @@ = reg_save
  endtry
endfunction

nnoremap <LocalLeader>gf :<C-u>TigOpenCurrentFile<CR>
nnoremap <silent> <LocalLeader>gg :call <SID>tig_grep()<CR>
nnoremap <LocalLeader>gs :<C-u>TigStatus<CR>
nnoremap <LocalLeader>gb :<C-u>TigBlame<CR>
