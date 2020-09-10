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
nnoremap <buffer> <Leader>tn :<C-u>call uochan#themis#run_current_suite()<CR>
nnoremap <buffer> <Leader>tt :<C-u>call uochan#themis#run_under_cursor()<CR>
nnoremap <buffer> <Leader>tr :<C-u>call uochan#themis#rerun()<CR>
nnoremap <buffer> <Leader>tp :<C-u>call uochan#themis#run_all()<CR>
nnoremap <buffer> <Leader>tl :<C-u>call uochan#themis#clear()<CR>

"let g:quickrun_config.themis = {
"    \ 'command'   : 'themis',
"    \ 'exec'      : '%c',
"    \ 'hook/cd/directory': yacd#get_root_dir(expand('%:p:h'))
"    \ }
"nnoremap <buffer> <Leader>t :QuickRun themis<CR>

setlocal iskeyword+=:
