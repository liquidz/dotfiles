scriptencoding utf-8

let s:dein_dir = expand('~/.vim')
let s:rc_dir = expand('~/.vim/rc')

if &compatible
  set nocompatible
endif
set runtimepath^=$HOME/.vim/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml = s:rc_dir . '/dein.toml'
  call dein#load_toml(s:toml, {'lazy': 0})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

"if has('vim_starting')
"  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
"endif
"call neobundle#begin(expand($HOME . '/.vim/bundle/'))
"NeoBundleFetch 'Shougo/neobundle.vim'

"" plugins {{{
"NeoBundle 'liquidz/ctrlp-gonosen.vim'
"
"NeoBundle 'thinca/vim-ref'
"NeoBundleLazy 'yuku-t/vim-ref-ri', {'autoload': {'filetypes': 'ruby'}}
"
"
"NeoBundleLazy 'fatih/vim-go', {'autoload': {'filetypes': 'go'}}
""NeoBundle 'glidenote/memolist.vim'
"NeoBundle 'ujihisa/shadow.vim'
"NeoBundle 'kana/vim-textobj-user'
"NeoBundle 'kana/vim-textobj-line'
""NeoBundle 'osyo-manga/vim-textobj-multiblock'
"NeoBundle 'liquidz/vim-yacd'
"NeoBundle 'liquidz/vim-oretag'
"NeoBundle 'liquidz/vivi.vim', {
"    \ 'depends': [
"    \   'elixir-lang/vim-elixir',
"    \   'Shougo/vimproc.vim',
"    \   'thinca/vim-quickrun',
"    \   'thinca/vim-ref',
"    \   'osyo-manga/shabadou.vim',
"    \   'osyo-manga/vim-watchdogs'
"    \ ]}
"NeoBundle 'aklt/plantuml-syntax'
"NeoBundle 'tomtom/tcomment_vim'
"NeoBundle 'ujihisa/unite-colorscheme'
"NeoBundle 'junegunn/vim-easy-align'
"NeoBundle 'terryma/vim-multiple-cursors'
"NeoBundle 'mattn/vim-cheat'
"NeoBundle 'liquidz/vim-shelltest'
"NeoBundle 'liquidz/kami.vim'
"NeoBundle 'rcmdnk/vim-markdown'
"NeoBundle 'wellle/visual-split.vim'
"
"" neocomplete
"if has('lua')
"  NeoBundle 'Shougo/neocomplete.vim'
"  NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', {
"      \ 'autoload': {'filetype': 'ruby'},
"      \ 'depends': ['Shougo/neocomplete.vim']}
"endif
"
"" neosnippet
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundleLazy 'vim-scripts/ruby-matchit', {'autoload': {'filetypes': 'ruby'}}
"NeoBundleLazy 'nelstrom/vim-textobj-rubyblock', {'autoload': {'filetypes': 'ruby'}}
"NeoBundle 'tpope/vim-endwise'
"NeoBundle 'elixir-lang/vim-elixir'
"NeoBundle 'vim-scripts/confluencewiki.vim'
"NeoBundle 'regedarek/ZoomWin'
"
"if has('unix')
"  NeoBundleLazy 'guns/vim-clojure-static', {'autoload': {'filetypes': 'clojure'}}
"  NeoBundle 'kien/rainbow_parentheses.vim'
"  NeoBundleLazy 'tpope/vim-fireplace', {'autoload': {'filetypes': 'clojure'}}
"  NeoBundleLazy 'tpope/vim-classpath', {'autoload': {'filetypes': 'clojure'}}
"  NeoBundleLazy 'typedclojure/vim-typedclojure', {'autoload': {'filetypes': 'clojure'}}
"  NeoBundle 'majutsushi/tagbar'
"endif
"
"if system('uname') ==# "Darwin\n"
"  NeoBundle 'vim-jp/vimdoc-ja'
"  NeoBundle 'rizzatti/dash.vim'
"endif
"
"call neobundle#end()
"filetype plugin indent on
"
"NeoBundleCheck
"" }}}
"
"" unite.vim {{{
"let g:unite_enable_start_insert = 1
"call unite#custom#source('file_rec', 'ignore_pattern',
"    \ '\v[\/](bundle|target|cookbook|Vendor)')
"
"nnoremap [Unite] <Nop>
"nmap <Space> [Unite]
""nnoremap <C-p>    :<C-u>UniteWithProjectDir file_rec<CR>
"nnoremap [Unite]<Space> :<C-u>Unite<Space>
""nnoremap [Unite]f :<C-u>Unite file<CR>
""nnoremap [Unite]b :<C-u>Unite buffer<CR>
"nnoremap [Unite]l :<C-u>Unite line<CR>
"nnoremap [Unite]m :<C-u>Unite output:messages<CR>
""nnoremap [Unite]cd :<C-u>Unite -default-action=rec ghq bookmark bookmark/file<CR>
"" レポジトリ配下であればルートディレクトリからgrepするようにする
"function! s:mygrep() abort
"  if exists('b:yacd_buf_root_dir') && b:yacd_buf_root_dir !=# ''
"    execute ':Unite grep:' . b:yacd_buf_root_dir
"  else
"    execute ':Unite grep:.'
"  endif
"endfunction
"nnoremap [Unite]gg :call <SID>mygrep()<CR>
""" unite-tag
"nnoremap [Unite]t :<C-u>Unite tag<CR>
"" unite-help"
"nnoremap [Unite]h :<C-u>Unite help<CR>
""" yankround
"nnoremap [Unite]y :<C-u>Unite yankround<CR><Esc>
"
"augroup MyUnite
"  autocmd!
"  autocmd FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
"  autocmd FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"augroup END
"
"if executable('pt')
"  let g:unite_source_grep_command = 'pt'
"  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
"  let g:unite_source_grep_recursive_opt = ''
"  let g:unite_source_grep_encoding = 'utf-8'
"endif
"
"let g:unite_source_menu_menus = {}
"let g:unite_source_menu_menus.git = {
"    \ 'description' : 'Git commands',
"    \ }
"let g:unite_source_menu_menus.git.command_candidates = {
"    \ 'git status'      : 'Gstatus',
"    \ 'git branch'      : 'Merginal',
"    \ 'git add'         : 'Gwrite',
"    \ 'git diff'        : 'Gdiff',
"    \ 'git log'         : 'Gitv',
"    \ 'git commit'      : 'Gcommit -av',
"    \ 'git push'        : 'Gpush',
"    \ 'git pull'        : 'Gpull',
"    \ 'git pull-request': 'Git pull-request',
"    \ 'git ci-status'   : 'Git ci-status',
"    \ 'git browse'      : 'Git browse',
"    \ }
"nnoremap [Unite]gi :Unite menu:git<CR>
"" }}}
"
"" VimFiler {{{
"let g:vimfiler_safe_mode_by_default = 0
"let g:vimfiler_as_default_explorer  = 1
"let g:vimfiler_sort_type            = 'filename'
"let g:vimfiler_enable_auto_cd       = 1
"
"nnoremap <Leader><leader> :VimFiler<CR>
"
"aug VimFilerKeyMapping
"  au!
"  autocmd FileType vimfiler call s:vimfiler_local()
"
"  function! s:vimfiler_local()
"    " キーマップのカスタマイズ
"    nmap <buffer> <C-r> <Plug>(vimfiler_rename_file)
"    nmap <buffer> a <Plug>(vimfiler_toggle_mark_all_lines)
"    nmap <buffer> m <Plug>(vimfiler_set_current_mask)
"    nmap <buffer> M <Plug>(vimfiler_move_file)
"    nmap <buffer> D <Plug>(vimfiler_make_directory)
"    nmap <buffer> h <Plug>(vimfiler_smart_h)
"    nmap <buffer> F <Plug>(vimfiler_new_file)
"    nunmap <buffer> t
"
"    " 関連付け
"    if has('unix')
"      call vimfiler#set_execute_file('sh', 'sh')
"      call vimfiler#set_execute_file('html,htm,pdf,jpg,gif,png,svg,lzh,mp3,mpg,wmv,rm,flv', 'open')
"    endif
"
"    "nnoremap <buffer> z <C-u>:CtrlPListWithAction :VimFiler %s<CR>
"
"    " Unite bookmark連携
"    nnoremap <buffer> z <C-u>:Unite bookmark<CR>
"    nnoremap <buffer> A <C-u>:UniteBookmarkAdd<CR>
"    " Unite bookmarkのアクションをVimFilerに
"    call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
"  endfunction
"aug END
"" }}}
"
"" }}}
"
"
"
"
"
"
"
"
"
"
"" rainbow_parentheses {{{
"let g:rbpt_colorpairs = [
"    \ ['brown',       'RoyalBlue3'],
"    \ ['darkgreen',   'firebrick3'],
"    \ ['darkcyan',    'RoyalBlue3'],
"    \ ['darkred',     'SeaGreen3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['brown',       'firebrick3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['darkgreen',   'firebrick3'],
"    \ ['darkcyan',    'SeaGreen3'],
"    \ ['darkred',     'DarkOrchid3'],
"    \ ['red',         'firebrick3'],
"    \ ]
"
"if neobundle#is_installed('rainbow_parentheses.vim')
"  aug MyRainbowParentheses
"    au!
"    au VimEnter * RainbowParenthesesToggle
"    au Syntax * RainbowParenthesesLoadRound
"    au Syntax * RainbowParenthesesLoadSquare
"    au Syntax * RainbowParenthesesLoadBraces
"  aug END
"endif
"" }}}
"
"
"
"" vim-ref {{{
"let g:ref_phpmanual_path = $HOME . '/.vim/vim-ref/php-chunked-xhtml'
"let g:ref_source_webdict_sites = {
"    \   'weblio' : {
"    \     'url'  : 'http://ejje.weblio.jp/content/%s',
"    \     'line' : 70
"    \   },
"    \   'chef' : {
"    \     'url'  : 'http://docs.opscode.com/resource_%s.html',
"    \     'line' : 40
"    \   }
"    \ }
"nnoremap <Leader>dic :Ref webdict
"aug VimRefKeyMapping
"  au!
"  autocmd FileType php nnoremap <Space>r :Unite ref/phpmanual<CR>
"aug END
"" }}}
"
"" vim-yacd {{{
"let g:yacd#enable = 1
"let g:yacd#root_names = ['Rakefile', 'mix.exs', '.root', '.git']
"" }}}
"
""let g:vim_spy_auto_start = 1
"
"" vim-slack {{{
"nnoremap <Leader>sp  :SlackPost<Space>
"" }}}
"
"" neocomplete {{{
"if neobundle#is_installed('neocomplete.vim')
"  " neocomplete用設定
"  let g:neocomplete#enable_at_startup = 1
"  let g:neocomplete#enable_ignore_case = 1
"  let g:neocomplete#enable_smart_case = 1
"  if !exists('g:neocomplete#keyword_patterns')
"    let g:neocomplete#keyword_patterns = {}
"  endif
"  let g:neocomplete#keyword_patterns._ = '\h\w*'
"
"  aug NeoCompleteLock
"    au!
"    au FileType clojure nested NeoCompleteLock
"  aug END
"endif
"" }}}
"
"" neosnippet {{{
"let g:neosnippet#snippets_directory = $HOME . '/.vim/snippets'
"imap <C-k> <Plug>(neosnippet_expand_or_jump)
"smap <C-k> <Plug>(neosnippet_expand_or_jump)
"xmap <C-k> <Plug>(neosnippet_expand_target)
"nnoremap [Unite]s :Unite neosnippet<CR>
"" }}}
"
"" vim-fireplace {{{
"if neobundle#is_installed('vim-fireplace')
"  aug VimFireplaceSetting
"    au!
"    au Filetype clojure nnoremap <Leader>r :Require!<CR>
"    " vim-ref の K と競合するため再定義
"    au Filetype clojure nmap <buffer> K <Plug>FireplaceK
"  aug END
"endif
"" }}}
"
"
"" oretag {{{
"if executable('ctags')
"  let g:oretag#enable = 1
"  let g:oretag#tag_dir = expand('$HOME/.tags')
"endif
"" }}}

