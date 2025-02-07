function! s:ddu_sonictemplate() abort
  let candidates = sonictemplate#complete('', '', 0)
  let id = denops#callback#register(
        \ {s -> sonictemplate#apply(s, 'n')},
        \ {'once': v:true})

  stopinsert
  call ddu#start({
       \ 'sources': [{'name': 'custom-list',
       \              'params': {'texts': candidates, 'callbackId': id}}],
       \ 'uiParams': {'ff': {'startFilter': v:true}},
       \ })
endfunction

function! s:telescope_sonictemplate() abort
  let candidates = sonictemplate#complete('', '', 0)
  let id = denops#callback#register(
        \ {s -> sonictemplate#apply(s, 'n')},
        \ {'once': v:true})
  call luaeval('require("uochan.telescope").sonictemplate(_A[1], _A[2])', [id, candidates])
endfunction

function! s:my_sonictemplate() abort
  let line = getline(line('.'))
  let input = trim(strpart(line, 0, col('.')))
  let pos = getcurpos()

  if empty(input)
    if g:use_telescope
      return s:telescope_sonictemplate()
    endif

    return call fzf#sonictemplate#run()
    " call s:ddu_sonictemplate()
  else
    call sonictemplate#postfix()
    " 何も展開されなかった
    " if pos == getcurpos()
    "   call fzf#sonictemplate#run()
    " endif
  endif
endfunction

nnoremap <silent> <LocalLeader>l <Cmd>call <SID>my_sonictemplate()<CR>
inoremap <silent> <LocalLeader>l <Cmd>call <SID>my_sonictemplate()<CR>
