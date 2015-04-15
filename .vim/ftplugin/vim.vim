set tabstop=2
set shiftwidth=2

nnoremap <Leader>s :<C-u>so%<CR>

let g:quickrun_config.themis = {
    \ 'command'   : 'themis',
    \ 'exec'      : '%c',
    \ 'hook/cd/directory': yacd#get_root_dir(expand('%:p:h'))
    \ }
nnoremap <Leader>t :QuickRun themis<CR>
