let s:V = vital#vital#new()
let s:B  = s:V.import('Vim.Buffer')
let s:BM = s:V.import('Vim.BufferManager')

let s:manager = s:BM.new()
let s:out_buf_name = 'themis result'
let s:out_buf = {}

let s:last_args = {}

let g:uochan#themis#bin = get(g:, 'uochan#themis#bin', './.vim-themis/bin/themis')

function! s:init_buf() abort
  if !empty(s:out_buf)
    return
  endif

  let s:out_buf = s:manager.open(s:out_buf_name)
  call setbufvar(s:out_buf.bufnr, '&bufhidden', 'hide')
  call setbufvar(s:out_buf.bufnr, '&buflisted', 0)
  call setbufvar(s:out_buf.bufnr, '&buftype', 'nofile')
  call setbufvar(s:out_buf.bufnr, '&swapfile', 0)
  silent execute ':q'
endfunction

function! s:open_buf() abort
  let nr = get(s:out_buf, 'bufnr', -1)
  if nr < 0 | return | endif
  let current_window = winnr()

  try
    let &eventignore = 'WinEnter,WinLeave,BufEnter,BufLeave'
    if bufwinnr(nr) == -1
      " not opened
      call s:B.open(nr, {
            \ 'opener': 'split',
            \ 'mods': 'vertical',
            \ })
    endif
  finally
    let &eventignore = ''
  endtry
endfunction

function! uochan#themis#suite_name() abort
  let view = winsaveview()

  try
    call cursor(1, 1)
    let [row, column] = searchpos('themis#suite', 'n')

    if row == 0 && column == 0
      return
    endif

    let line = getline(row)
    let res = matchlist(line, '''\(.\+\)''')
    if res == []
      return
    endif

    return res[1]
  finally
    call winrestview(view)
  endtry
endfunction

function! uochan#themis#test_name() abort
  let view = winsaveview()
  let result = ''

  try
    while v:true
      let line = getline('.')
      if !empty(line) && line[0] !=# ' '
        let res = matchlist(line, 'function!\s\+[^.]\+\.\([^(]\+\)')
        if !empty(res)
          let result = res[1]
        endif
        break
      endif

      if line('.') == 1 | break | endif
      " Move cursor up
      silent normal! k
    endwhile
  finally
    call winrestview(view)
  endtry

  return result
endfunction

function! s:term_start(cmd, ...) abort
  let win = winnr()

  try
    call s:init_buf()
    call s:open_buf()
    let workdir = get(a:, 1, trim(system('git rev-parse --show-toplevel')))

    let s:last_args = {
          \ 'cmd': a:cmd,
          \ 'workdir': workdir,
          \ }
    call term_start(a:cmd, {
          \ 'term_name': 'uochan#themis',
          \ 'cwd': workdir,
          \ 'hidden': v:true,
          \ 'norestore': v:true,
          \ 'out_io': 'buffer',
          \ 'out_buf': s:out_buf.bufnr,
          \ })
  finally
    " move window focus to previous
    silent exe printf('%dwincmd w', win)

  endtry
endfunction

function! uochan#themis#run_all() abort
  call s:term_start([g:uochan#themis#bin])
endfunction

function! uochan#themis#run_current_suite() abort
  let suite_name = uochan#themis#suite_name()
  if empty(suite_name)
    return
  endif

  let cmd = [
        \ g:uochan#themis#bin,
        \ '--target',
        \ printf('%s ', substitute(suite_name, '\.', '\\\.', 'g')),
        \ ]

  call s:term_start(cmd)
endfunction

function! uochan#themis#run_under_cursor() abort
  let suite_name = uochan#themis#suite_name()
  if empty(suite_name)
    return
  endif

  let test_name = uochan#themis#test_name()
  if empty(test_name) | return | endif

  let cmd = [
        \ g:uochan#themis#bin,
        \ '--target',
        \ printf('%s %s', substitute(suite_name, '\.', '\\\.', 'g'), test_name),
        \ ]
  call s:term_start(cmd)
endfunction

function! uochan#themis#rerun() abort
  if empty(s:last_args) | return | endif
  call s:term_start(s:last_args.cmd, s:last_args.workdir)
endfunction

function! uochan#themis#clear() abort
  let nr = get(s:out_buf, 'bufnr', -1)
  if nr < 0 | return | endif
  silent call deletebufline(nr, 1, '$')
endfunction


