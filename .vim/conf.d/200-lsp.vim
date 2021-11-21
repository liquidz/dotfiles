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

  " For debugging
  let g:lsp_log_file = expand('~/vim-lsp.log')

  let g:lsp_signs_enabled = 1
  let g:lsp_fold_enabled = 0
  let g:lsp_diagnostics_float_cursor = 1

  let g:lsp_document_code_action_signs_enabled = v:false
  " let g:lsp_diagnostics_float_delay = 200
  " let g:lsp_diagnostics_signs_delay = 200

  " c.f. https://www.nerdfonts.com/cheat-sheet
  let g:lsp_diagnostics_signs_error = {'text': "\ufb8f"}
  let g:lsp_diagnostics_signs_warning = {'text': "\uf27a"}
  let g:lsp_diagnostics_signs_hint = {'text': "\uf27a"}
  "let g:lsp_document_code_action_signs_hint = {'text': "\uf0eb"}
  let g:lsp_document_code_action_signs_hint = {'text': "\uf089"}

  " TODO clojure-lsp の diagnostic は止めたい
  let g:lsp_settings = {
				\ 'clojure-lsp': {'disabled': v:false, 'initialization_options': {'linters': {'clj-kondo': {'level': 'off'}}}},
        \ 'json-languageserver': {'disabled': v:true},
        \ 'efm-langserver': { 'disabled': v:false, 'allowlist': ['vim', 'yaml'] },
        \ 'deno': {'disabled': v:false},
        \ 'typescript-language-server': {'disabled': v:true},
        \ 'rome': {'disabled': v:true},
        \ 'eslint-language-server': {'disabled': v:true},
        \ 'sql-language-server': {'disabled': v:true},
        \ 'sqls': {'disabled': v:false, 'allowlist': ['sql']},
        \ 'vim-language-server': {'disabled': v:false},
        \}

  nmap <LocalLeader>ca <plug>(lsp-code-action)
  nmap <LocalLeader>cl <plug>(lsp-code-lens)

  aug VimLspSetting
    au FileType vim nmap <C-]> :<C-u>LspDefinition<CR>
    au FileType sql nmap K <plug>(lsp-hover)
  aug END

endif
