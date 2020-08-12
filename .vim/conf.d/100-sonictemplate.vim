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
    call feedkeys(':Template ', 'n')
  else
    call sonictemplate#postfix()

    " 何も展開されなかった
    if pos == getcurpos()
      " Esc された分、1つ左にずれているため
      let pos[2] += 1
      call setpos('.', pos)
      call feedkeys(':Template ', 'n')
    endif
  endif
endfunction
command! MyTemplate call s:my_sonictemplate()

inoremap <silent> <C-l> <Esc>:<C-u>MyTemplate<CR>
