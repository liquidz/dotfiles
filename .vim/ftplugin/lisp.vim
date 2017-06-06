" vlime
nnoremap K :call VlimeDocumentationSymbol("atom")<CR>
nnoremap L :call VlimeLoadFile(expand("%:p"))<CR>


"vnoremap I :call VlimeInspectCurThing("selection")<CR>

aug MyVlime
  au!
  au FileType vlime_repl      nnoremap <buffer> q :<C-u>q<CR>
  au FileType vlime_sldb      nnoremap <buffer> q :<C-u>q<CR>
  au FileType vlime_preview   nnoremap <buffer> q :<C-u>q<CR>
  au FileType vlime_notes     nnoremap <buffer> q :<C-u>q<CR>
  au FileType vlime_inspector nnoremap <buffer> q :<C-u>q<CR>

  " repl
  au FileType vlime_repl nnoremap <buffer> <LocalLeader>i :call vlime#ui#repl#InspectCurREPLPresentation()<CR>
  au FileType vlime_repl nnoremap <buffer> <C-l> :call vlime#ui#repl#ClearREPLBuffer()<CR>
aug END

function! VlimeGetCurrentPackage() abort
  let conn = VlimeGetConnection()
  if type(conn) == type(v:null)
    return
  endif
  return conn.GetCurrentPackage()
endfunction

function! s:myClTest() abort
  let s:V = vital#of('vital')
  let s:S = s:V.import('Data.String')

  let current_file = expand('%:p')
  let test_file = s:S.reverse(s:S.replace_first(s:S.reverse(current_file), '/crs/', '/t/'))

  "let sexpr = printf('(prove:run #P"%s")', test_file)
  let sexpr = printf('(prove:run #P"%s" :reporter :tap)', test_file)
  call vlime#plugin#SendToREPL(sexpr)
endfunction

command! -nargs=1 VlimeSendString call vlime#plugin#SendToREPL(<q-args>)
command! -nargs=1 QuickLispLoad
    \ call vlime#plugin#SendToREPL(printf("(ql:quickload \"%s\")", <q-args>))
command! -nargs=1 QuickLispSearch
    \ call vlime#plugin#SendToREPL(printf("(ql:system-apropos \"%s\")", <q-args>))
command! -nargs=1 ClProjectMake
    \ call vlime#plugin#SendToREPL(printf("(cl-project:make-project #p\"~/.roswell/local-projects/%s\")", <q-args>))
command! QuickLispRegisterLocalProjects
    \ call vlime#plugin#SendToREPL("(ql:register-local-projects)")
command! QuickLispRegisterLocalProjects
    \ call vlime#plugin#SendToREPL("(ql:register-local-projects)")
command! ProveDisableColor
    \ call vlime#plugin#SendToREPL("(setf prove:*enable-colors* ())")

command! MyClTest call s:myClTest()
nnoremap <buffer> <Leader>t :<C-u>MyClTest<CR>
