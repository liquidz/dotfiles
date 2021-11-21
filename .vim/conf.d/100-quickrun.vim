scriptencoding utf-8
if empty(globpath(&rtp, 'autoload/quickrun.vim'))
  finish
endif

nmap <LocalLeader>r <Plug>(quickrun)

" 結果を縦分割で表示
let b:quickrun_config = {'_': {'split': 'vertical'}}
" 横分割時は下､ 縦分割時は右へ新しいウィンドウを開く
set splitbelow
set splitright

let g:quickrun_config = {
      \   '_': {
      \     'runner/vimproc/updatetime'      : 60,
      \     'hook/back_window/enable_exit'   : 1,
      \     'hook/back_window/priority_exit' : 100,
      \   },
      \   'go': {
      \     'command' : 'go',
      \     'exec'    : '%c run %s'
      \   },
      \   'matlab': {
      \     'command' : 'octave',
      \     'exec'    : '%c -q %s'
      \   },
      \   'make': {
      \     'command'   : 'make',
      \     'exec'      : '%c %o',
      \     'outputter' : 'error:buffer:quickfix'
      \   },
      \   'tla': {
      \     'command': 'tlc',
      \     'exec'   : '%c %s'
      \   },
      \   'julia': {
      \     'command': 'julia',
      \     'exec'   : '%c %s'
      \   },
      \   'yaml': {
      \     'command': 'actionlint',
      \     'exec'   : '%c %s'
      \   },
      \   'zig': {
      \     'command': 'zig',
      \     'exec'   : '%c test %s'
      \   },
      \   'liz': {
      \     'command': 'sh',
      \     'exec'   : '%c -c ''liz %s && zig version''',
      \   },
      \   'typescript': {
      \     'command': 'deno',
      \     'exec'   : '%c run --allow-all --unstable %s'
      \   },
      \   'typescript_test': {
      \     'command': 'deno',
      \     'exec'   : '%c --unstable test --allow-all %s'
      \   },
      \   'watchdogs_checker/phpcs': {
      \     'command' : 'phpcs',
      \     'exec'    : '%c --report=emacs %s'
      \   },
      \   'php/watchdogs_checker': {
      \     'type'
      \       : executable('phpcs') ? 'watchdogs_checker/phpcs'
      \       : executable('php') ? 'watchdogs_checker/php'
      \       : ''
      \   },
      \   'watchdogs_checker/rubocop' : {
      \     'command'     : 'rubocop',
      \     'exec'        : 'bundle exec %c %o %s:p',
      \     'errorformat' : '%f:%l:%c:%m',
      \   },
      \   'ruby/watchdogs_checker': {
      \     'type'
      \       : executable('rubocop') ? 'watchdogs_checker/rubocop'
      \       : executable('ruby') ? 'watchdogs_checker/ruby'
      \       : '',
      \   },
      \ }

aug quickrun
  au!
  au FileType quickrun AnsiEsc
aug END