"
"" tagbar {{{
"let g:tagbar_foldlevel = 1
""let g:tagbar_autofocus = 1
""let g:tagbar_autoclose = 1
"let g:tagbar_iconchars = ['+', '-']
"nnoremap <Leader>T :<C-u>TagbarOpenAutoClose<CR>
"" }}}
"
"" vim-textobj-multiblock {{{
"omap ab <Plug>(textobj-multiblock-a)
"omap ib <Plug>(textobj-multiblock-i)
"xmap ab <Plug>(textobj-multiblock-a)
"xmap ib <Plug>(textobj-multiblock-i)
"" }}}
"
"" unite-colorscheme {{{
"nnoremap <silent> [Unite]c :<C-u>Unite colorscheme<CR>
"" }}}
"
"" vim-easy-align {{{
"vmap <Enter> <Plug>(EasyAlign)
"let g:easy_align_delimiters = {
"    \ '>': { 'pattern': '->\|=>' }
"    \ }
"" }}}
"
"" vim-multiple-cursors {{{
"let g:multi_cursor_use_default_mapping = 0
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<C-c>'
"" }}}
"
"" vivi.vim {{{
"let g:vivi_enable_default_key_mappings = 1
"let g:vivi_enable_auto_syntax_checking = 1
"let g:vivi_enable_auto_warm_up_iex     = 1
"let g:vivi_enable_omni_completion      = 1
"
"aug MyViviVim
"  au!
"  au BufWritePost *.ex call vivi#module#reload(vivi#module#name())
"aug END
"" }}}
"
"" kami.vim {{{
"nnoremap <Leader>ko :KamiOpenFromList<CR>
"nnoremap <Leader>kk :KamiOpenToday<CR>
"let g:kami#ext = 'adoc'
"let g:kami#timestamp_format = '== %s'
"" }}}
"
"" vim-markdown {{{
"let g:vim_markdown_no_default_key_mappings = 1
"" }}}
"
" vim:fdl=0
