scriptencoding utf-8
let g:dotfiles = $HOME.'/src/github.com/liquidz/dotfiles'

call plug#begin('~/.vim/repos')
" default {{{

"Plug 'dense-analysis/ale'
Plug 'aklt/plantuml-syntax'
Plug 'cespare/vim-toml'
Plug 'cocopon/iceberg.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/vim-metarepeat'
Plug 'iberianpig/tig-explorer.vim'
Plug 'inside/vim-search-pulse'
Plug 'itchyny/lightline.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-submode'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'kshenoy/vim-signature'
Plug 'lambdalisue/fern.vim'
Plug 'LeafCage/foldCC.vim'
Plug 'liquidz/ctrlme.vim'
Plug 'liquidz/kami.vim'
Plug 'liquidz/vim-textobj-value'
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-sandwich'
Plug 'mattn/sonictemplate-vim'
Plug 'osyo-manga/vim-anzu'
Plug 'previm/previm'
Plug 'rhysd/clever-f.vim'
Plug 'rhysd/vim-color-spring-night'
Plug 'skanehira/translate.vim'
Plug 't9md/vim-choosewin'
Plug 't9md/vim-quickhl'
Plug 'thinca/vim-localrc'
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-themis'
Plug 'thinca/vim-visualstar'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tyru/caw.vim'
Plug 'tyru/open-browser.vim'
Plug 'vim-jp/vital.vim'
Plug 'vim-scripts/confluencewiki.vim'
Plug 'w0ng/vim-hybrid'

if has('nvim')
  Plug 'liuchengxu/vim-clap'
  Plug 'rbgrouleff/bclose.vim' " required by tig-explorer
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
endif

" /default }}}
" filetype {{{

Plug 'nelstrom/vim-textobj-rubyblock', {'for': 'ruby'}
Plug 'thinca/vim-prettyprint',         {'for': 'vim'}
Plug 'vim-scripts/ruby-matchit',       {'for': 'ruby'}
if has('unix')
  if !has('nvim')
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
  endif

  "" Clojure
  Plug 'guns/vim-sexp',           {'for': ['lisp', 'clojure']}
  "Plug 'eraserhd/parinfer-rust',  {'for': 'clojure', 'do': 'cargo build --release'}
  Plug 'kovisoft/paredit',        {'for': ['lisp', 'clojure']}
  Plug '~/src/github.com/liquidz/vim-iced',               {'for': 'clojure'}
  Plug '~/src/github.com/liquidz/vim-iced-fern-debugger', {'for': 'clojure'}
  " Plug 'tpope/vim-classpath', {'for': 'clojure'}
  " Plug 'tpope/vim-fireplace', {'for': 'clojure'}

  "" Common Lisp
  Plug 'l04m33/vlime',            {'for': 'lisp', 'rtp': 'vim'}

  "" Rust
  Plug 'rust-lang/rust.vim',      {'for': 'rust'}
  Plug 'racer-rust/vim-racer',    {'for': 'rust'}
  Plug 'yuratomo/w3m.vim',        {'for': ['lisp', 'rust']}
  Plug 'rhysd/rust-doc.vim',      {'for': 'rust'}

  "" Lua
  Plug 'rhysd/reply.vim', {'for': 'lua'}
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
" =quickhl {{{

nmap <LocalLeader>m <Plug>(quickhl-manual-this)
xmap <LocalLeader>m <Plug>(quickhl-manual-this)
nmap <LocalLeader>M <Plug>(quickhl-manual-reset)
xmap <LocalLeader>M <Plug>(quickhl-manual-reset)

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

  " c.f. ftplugin/clojure.vim
  call submode#enter_with('slurp', 'n', '', '<LocalLeader>ks', ':<C-u>IcedSlurp<CR>')
  call submode#enter_with('slurp', 'n', '', '<LocalLeader>kb', ':<C-u>IcedBarf<CR>')
  call submode#leave_with('slurp', 'n', '', '<Esc>')
  call submode#map('slurp', 'n', '', 's', ':<C-u>IcedSlurp<CR>')
  call submode#map('slurp', 'n', '', 'b', ':<C-u>IcedBarf<CR>')

  " c.f. vim-iced jumping signs
  call submode#enter_with('sign_jump', 'n', '', '<LocalLeader>n', ':<C-u>IcedJumpToNextSign<CR>')
  call submode#enter_with('sign_jump', 'n', '', '<LocalLeader>N', ':<C-u>IcedJumpToPrevSign<CR>')
  call submode#leave_with('sign_jump', 'n', '', '<Esc>')
  call submode#map('sign_jump', 'n', '', 'n', ':<C-u>IcedJumpToNextSign<CR>')
  call submode#map('sign_jump', 'n', '', 'N', ':<C-u>IcedJumpToPrevSign<CR>')

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
" =kami {{{

nnoremap <Leader>ko :KamiOpenFromList<CR>
nnoremap <Leader>kk :KamiOpenToday<CR>
let g:kami#ext = 'adoc'
let g:kami#timestamp_format = '== %s'

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
" =ctrlme {{{

    let g:ctrlme_toml_file = g:dotfiles . '/.vim/conf.d/ctrlme.toml'
    nnoremap <Leader>e :CtrlMe<CR>
    vnoremap <Leader>e :CtrlMe<CR>

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
" =caw {{{

