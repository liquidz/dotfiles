setl tabstop=2
setl softtabstop=2
setl shiftwidth=2

function s:deno_fmt()
  let path = findfile('package.json', '.;')
  if empty(path)
    let cwd = getcwd()
    let winsave = winsaveview()
    execute "cd" . expand('%:p:h')

    :%!deno fmt -

    execute "cd" . cwd
    call winrestview(winsave)
  endif
endfunction

aug MyDenoConfig
  au!
  au BufWritePre *.ts call s:deno_fmt()
aug END

nmap <Leader>tt :QuickRun typescript_test<CR>

if ! empty(globpath(&rtp, 'autoload/lsp.vim'))
  " vim-lsp
  nmap <C-]> <plug>(lsp-definition)
  nmap K <plug>(lsp-hover)
else
  " coc
  nmap <C-]> <Plug>(coc-definition)
  nmap K <Plug>(coc-diagnostic-info)
  "nmap K <Plug>(coc-codelens-action)
  nmap <Leader>jt <Plug>(coc-type-definition)
  nmap <Leader>hh <Plug>(coc-codeaction-selected)
endif

inoremap ;; <Esc>A;
