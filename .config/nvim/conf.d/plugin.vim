call plug#begin('~/.vim/repos')

Plug 'aklt/plantuml-syntax'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gregsexton/gitv'
Plug 'idanarye/vim-merginal'
Plug 'inside/vim-search-pulse'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
"Plug 'justinmk/vim-dirvish'
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-submode'

Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'kannokanno/previm'
Plug 'kien/rainbow_parentheses.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'rhysd/clever-f.vim'
Plug 't9md/vim-quickhl'
Plug 'tacahiroy/ctrlp-funky'
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-themis'
Plug 'thinca/vim-visualstar'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-jp/vital.vim'
Plug 'vim-scripts/confluencewiki.vim'

Plug 'vim-scripts/gtags.vim'
Plug 'w0ng/vim-hybrid'

Plug 'neomake/neomake'
Plug 'kassio/neoterm'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

Plug 'fatih/vim-go',                   {'for': 'go'}
Plug 'zchee/deoplete-go', {'for': 'go', 'do': 'make'}
Plug 'vim-scripts/ruby-matchit',       {'for': 'ruby'}
Plug 'nelstrom/vim-textobj-rubyblock', {'for': 'ruby'}
Plug 'thinca/vim-prettyprint',         {'for': 'vim'}
if has('unix')
  Plug 'guns/vim-clojure-static',      {'for': 'clojure'}
  Plug 'tpope/vim-fireplace',          {'for': 'clojure'}
  Plug 'guns/vim-sexp',                {'for': 'clojure'}
  Plug 'tpope/vim-classpath',          {'for': 'clojure'}
endif

call plug#end()


set background=dark
colorscheme hybrid

" search puls
  let g:vim_search_pulse_mode = 'cursor_line'
  let g:vim_search_pulse_disable_auto_mappings = 1

  nmap n <Plug>(anzu-n)<Plug>Pulse
  nmap N <Plug>(anzu-N)<Plug>Pulse
  nmap * <Plug>(anzu-star)<Plug>Pulse
  nmap # <Plug>(anzu-sharp)<Plug>Pulse

" clever-f
  let g:clever_f_across_no_line = 1
  let g:clever_f_ignore_case = 1

" ctrlp
  let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
  let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
  let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く
  let g:ctrlp_show_hidden         = 1   " 隠しファイルも表示
  let g:ctrlp_match_window        = 'results:50'
  let g:ctrlp_follow_symlinks     = 1
  let g:ctrlp_root_markers        = ['.root', 'project.clj']
  let g:ctrlp_custom_ignore = {
      \   'dir' : '\v[\/](\.git|\.hg|\.svn|cookbooks|target|Vendor|.dein|cache)$',
      \   'file': '\v\.(o|bk|org|exe|so|dll|skl|cgi|gitkeep)$',
      \   'link': 'some_bad_symbolic_links',
      \ }
  let g:ctrlp_prompt_mappings = {
      \ 'PrtCurLeft()'   : ['<c-b>', '<left>'],
      \ 'PrtCurRight()'  : ['<c-f>', '<right>'],
      \ 'PrtClearCache()': ['<c-l>'],
      \ }
  nnoremap <Leader>ct  :CtrlPTag<CR>
  nnoremap <Leader>b   :CtrlPBuffer<CR>
  nnoremap <Leader>cd  :CtrlPGonosen<CR>
  nnoremap <Leader>ccc :CtrlPClearCache<CR>

" ctrlp-funky
  nnoremap <Leader>f :CtrlPFunky<Cr>

" previm
  " set empty to use open-browser.vim
  let g:previm_open_cmd = ''
  aug PrevimSettings
    au!
    au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
  aug END

" quickhl
  nmap <Space>m <Plug>(quickhl-manual-this)
  xmap <Space>m <Plug>(quickhl-manual-this)
  nmap <Space>M <Plug>(quickhl-manual-reset)
  xmap <Space>M <Plug>(quickhl-manual-reset)

"repo = 'itchyny/lightline.vim'
  function! MyFugitive()
    let l:branch = exists('*fugitive#head') ? fugitive#head() : ''
    if l:branch ==# 'master'
      let l:branch = printf('!! %s !!', toupper(l:branch))
    endif
  
    return l:branch
  endfunction

  let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [['mode', 'paste'],
      \            ['fugitive', 'readonly', 'modified']],
      \   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'], ['anzu']]
      \ },
      \ 'component_function': {
      \   'ale': 'ALEGetStatusLine',
      \   'fugitive': 'MyFugitive',
      \   'anzu': 'anzu#search_status',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' },
      \ 'tabline': { 'left': [[ 'tabs' ]], 'right': [[ 'bufnum' ]] }
      \ }

" repo = 'junegunn/vim-easy-align'
  vmap <Enter> <Plug>(EasyAlign)
  let g:easy_align_delimiters = {
      \ '>': { 'pattern': '->\|=>' }
      \ }

" repo = 'kana/vim-submode'
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
  catch
    echo 'submode is not installed'
    PlugInstall vim-submode
  endtry

" deoplete
let g:deoplete#enable_at_startup = 1

" neomake
aug MyNeoMake
  au!
  au BufWritePost * Neomake
aug END
