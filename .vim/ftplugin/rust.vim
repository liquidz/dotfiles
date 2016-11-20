function! s:myRustRun() abort
  let qrc = (findfile('Cargo.toml', '.;') == '') ? 'rust' : 'rust/cargo'
  execute printf(':QuickRun %s', qrc)
endfunction

nnoremap <buffer> <Leader>r :<C-u>call <SID>myRustRun()<CR>
