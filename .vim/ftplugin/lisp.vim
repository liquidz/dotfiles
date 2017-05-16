" vlime
nnoremap <Leader>cc :call VlimeConnectREPL()<CR>
nnoremap <Leader>cs :call VlimeSelectCurConnection()<CR>
nnoremap <Leader>ss :call VlimeSendCurThingToREPL("thing")<CR>
nnoremap K          :call VlimeDocumentationSymbol("atom")<CR>
nnoremap <Leader>xc :call VlimeXRefCurSymbol("atom", "CALLS")<CR>
nnoremap <Leader>of :call VlimeCompileCurFile()<CR>
nnoremap <Leader>wa :call VlimeCloseWindow("")<CR>
nnoremap <Leader>i  :call VlimeInteractionMode()<CR>

aug MyVlime
  au!
  au FileType vlime_repl      nnoremap <buffer> q :<C-u>q<CR>
  au FileType vlime_sldb      nnoremap <buffer> q :<C-u>q<CR>
  au FileType vlime_preview   nnoremap <buffer> q :<C-u>q<CR>
  au FileType vlime_notes     nnoremap <buffer> q :<C-u>q<CR>
  au FileType vlime_inspector nnoremap <buffer> q :<C-u>q<CR>

  " repl
  au FileType vlime_repl nnoremap <buffer> <Leader>I :call vlime#ui#repl#InspectCurREPLPresentation()<CR>
  au FileType vlime_repl nnoremap <buffer> <Leader>y :call vlime#ui#repl#YankCurREPLPresentation()<CR>
  " inspector
  au FileType vlime_inspector nnoremap <buffer> R :call b:vlime_conn.InspectorReinspect({c, r -> c.ui.OnInspect(c, r, v:null, v:null)})<CR>

aug END

