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

