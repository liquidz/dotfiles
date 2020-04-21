if empty(globpath(&rtp, 'autoload/coc.vim'))
  finish
endif

function! s:coc_check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

iunmap <expr><tab>
inoremap <expr><tab>
     \ pumvisible() ? "\<c-n>" :
     \ <SID>coc_check_back_space() ? "\<Tab>" :
     \ coc#refresh()
