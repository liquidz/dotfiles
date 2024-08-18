set directory=$HOME/.vim/backup

" external grep
if executable('pt')
    set grepprg=pt\ --nogroup\ -iS
    set grepformat=%f:%l:%m
endif

" c.f. http://qiita.com/rbtnn/items/92f80d53803ce756b4b8
" :call TestErrFmt('(%l\,%c):%m',['(1,2): abc','(13,27): xyz','hoge'])
function! TestErrFmt(errfmt,lines)
  let temp_errorfomat = &errorformat
  try
    let &errorformat = a:errfmt
    cexpr join(a:lines,"\n")
    copen
  catch
    echo v:exception
    echo v:throwpoint
  finally
    let &errorformat = temp_errorfomat
  endtry
endfunction

function! s:add_qf_list() abort
  let filename = expand('%:p')
  let lnum = getcurpos()[1]
  let current_window = winnr()

  call setqflist([{
        \ 'filename': filename,
        \ 'lnum': lnum,
        \ 'text': getline('.')
        \ }], 'a')
  try
    copen
  finally
    execute current_window .. 'wincmd w'
  endtry
endfunction

function! s:clear_qf_list() abort
  call setqflist([])
  cclose
endfunction

command! AddQfList call s:add_qf_list()
command! ClearQfList call s:clear_qf_list()

" vim.api.nvim_create_user_command('AddQfList', function(opts)
"   local filename = vim.fn.expand('%:p')
"
"   for i = opts.line1, opts.line2 do
"     vim.fn.setqflist({ { filename = filename, lnum = i, text = vim.fn.getline(i) } }, 'a')
"   end
"   vim.cmd([[copen]])
" end, { range = true })

let g:most_recently_closed = []
augroup MostRecentlyClosed
  autocmd!
  autocmd BufWinLeave * call insert(g:most_recently_closed, expand('<amatch>'))
augroup END

noremap <Up> <Cmd>if len(g:most_recently_closed) > 0 \|
               \     exec ':tabnew ' .. remove(g:most_recently_closed, 0) \|
               \   endif<CR>

function! s:memo() abort
  let fname = strftime('%Y-%m-%d.md')
  let path = expand("$HOME/.vim/memo")
  execute printf(':tabnew %s/%s', path, fname)
endfunction

command! Memo call s:memo()
