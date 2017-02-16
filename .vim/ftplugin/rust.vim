function! s:myRustRun() abort
  let qrc = (findfile('Cargo.toml', '.;') ==# '') ? 'rust' : 'rust/cargo'
  execute printf(':QuickRun %s', qrc)
endfunction

function! s:myRustTest() abort
  let full_path = expand('%:p')
  let mod_name = fnamemodify(full_path, ':t:r')
  let test_name = printf('test_%s', mod_name)
  execute quickrun#run({
      \ 'command': 'cargo',
      \ 'args': test_name,
      \ 'exec': '%c test %a',
      \ })
endfunction

" 'errorformat': neomake#makers#ft#rust#rustc()['errorformat'],
let g:quickrun_config.cargo_all_test = {
    \ 'command'    : 'cargo',
    \ 'exec'       : '%c test',
    \ }

nnoremap <buffer> <Leader>r :<C-u>call <SID>myRustRun()<CR>
nnoremap <buffer> <Leader>t :<C-u>call <SID>myRustTest()<CR>
nnoremap <buffer> <Leader>T :QuickRun cargo_all_test<CR>
imap <buffer> ii !

