function! s:myRustRun() abort
  let qrc = (findfile('Cargo.toml', '.;') ==# '') ? 'rust' : 'rust/cargo'
  execute printf(':QuickRun %s', qrc)
endfunction

" 'errorformat': neomake#makers#ft#rust#rustc()['errorformat'],
let g:quickrun_config.cargo_test = {
    \ 'command'    : 'cargo',
    \ 'exec'       : '%c test',
    \ }

nnoremap <buffer> <Leader>r :<C-u>call <SID>myRustRun()<CR>
nnoremap <buffer> <Leader>t :QuickRun cargo_test<CR>
imap <buffer> ii !

