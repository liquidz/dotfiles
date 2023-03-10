" echom 'kiteru?'
" aug MyCocZigSetting
"   au!
"   au FileType zig nmap <silent> <C-]> <Plug>(coc-definition)
"   au FileType zig nnoremap <silent> K <Cmd>call CocAction('doHover')<CR>
" aug END

let g:zig_fmt_parse_errors = 1

function! s:add_semicolon() abort
  let view = winsaveview()
  let m = mode()
  try
    if getline('.') !~# ';$'
      silent normal! A;
    endif
  finally
    call winrestview(view)
  endtry
endfunction

nmap <silent> <C-]> <Plug>(coc-definition)
nnoremap <silent> K <Cmd>call CocAction('doHover')<CR>

inoremap <silent> ;; <Cmd>call <SID>add_semicolon()<CR>
nnoremap <silent> ;; <Cmd>call <SID>add_semicolon()<CR>

nnoremap <silent> <Leader>tt <Cmd>QuickRun zig_test<CR>

setl iskeyword=@,48-57,_,@-@,?
