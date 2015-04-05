set tags+=$HOME/.tags/ruby.tags
set tabstop=2
set shiftwidth=2

let g:rsenseUseOmniFunc = 1

let g:quickrun_config.bundle_rake = {
            \ 'command'   : 'rake',
            \ 'exec'      : 'bundle exec %c',
            \ 'outputter' : 'multi:buffer:quickfix'
            \ }
nnoremap <Leader>t :QuickRun bundle_rake<CR>
setlocal errorformat=%E\ %#%n)\ %.%#,%Z\ %##\ %f:%l:%.%#,%C%m,%-G%.%#
