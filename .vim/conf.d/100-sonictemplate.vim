scriptencoding utf-8

if empty(globpath(&rtp, 'autoload/sonictemplate.vim'))
  finish
endif

let g:sonictemplate_vim_template_dir = '$HOME/.vim/template'

function! s:my_sonictemplate() abort
  let line = getline(line('.'))
  let input = trim(strpart(line, 0, col('.')))
  let pos = getcurpos()

  if empty(input)
    call fzf#sonictemplate#run()
  else
    call sonictemplate#postfix()
    " 何も展開されなかった
    if pos == getcurpos()
      call fzf#sonictemplate#run()
    endif
  endif
endfunction

nnoremap <silent> <C-l> <Cmd>call <SID>my_sonictemplate()<CR>
inoremap <silent> <C-l> <Cmd>call <SID>my_sonictemplate()<CR>
