let s:denops = expand("~/.vim/.dvpm-cache/github.com/vim-denops/denops.vim")
if !isdirectory(s:denops)
  execute 'silent! !git clone https://github.com/vim-denops/denops.vim ' .. s:denops
endif

let g:denops_dev = v:false
let g:denops#deno = printf('%s/.deno/bin/deno', $HOME)
"if g:denops_dev
"  call denops#plugin#check_type()
"else
"  let g:denops_server_addr = '127.0.0.1:32123'
"endif

execute 'set runtimepath^=' . substitute(fnamemodify(s:denops, ':p') , '[/\\]$', '', '')
