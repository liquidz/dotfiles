set tabstop=2
set shiftwidth=2

" help {{{
set keywordprg=:help " Open Vim internal help by K command
augroup MyVimHelp
  autocmd!
  autocmd FileType help nnoremap <buffer> q <C-w>c
augroup END

" }}}

nnoremap <buffer> <Leader>s :<C-u>so%<CR>

"let g:quickrun_config.themis = {
"    \ 'command'   : 'themis',
"    \ 'exec'      : '%c',
"    \ 'hook/cd/directory': yacd#get_root_dir(expand('%:p:h'))
"    \ }
"nnoremap <buffer> <Leader>t :QuickRun themis<CR>

setlocal iskeyword+=:
