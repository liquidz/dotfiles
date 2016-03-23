function! ToMarkdown(from, to) abort
  let lines = getline(a:from, a:to)
endfunction

command! -range=% ToMarkdown call ToMarkdown(<line1>, <line2>)
