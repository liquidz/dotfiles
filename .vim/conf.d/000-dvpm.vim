function! s:git_pull(path, url) abort
  if !isdirectory(a:path)
    execute printf('silent! !git clone %s %s', a:url, a:path)
  endif
  return a:path
endfunction

function! s:add_to_rtp(path) abort
  execute 'set runtimepath^=' . substitute(fnamemodify(a:path, ':p') , '[/\\]$', '', '')
endfunction

let s:denops = s:git_pull(
      \ expand("~/.vim/.dvpm-cache/github.com/vim-denops/denops.vim"),
      \ 'https://github.com/vim-denops/denops.vim',
      \ )

let g:denops_dev = v:false
let g:denops#deno = printf('%s/.deno/bin/deno', $HOME)
call s:add_to_rtp(s:denops)
"if g:denops_dev
"  call denops#plugin#check_type()
"else
"  let g:denops_server_addr = '127.0.0.1:32123'
"endif

"execute 'set runtimepath^=' . substitute(fnamemodify(s:denops, ':p') , '[/\\]$', '', '')

"if has('nvim')
"  call s:add_to_rtp(
"        \ s:git_pull(
"        \   expand('~/.vim/.dvpm-cache/github.com/klen/nvim-config-local'),
"        \   'https://github.com/klen/nvim-config-local',
"        \ ))
"  lua << EOT
"    require('config-local').setup({
"      config_files = { ".local.vimrc" },
"      lookup_parents = true,
"      silent = true,
"    })
"EOT
"endif

