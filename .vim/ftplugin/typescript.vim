function s:deno_fmt()
    let cwd = getcwd()
    let winsave = winsaveview()
    execute "cd" . expand('%:p:h')

    :%!deno fmt -

    execute "cd" . cwd
    call winrestview(winsave)
endfunction

aug MyDenoConfig
  au!
  au BufWritePre *.ts call s:deno_fmt()
aug END

nmap <Leader>tt :QuickRun typescript_test<CR>

nmap <C-]> <Plug>(coc-definition)
nmap K <Plug>(coc-diagnostic-info)
"nmap K <Plug>(coc-codelens-action)
nmap <Leader>jt <Plug>(coc-type-definition)
nmap <Leader>hh <Plug>(coc-codeaction-selected)

inoremap ;; <Esc>A;
