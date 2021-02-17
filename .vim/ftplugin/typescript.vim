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
