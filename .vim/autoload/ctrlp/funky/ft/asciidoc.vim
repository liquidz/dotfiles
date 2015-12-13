" Language: AsciiDoc (asciidoc)
" Author: Masashi Iizuka
" License: The MIT License

function! ctrlp#funky#ft#asciidoc#filters()
  let filters = [
        \ { 'pattern': '\m\C^=\{1,6}[\t ]\+\S\+',
        \   'formatter': []}
  \ ]
  return filters
endfunction
