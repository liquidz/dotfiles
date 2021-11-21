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

nmap <silent> <space>rn <Plug>(coc-rename)

command! LspRenameSymbol :call CocActionAsync('rename')
"command! LspRenameSymbol :call CocAction('rename')

aug MyCocSetting
  au!
  au FileType typescript nnoremap <buffer> K :call CocActionAsync('doHover')<CR>
aug END
