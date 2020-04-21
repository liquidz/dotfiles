if empty(globpath(&rtp, 'autoload/asyncomplete.vim'))
  finish
endif

let g:asyncomplete_auto_popup = 0
"let g:asyncomplete_popup_delay = 1000

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ asyncomplete#force_refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

if !empty(globpath(&rtp, 'autoload/asyncomplete/sources/nextword.vim')) && executable('nextword')
  let g:asyncomplete_log_file = '/tmp/asyncomplete.log'
  call asyncomplete#register_source(asyncomplete#sources#nextword#get_source_options({
       \   'name': 'nextword',
       \   'whitelist': ['*'],
       \   'args': ['-n', '10000'],
       \   'completor': function('asyncomplete#sources#nextword#completor')
       \   }))
endif
