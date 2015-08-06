
let g:quickrun_config.mix_test = {
    \ 'command'     : 'mix',
    \ 'exec'        : 'mix test',
    \ 'outputter'   : 'quickfix',
    \ 'errorformat' : '%E\ %#%n)\ %.%#,%C\ %#%f:%l,%Z%.%#stacktrace:,%C%m,%-G%.%#',
    \ 'hook/cd/directory': yacd#get_root_dir(expand('%:p:h'))
    \ }

nnoremap <Leader>t :QuickRun mix_test<CR>
