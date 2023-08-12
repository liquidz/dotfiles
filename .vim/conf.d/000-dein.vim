let g:denops_dev = v:false
let g:use_ddu = v:true
let g:use_ddc = v:false
let g:use_cmp = v:false
let g:use_vim_diced = v:false

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

let $BASE_DIR = fnamemodify(expand('<sfile>'), ':h')
call dein#begin(s:dein_path, expand('<sfile>'))

call dein#load_toml('$BASE_DIR/plugin.toml', #{lazy: 0})

if g:use_ddu
  call dein#load_toml('$BASE_DIR/plug_ddu.toml', #{lazy: 0})
endif

if g:use_ddc
elseif g:use_cmp
else
  call dein#load_toml('$BASE_DIR/plug_coc.toml', #{lazy: 0})
endif

" LAZY
call dein#load_toml('$BASE_DIR/plugin_lazy.toml', #{lazy: 1})
call dein#load_toml('$BASE_DIR/lang_clojure.toml', #{lazy: 1})

call dein#end()
call dein#save_state()

" NOTE: filetype detection is needed
if bufname('%') !=# ''
  silent filetype detect
endif

filetype plugin indent on
syntax enable
