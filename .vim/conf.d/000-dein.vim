"finish

let g:denops_dev = v:false
let g:use_ddu = v:true
let g:use_ctrlp = v:false
let g:use_fzf = v:true
let g:use_ddc = v:false
let g:use_cmp = v:false
let g:use_vim_iced = v:true
let g:use_vim_elin = v:false

if stridx(getcwd(), 'vim-elin') != -1
      \ || stridx(getcwd(), 'antq') != -1
      \ || stridx(getcwd(), 'build.edn') != -1
  echom printf('ELIN ENABLED!')
  let g:use_vim_iced = v:false
  let g:use_vim_elin = v:true
endif

" ==================================================
" AUTO INSTALLING DEIN
" ==================================================
let s:cache_dir = empty($XDG_CACHE_HOME) ? expand('~/.vim/.cache') : $XDG_CACHE_HOME
let s:dein_path = s:cache_dir .. '/dein'

let s:repo = 'https://github.com/Shougo/dein.vim'
let s:tmp =  split(s:repo, '/')[2:]
let s:target_rtp = join(s:tmp[1:], '/')
let s:dein_repo_path = s:cache_dir .. '/dein/repos/' .. join(s:tmp, '/')

if ! isdirectory(s:cache_dir)
  call mkdir(s:cache_dir, 'p')
endif

if &runtimepath !~# s:target_rtp
  if ! isdirectory(s:dein_repo_path)
    execute '!git clone ' .. s:repo s:dein_repo_path
  endif

  execute 'set runtimepath+=' .. s:dein_repo_path
endif

" ==================================================
" DEIN CONFIGURATION
" ==================================================
" let g:dein#auto_recache = !has('win32')

"if dein#min#load_state(s:dein_path)
  let $BASE_DIR = fnamemodify(expand('<sfile>'), ':h')
  call dein#begin(s:dein_path, expand('<sfile>'))

  call dein#load_toml('$BASE_DIR/plugin.toml', #{lazy: 0})
  if has('nvim')
    call dein#load_toml('$BASE_DIR/plugin.nvim.toml', #{lazy: 0})
  endif

  if g:use_ddu
    call dein#load_toml('$BASE_DIR/plug_ddu.toml', #{lazy: 0})
  endif

  if g:use_ctrlp
    call dein#load_toml('$BASE_DIR/plug_ctrlp.toml', #{lazy: 0})
  endif

  if g:use_fzf
    call dein#load_toml('$BASE_DIR/plug_fzf.toml', #{lazy: 0, merged: 0})
  endif

  if g:use_ddc
  elseif g:use_cmp
  else
    call dein#load_toml('$BASE_DIR/plug_coc.toml', #{lazy: 0})
  endif

  " LAZY
  call dein#load_toml('$BASE_DIR/plugin_lazy.toml', #{lazy: 1})
  call dein#load_toml('$BASE_DIR/lang_clojure.toml', #{lazy: 1})

  call dein#load_toml('$BASE_DIR/plug_iced.toml', #{lazy: 1})
  call dein#load_toml('$BASE_DIR/plug_elin.toml', #{lazy: 1})

  call dein#end()
"   call dein#save_state()
" endif

" NOTE: filetype detection is needed
if bufname('%') !=# ''
  silent filetype detect
endif

" ==================================================
function! s:load_plugins_by_timer(_) abort
  let s:manual_load_plugins = []
  for s:name in keys(g:dein#_plugins)
    let s:plugin = get(g:dein#_plugins, s:name)
    if get(s:plugin, 'lazy', 0) == 1
          \ && get(s:plugin, 'sourced', 1) == 0
          \ && get(s:plugin, 'on_my_timer', 'off') ==# 'on'
      call add(s:manual_load_plugins, s:plugin)
    endif
  endfor
  " echom printf('FIXME %s', keys(g:dein#_plugins))
  " echom printf('FIXME %s', g:dein#_plugins['plantuml-syntax' ])
  " echom printf('FIXME %s', s:manual_load_plugins)
  call dein#source(s:manual_load_plugins)
endfunction
call timer_start(200, funcref('s:load_plugins_by_timer'))

filetype plugin indent on
syntax enable

command! DeinRecacheRuntimepath call dein#recache_runtimepath()
command! DeinUpdate call dein#update()
