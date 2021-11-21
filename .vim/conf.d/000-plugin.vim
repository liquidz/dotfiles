scriptencoding utf-8
let g:dotfiles = $HOME.'/src/github.com/liquidz/dotfiles'

let s:use_ddc = v:false
let g:use_vim_diced = v:false

call plug#begin('~/.vim/repos')

" default {{{

" Deno/Denops
Plug 'vim-denops/denops.vim'
"Plug 'vim-denops/denops-helloworld.vim'
"Plug '~/src/github.com/liquidz/denops-helloworld.vim'
"Plug '~/src/github.com/liquidz/dps-paredit'

Plug 'github/copilot.vim'

" Plug 'thinca/vim-themis'

"Plug 'szw/vim-maximizer'

Plug 'aklt/plantuml-syntax'
Plug 'ayu-theme/ayu-vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/vim-metarepeat'
"Plug 'hrsh7th/vim-eft'
Plug 'iberianpig/tig-explorer.vim'
Plug 'inside/vim-search-pulse'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-submode'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'kshenoy/vim-signature'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/readablefold.vim'
Plug 'LeafCage/yankround.vim'
Plug 'liquidz/vim-textobj-value'
Plug 'liuchengxu/vim-which-key'
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-sandwich'
Plug 'mattn/vim-sonictemplate'
Plug 'osyo-manga/vim-anzu'
Plug 'osyo-manga/vim-brightest'
Plug 'powerman/vim-plugin-AnsiEsc', {'for': 'quickrun'}
Plug 'previm/previm'
Plug 'skanehira/translate.vim'
Plug 't9md/vim-quickhl'
Plug 'thinca/vim-localrc'
Plug 'thinca/vim-qfreplace'
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-visualstar'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tyru/caw.vim'
Plug 'tyru/columnskip.vim'
Plug 'tyru/open-browser.vim'
Plug 'vim-jp/vital.vim'
Plug 'yuki-yano/vim-operator-replace'

" /default }}}
" filetype {{{

Plug 'nelstrom/vim-textobj-rubyblock', {'for': 'ruby'}
Plug 'thinca/vim-prettyprint',         {'for': 'vim'}
Plug 'vim-scripts/ruby-matchit',       {'for': 'ruby'}

if s:use_ddc
  Plug 'Shougo/ddc.vim'
  Plug 'Shougo/pum.vim'
  Plug 'Shougo/ddc-around'
  Plug 'Shougo/ddc-nextword'
  Plug 'Shougo/ddc-cmdline-history'
  "Plug 'matsui54/ddc-filter_editdistance'
  Plug 'matsui54/ddc-matcher_fuzzy'
  Plug 'shun/ddc-vim-lsp'
endif

