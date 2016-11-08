set tags+=$HOME/.tags/ruby.tags
set tabstop=2
set shiftwidth=2

"let g:quickrun_config.bundle_rake = {
"    \ 'command'   : 'rake',
"    \ 'exec'      : 'bundle exec %c',
"    \ 'outputter' : 'multi:buffer:quickfix',
"    \ 'hook/cd/directory': yacd#get_root_dir(expand('%:p:h'))
"    \ }
"
"let g:quickrun_config.bundle_rspec = {
"    \ 'command'   : 'rspec',
"    \ 'exec'      : 'bundle exec %c %s',
"    \ 'outputter' : 'multi:buffer:quickfix',
"    \ 'hook/cd/directory': yacd#get_root_dir(expand('%:p:h'))
"    \ }
"
"nnoremap <buffer> <Leader>t :QuickRun bundle_rspec<CR>
setlocal errorformat=%E\ %#%n)\ %.%#,%Z\ %##\ %f:%l:%.%#,%C%m,%-G%.%#
