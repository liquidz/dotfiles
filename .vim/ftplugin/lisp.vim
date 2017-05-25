" vlime
nnoremap K :call VlimeDocumentationSymbol("atom")<CR>
nnoremap L :call VlimeLoadCurFile()<CR>

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
  au FileType vlime_repl nnoremap <buffer> <LocalLeader>c :call vlime#ui#repl#ClearREPLBuffer()<CR>
aug END


" c.f. VlimeSendCurThingToREPL
" https://github.com/l04m33/vlime/blob/master/vim/plugin/vlime.vim#L114
function! VlimeSendStringToREPL(str) abort
  let conn = VlimeGetConnection()
  if type(conn) == type(v:null)
    return
  endif

  call conn.ui.OnWriteString(conn, "--\n", {'name': 'REPL-SEP', 'package': 'KEYWORD'})
  call conn.WithThread({'name': 'REPL-THREAD', 'package': 'KEYWORD'},
      \ function(conn.ListenerEval, [a:str]))
endfunction

function! VlimeGetCurrentPackage() abort
  let conn = VlimeGetConnection()
  if type(conn) == type(v:null)
    return
  endif
  return conn.GetCurrentPackage()
endfunction

command! -nargs=1 VlimeSendString call VlimeSendStringToREPL(<q-args>)
command! -nargs=1 QuickLispLoad
    \ call VlimeSendStringToREPL(printf("(ql:quickload \"%s\")", <q-args>))
command! -nargs=1 QuickLispSearch
    \ call VlimeSendStringToREPL(printf("(ql:system-apropos \"%s\")", <q-args>))
command! -nargs=1 ClProjectMake
    \ call VlimeSendStringToREPL(printf("(cl-project:make-project #p\"~/.roswell/local-projects/%s\")", <q-args>))
command! QuickLispRegisterLocalProjects
    \ call VlimeSendStringToREPL("(ql:register-local-projects)")