if has('unix')
  if !s:use_ddc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
  endif

  "" Clojure {{{
  Plug 'guns/vim-sexp',           {'for': ['lisp', 'clojure']}
  Plug 'eraserhd/parinfer-rust',  {'for': 'clojure', 'do': 'cargo build --release'}
  "Plug 'liquidz/paredit',         {'for': ['lisp', 'clojure']}
  if g:use_vim_diced
    Plug '~/src/github.com/liquidz/vim-diced',              {'for': 'clojure'}
  else
    Plug '~/src/github.com/liquidz/vim-iced',               {'for': 'clojure'}
    Plug '~/src/github.com/liquidz/vim-iced-fern-debugger', {'for': 'clojure'}
    Plug '~/src/github.com/liquidz/vim-iced-function-list', {'for': 'clojure'}
    Plug '~/src/github.com/liquidz/vim-iced-kaocha',        {'for': 'clojure'}
    Plug '~/src/github.com/liquidz/vim-iced-multi-session', {'for': 'clojure'}
  endif
  if s:use_ddc
    if g:use_vim_diced
      Plug '~/src/github.com/liquidz/vim-diced-ddc-source', {'for': 'clojure'}
    else
      Plug '~/src/github.com/liquidz/vim-iced-ddc-source', {'for': 'clojure'}
    endif
  else
    if g:use_vim_diced
		else
			Plug '~/src/github.com/liquidz/vim-iced-coc-source', {'for': 'clojure'}
		endif
    " Plug '~/src/github.com/liquidz/vim-diced-coc-source', {'for': 'clojure'}
  endif


  " }}}

  "" Common Lisp
  Plug 'l04m33/vlime',            {'for': 'lisp', 'rtp': 'vim'}

  "" Rust
  Plug 'rust-lang/rust.vim',      {'for': 'rust'}
  " Plug 'racer-rust/vim-racer',    {'for': 'rust'}
  " Plug 'yuratomo/w3m.vim',        {'for': ['lisp', 'rust']}
  " Plug 'rhysd/rust-doc.vim',      {'for': 'rust'}

  "" Lua
  Plug 'rhysd/reply.vim', {'for': ['lua', 'typescript']}

  Plug 'ziglang/zig.vim'

  if has('nvim')
    " ---- NEOVIM ----
    "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'subnut/nvim-ghost.nvim', {'do': ':call nvim_ghost#installer#install()'}

    "Plug 'abecodes/tabout.nvim'


    "Plug 'Olical/conjure', {'tag': 'v4.3.1'}
  else
    " ---- VIM ----

    if s:use_ddc
      Plug 'prabirshrestha/vim-lsp'
      Plug 'mattn/vim-lsp-settings'
    endif


    " Plug 'prabirshrestha/asyncomplete.vim'
    " Plug 'prabirshrestha/asyncomplete-lsp.vim'
    " Plug 'high-moctane/asyncomplete-nextword.vim'
    " Plug '~/src/github.com/liquidz/vim-iced-asyncomplete',  {'for': 'clojure'}


  endif
endif

" /filetype }}}

call plug#end()

" =search puls {{{

nmap n <Plug>(anzu-n)<Plug>Pulse
nmap N <Plug>(anzu-N)<Plug>Pulse
nmap * <Plug>(anzu-star)<Plug>Pulse
nmap # <Plug>(anzu-sharp)<Plug>Pulse

" }}}
" =quickrun {{{


" }}}
" =previm {{{

if has('unix')
  let g:previm_open_cmd = 'env DISPLAY=:0 xdg-open'
endif
if has('mac')
  " set empty to use open-browser.vim
  let g:previm_open_cmd = ''
endif

aug PrevimSettings
  au!
  au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
aug END

" }}}
" =vim-easy-align {{{

vmap <Enter> <Plug>(EasyAlign)
let g:easy_align_delimiters = {
    \ '>': { 'pattern': '->\|=>' }
    \ }

" }}}
" =vim-easymotion {{{

map e <Plug>(easymotion-prefix)
let g:EasyMotion_keys='hklyuiopnm,qwertzxcvbasdgjf'

" }}}
" =vim-sexp {{{

let g:sexp_filetypes = 'clojure,lisp'
"let g:sexp_enable_insert_mode_mappings = 1
let g:sexp_mappings = {
    \ 'sexp_indent': '',
    \ 'sexp_indent_top': '',
    \ }

" }}}
" =vim-submode {{{

let g:submode_timeout = 0
try
  call submode#enter_with('window', 'n', '', '<C-w><C-w>', '<Nop>')
  call submode#leave_with('window', 'n', '', '<Esc>')
  call submode#map('window', 'n', '', 'j', '<C-w>j')
  call submode#map('window', 'n', '', 'J', '<C-w>J')
  call submode#map('window', 'n', '', 'k', '<C-w>k')
  call submode#map('window', 'n', '', 'K', '<C-w>K')
  call submode#map('window', 'n', '', 'l', '<C-w>l')
  call submode#map('window', 'n', '', 'L', '<C-w>L')
  call submode#map('window', 'n', '', 'h', '<C-w>h')
  call submode#map('window', 'n', '', 'H', '<C-w>h')
  call submode#map('window', 'n', '', 's', '<C-w>s')
  call submode#map('window', 'n', '', 'v', '<C-w>v')
  call submode#map('window', 'n', '', 'x', ':q<CR>')
  call submode#map('window', 'n', '', '>', '<C-w>5>')
  call submode#map('window', 'n', '', '<', '<C-w>5<lt>')
  call submode#map('window', 'n', '', '+', '<C-w>5+')
  call submode#map('window', 'n', '', '-', '<C-w>5-')

  " c.f. vim-iced jumping signs
  call submode#enter_with('sign_jump', 'n', '', '<LocalLeader>n', ':<C-u>IcedJumpToNextSign<CR>')
  call submode#enter_with('sign_jump', 'n', '', '<LocalLeader>N', ':<C-u>IcedJumpToPrevSign<CR>')
  call submode#leave_with('sign_jump', 'n', '', '<Esc>')
  call submode#map('sign_jump', 'n', '', 'n', ':<C-u>IcedJumpToNextSign<CR>')
  call submode#map('sign_jump', 'n', '', 'N', ':<C-u>IcedJumpToPrevSign<CR>')

  " " c.f. ftplugin/clojure.vim
  " call submode#enter_with('slurp', 'n', '', '<LocalLeader><', ':<C-u>DPSlurpSexp<CR>')
  " call submode#enter_with('slurp', 'n', '', '<LocalLeader>>', ':<C-u>DPBarfSexp<CR>')
  " call submode#leave_with('slurp', 'n', '', '<Esc>')
  " call submode#map('slurp', 'n', '', 's', ':<C-u>DPSlurpSexp<CR>')
  " call submode#map('slurp', 'n', '', 'b', ':<C-u>DPBarfSexp<CR>')

  call submode#enter_with('window', 'v', '', '<', '<Nop>')
  call submode#leave_with('window', 'v', '', '<Esc>')

catch
  echo 'submode is not installed'
  PlugInstall vim-submode
endtry

" }}}
" =rainbow {{{

let g:rainbow_active = 1
let g:rainbow_conf = {
      \ 'ctermfgs': ['darkmagenta', 'red', 'darkcyan', 'brown', 'darkgreen', 'darkred'],
      \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \ 'separately': {'*': 0, 'clojure': {}}
      \ }

" }}}
" =completor {{{

" let g:completor_auto_trigger = 0
" let g:completor_set_options = 0
" let g:completor_disable_filename = ['clojure']
" let g:completor_complete_options = 'menu,noselect'
" let g:completor_clojure_omni_trigger = '[\w!$%&*+/:<=>?@\^_~\-\.#]{2,}'
"
" function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
"
" inoremap <silent><expr> <TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ <SID>check_back_space() ? "\<TAB>" :
"  \ "<C-R>=completor#do('complete')<CR>"
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" }}}
" =deoplete {{{

let g:deoplete#enable_at_startup = 1
let g:deoplete#keyword_patterns = {}
"let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

" }}}
" =foldCC.vim {{{

set foldtext=FoldCCtext()

" }}}
" =ultisnips {{{

let g:UltiSnipsExpandTrigger='<c-tab>'
let g:UltiSnipsJumpForwardTrigger='<c-l>'
""let g:UltiSnipsJumpBackwardTrigger='<c-z>'
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
"
""  let g:neosnippet#snippets_directory = $HOME . '/.vim/snippets'
""  imap <C-k> <Plug>(neosnippet_expand_or_jump)
""  smap <C-k> <Plug>(neosnippet_expand_or_jump)
""  xmap <C-k> <Plug>(neosnippet_expand_target)
""  nnoremap [Unite]s :Unite neosnippet<CR>

" }}}
" =rust.vim {{{

let g:rustfmt_autosave = 1

" }}}
" =vim-racer {{{
"if has('unix')
"  aug MyVimRacer
"    au!
"    au FileType rust nmap <C-]> <Plug>(rust-def)
"    "au FileType rust nmap gs <Plug>(rust-def-split)
"  aug END
"endif
" }}}
" =w3m.vim {{{

function! s:w3m_local_vsplit(path) abort
  let path = substitute(a:path, "'", '', 'g')
  execute(printf(':W3mVSplit local %s', path))
endfunction
command! -nargs=1 W3mLocalVSplit call s:w3m_local_vsplit(<q-args>)

" }}}
" =rust-doc.vim {{{

let g:rust_doc#vim_open_cmd = 'W3mLocalVSplit'
let g:rust_doc#downloaded_rust_doc_dir = '~/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu'

" }}}
" =vlime {{{

let g:vlime_window_settings = {
    \ 'repl':      { 'pos': 'botright',   'size': 60, 'vertical': v:true},
    \ 'sldb':      { 'pos': 'belowright', 'size': 20},
    \ 'inspector': { 'pos': 'belowright', 'size': 10}
    \ }

let g:vlime_compiler_policy = { 'DEBUG': 3 }

" }}}
" =ale {{{

let g:ale_lint_on_text_changed = 'never'
let b:ale_linters = {'clojure': ['clj-kondo']}

" }}}
" =vim-clap {{{

" if !empty(globpath(&rtp, 'autoload/clap.vim'))
"   "nnoremap <C-p> :<C-u>Clap rg_root_files ++externalfilter=fzf +async<CR>
"   nnoremap <C-p> :<C-u>Clap files ++externalfilter=fzf +async<CR>
" endif

" }}}
" =quickpick {{{

"let g:quickpick_files_command = 'rg --files --hidden'



" }}}
" =choosewin {{{

nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" }}}
" =translate.vim {{{

let g:translate_source = 'en'
let g:translate_target = 'ja'

xmap <LocalLeader>en <Plug>(VTranslate)
xmap <LocalLeader>ja <Plug>(VTranslateBang)

" }}}

let g:print_debug_templates = {
      \ 'javascript': 'console.log(`+++ {}`);',
      \ 'clojure': '(log/info "+++ {}")',
      \ 'vim': 'echom printf(''+++ {}'')',
      \ }
nnoremap <localleader>p :call print_debug#print_debug()<cr>


" FIXME https://github.com/LeafCage/yankround.vim
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <Tab> <Plug>(yankround-prev)
nmap <S-Tab> <Plug>(yankround-next)
let g:yankround_use_region_hl = 1

" FIXME
let g:scratch_persistence_file = '/tmp/scratch.txt'

let g:translator_target_lang = ''
let g:translator_source_lang = ''


let g:translator_default_engines = ['google']

" TEMP: vim-maximizer
nnoremap <silent> <C-w>o <Cmd>MaximizerMaximize<CR>
nnoremap <silent> <C-w>O <C-w>o
nnoremap <silent> <C-w>m <Cmd>MaximizerRestore<CR>

" developing plugins {{{
" http://www.kaoriya.net/blog/2015/12/01/vim-switch-developing-plugin/
let s:dirs = [ $HOME.'/src/github.com/liquidz' ]
for pattern in [ 'vim*', '*vim', 'dps*' ]
  for path in globpath(join(s:dirs, ','), pattern, 0, 1)
    if isdirectory(path) && filereadable(path . '/VIM_AUTO_RTP')
      "echom printf('VIM_AUTO_RTP: %s', path)
      let &runtimepath = &runtimepath.','.path
    end
  endfor
endfor " }}}