nmap <LocalLeader>g <Plug>(caw:prefix)
xmap <LocalLeader>g <Plug>(caw:prefix)

" }}}
" =sonictemplate {{{

let g:sonictemplate_vim_template_dir = '$HOME/.vim/template'

" }}}
" =ale {{{

let g:ale_lint_on_text_changed = 'never'
let b:ale_linters = {'clojure': ['clj-kondo']}

" }}}
" =coc.nvim {{{

" function! s:coc_check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1] =~# '\s'
" endfunction
"
" iunmap <expr><tab>
" inoremap <expr><tab>
"      \ pumvisible() ? "\<c-n>" :
"      \ <SID>coc_check_back_space() ? "\<Tab>" :
"      \ coc#refresh()

" }}}
" =vim-clap {{{

if !empty(globpath(&rtp, 'autoload/clap.vim'))
  nnoremap <C-p> :<C-u>Clap rg_root_files ++externalfilter=fzf +async<CR>
endif

" }}}
" =quickpick {{{

"let g:quickpick_files_command = 'rg --files --hidden'



" }}}
" =choosewin {{{

nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" }}}
" =asyncomplete.vim {{{

" let g:asyncomplete_auto_popup = 0
"
" function! s:check_back_space() abort
" 	let col = col('.') - 1
" 	return !col || getline('.')[col - 1] =~# '\s'
" endfunction
"
" inoremap <silent><expr> <TAB>
"			\ pumvisible() ? "\<C-n>" :
"			\ <SID>check_back_space() ? "\<TAB>" :
"			\ asyncomplete#force_refresh()
" inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" }}}
" =LanguageServer {{{

if has('nvim')
  " =neovim {{{
  " if executable('vim-language-server')
  "   call lsp#add_filetype_config({
  "        \ 'filetype': 'vim',
  "        \ 'name': 'vim-language-server',
  "        \ 'cmd': 'vim-language-server --stdio',
  "        \ })
  "   set omnifunc=lsp#omnifunc
  "   nnoremap <silent> <buffer> K :call lsp#text_document_hover()<CR>
  "   nnoremap <silent> <buffer> <C-]> :call lsp#text_document_definition()<CR>
  " endif
  " }}}
else
  " =vim {{{
  let g:lsp_signs_enabled = 1
  let g:lsp_diagnostics_echo_cursor = 1
  let g:lsp_signs_error = {'text': 'ｴﾗ'}
  let g:lsp_signs_warning = {'text': 'ﾜｰ'}

    " aug LspIcedLsp
    "   au!
    "   au User lsp_setup call lsp#register_server({
    "       \ 'name': 'iced-lsp',
    "       \ 'cmd': {server_info->['java', '-jar', '/home/uochan/src/github.com/liquidz/iced-lsp/target/iced-lsp.jar']},
    "       \ 'whitelist': ['clojure'],
    "       \ })
    " aug END

  if executable('efm-langserver')
    aug LspEfm
      au!
      au User lsp_setup call lsp#register_server({
            \ 'name': 'efm-langserver',
            \ 'cmd': {server_info->['efm-langserver', '-c=/home/uochan/.config/efm-langserver/config.yaml']},
            \ 'whitelist': ['vim', 'clojure'],
            \ })
    aug END
  endif

  if executable('gopls')
    aug LspGo
      au!
      au User lsp_setup call lsp#register_server({
            \ 'name': 'go-lang',
            \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
            \ 'whitelist': ['go'],
            \ })
      au FileType go setlocal omnifunc=lsp#complete
    aug END
  endif

  if executable('vim-language-server')
    aug LspVimScript
      au!
      au User lsp_setup call lsp#register_server({
            \ 'name': 'vim-language-server',
            \ 'cmd': {server_info->['vim-language-server', '--stdio']},
            \ 'whitelist': ['vim'],
            \ })
      "au FileType vim setlocal omnifunc=lsp#complete
      au FileType vim nnoremap <C-]> :<C-u>LspDefinition<CR>
      au FileType vim nnoremap K :<C-u>LspHover<CR>
    aug END
  endif
  " }}}
endif

" }}}
" =translate.vim {{{

let g:translate_source = 'en'
let g:translate_target = 'ja'

xmap <LocalLeader>en <Plug>(VTranslate)
xmap <LocalLeader>ja <Plug>(VTranslateBang)

" }}}
" developing plugins {{{
" http://www.kaoriya.net/blog/2015/12/01/vim-switch-developing-plugin/
let dirs = [ $HOME.'/src/github.com/liquidz' ]
for pattern in [ 'vim*', '*vim' ]
  for path in globpath(join(dirs, ','), pattern, 0, 1)
    if isdirectory(path) && filereadable(path . '/VIM_AUTO_RTP')
      "echomsg "VIM_AUTO_RTP: ".path
      let &runtimepath = &runtimepath.','.path
    end
  endfor
endfor " }}}
" vim:foldlevel=0
