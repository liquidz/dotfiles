if has('nvim')

  " if executable('vim-language-server')
  "   call lsp#add_filetype_config({
  "        \ 'filetype': 'vim',
  "        \ 'name': 'vim-language-server',
  "        \ 'cmd': 'vim-language-server --stdio',
  "        \ })
  "   set omnifunc=lsp#omnifunc
  "   nnoremap <silent> <buffer> K :call lsp#text_document_hover()<CR>
  "   nnoremap <silent> <buffer> <C-]> :call lsp#text_document_definition()<CR>
  " endif

else
  if empty(globpath(&rtp, 'autoload/lsp.vim'))
    finish
  endif

  let g:lsp_signs_enabled = 1
  let g:lsp_fold_enabled = 0
  let g:lsp_diagnostics_echo_cursor = 1
  let g:lsp_signs_error = {'text': 'ｴｰ'}
  let g:lsp_signs_warning = {'text': 'ﾜｰ'}

  let g:lsp_settings = {
       \  'clojure-lsp': {'disabled': v:true},
       \  'json-languageserver': {'disabled': v:true},
       \  'efm-langserver': {
       \     'disabled': v:false,
       \     'whitelist': ['vim', 'clojure'],
       \   },
       \}

  " if executable('gopls') " {{{
  "   aug LspGo
  "     au!
  "     au User lsp_setup call lsp#register_server({
  "         \ 'name': 'go-lang',
  "         \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
  "         \ 'whitelist': ['go'],
  "         \ })
  "     au FileType go setlocal omnifunc=lsp#complete
  "   aug END
  " endif " }}}
  "
  " if executable('efm-langserver') " {{{
  "   aug LspEfm
  "     au!
  "     au User lsp_setup call lsp#register_server({
  "          \ 'name': 'efm-langserver',
  "          \ 'cmd': {server_info->['efm-langserver', '-c=/home/uochan/.config/efm-langserver/config.yaml']},
  "          \ 'whitelist': ['vim', 'clojure'],
  "          \ })
  "   aug END
  " endif " }}}
  "
  " if executable('vim-language-server') " {{{
  "   aug LspVimScript
  "     au!
  "     au User lsp_setup call lsp#register_server({
  "         \ 'name': 'vim-language-server',
  "         \ 'cmd': {server_info->['vim-language-server', '--stdio']},
  "         \ 'whitelist': ['vim'],
  "         \ })
  "     "au FileType vim setlocal omnifunc=lsp#complete
  "     au FileType vim nnoremap <C-]> :<C-u>LspDefinition<CR>
  "     au FileType vim nnoremap K :<C-u>LspHover<CR>
  "   aug END
  " endif " }}}

endif
" vim:foldlevel=0
