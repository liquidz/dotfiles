" preview
noremap <buffer> p <CR>zz<C-w>p

setlocal errorformat=%f\|%l\ col\ %c\|%m

function! RemoveQfEntry() abort
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction

" command! RemoveQFItem :call RemoveQfEntry()
" aug MyQfSetting
"   au!
"   au FileType qf nnoremap <buffer> dd :RemoveQFItem<CR>
" aug END

nnoremap <buffer> <silent> dd
  \ <Cmd>call setqflist(filter(getqflist(), {idx -> idx != line('.') - 1}), 'r') <Bar> cc<CR>
