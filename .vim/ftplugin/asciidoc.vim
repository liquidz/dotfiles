if exists('b:loaded_asciidoc_link')
  finish
endif
let b:loaded_asciidoc_link = 1

let s:V = vital#of('vital')
let s:Str = s:V.import('Data.String')

function! s:process_link(link) abort
	if match(a:link, '\v^http') !=# -1
		call openbrowser#open(a:link)
	else
		execute printf(':e! %s', a:link)
	endif
endfunction

function! s:open_link() abort
	let line = getline('.')

	let url = matchstr(line, '\vhttps?://[^ ''"\(\)\[\]]+')
	if url !=# ''
		call s:process_link(url)
		return 0
		return url
	endif

	let url = matchstr(line, '\vlink:.+\[.*\]')
	if url !=# ''

		let path = s:Str.replace_first(url, 'link:', '')
		let path = matchstr(path, '\v[^\[]+')
		call s:process_link(path)
		return 0
	endif

	return 1
endfunction

"command! OpenLink call s:open_link()
"nnoremap <buffer> <C-CR> :<C-u>OpenLink<CR>
nnoremap <buffer> <C-CR> :call <SID>open_link()<CR>
