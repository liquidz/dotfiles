scriptencoding utf-8
let g:dotfiles = $HOME.'/src/github.com/liquidz/dotfiles'

let s:use_ddc = v:false
let g:use_vim_diced = v:false

function! s:has_plug(name) abort
  return exists('g:plugs') && !empty(get(g:plugs, a:name))
endfunction

call plug#begin('~/.vim/repos')

" default {{{

" Deno/Denops
Plug 'vim-denops/denops.vim'
"Plug 'vim-denops/denops-helloworld.vim'
"Plug '~/src/github.com/liquidz/denops-helloworld.vim'
"Plug '~/src/github.com/liquidz/dps-paredit'

"Plug 'github/copilot.vim'

" Plug 'thinca/vim-themis'

Plug 'hrsh7th/vim-searchx'


Plug 'aklt/plantuml-syntax', {'on': []}
"Plug '~/src/github.com/liquidz/plantuml-syntax', {'on': []}
Plug 'ayu-theme/ayu-vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'easymotion/vim-easymotion', {'on': '<Plug>(easymotion-prefix)'}
"Plug 'haya14busa/vim-metarepeat'
"Plug 'hrsh7th/vim-eft'
Plug 'iberianpig/tig-explorer.vim', {'on': ['TigStatus', 'TigGrep', 'TigBlame']}
Plug 'inside/vim-search-pulse', {'on': []}
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs', {'on': []}
Plug 'junegunn/fzf', { 'on': [], 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', {'on': ['Files']}
Plug 'junegunn/vim-easy-align', {'on': '<Plug>(EasyAlign)'}
Plug 'kana/vim-operator-user'
Plug 'kana/vim-submode'
Plug 'kana/vim-textobj-line', {'on': []}
Plug 'kana/vim-textobj-user'
"Plug 'kshenoy/vim-signature', {'on': []}

Plug 'lambdalisue/fern.vim', {'on': 'Fern', 'for': 'clojure'}
     \ | Plug 'lambdalisue/fern-hijack.vim', {'on': 'Fern'}
Plug 'lambdalisue/readablefold.vim', {'on': []}
Plug 'LeafCage/yankround.vim', {'on': []}
"Plug 'liuchengxu/vim-which-key'
Plug 'luochen1990/rainbow', {'on': []}
Plug 'machakann/vim-sandwich', {'on': []}
Plug 'mattn/vim-sonictemplate', {'on': []}
Plug 'osyo-manga/vim-anzu', {'on': []}
Plug 'osyo-manga/vim-brightest', {'on': []}
Plug 'powerman/vim-plugin-AnsiEsc', {'for': 'quickrun'}
Plug 'previm/previm', {'on': 'PrevimOpen', 'for': ['markdown', 'asciidoc']}
Plug 'skanehira/translate.vim', {'on': ['<Plug>(VTranslate)', '<Plug>(VTranslateBang)']}
Plug 't9md/vim-quickhl', {'on': []}
Plug 'thinca/vim-localrc'
Plug 'thinca/vim-qfreplace', {'on': 'Qfreplace'}
Plug 'thinca/vim-quickrun', {'on': '<Plug>(quickrun)'}
Plug 'thinca/vim-visualstar', {'on': []}
Plug 'tpope/vim-endwise', {'on': []}
"Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat', {'on': []}
Plug 'tyru/caw.vim', {'on': '<Plug>(caw:prefix)'}
Plug 'tyru/columnskip.vim', {'on': ['<Plug>(columnskip-j)', '<Plug>(columnskip-k)']}
Plug 'tyru/open-browser.vim', {'on': []}
Plug 'vim-jp/vital.vim', {'for': ['vim', 'asciidoc']}
Plug 'yuki-yano/vim-operator-replace', {'on': []}

" /default }}}
" filetype {{{

Plug 'nelstrom/vim-textobj-rubyblock', {'for': 'ruby'}
Plug 'thinca/vim-prettyprint',         {'for': 'vim'}
Plug 'vim-scripts/ruby-matchit',       {'for': 'ruby'}

if s:use_ddc
  Plug 'Shougo/ddc.vim'
  "Plug 'Shougo/pum.vim'
  Plug 'Shougo/ddc-around'
  Plug 'Shougo/ddc-cmdline-history'
  "Plug 'matsui54/ddc-filter_editdistance'
  Plug 'matsui54/ddc-matcher_fuzzy'
  Plug 'Shougo/ddc-matcher_head'
  Plug 'Shougo/ddc-matcher_length'
  Plug 'shun/ddc-vim-lsp'
endif

if has('unix')
  if !s:use_ddc
    Plug 'neoclide/coc.nvim', {'on': [], 'for': 'clojure', 'branch': 'release'}
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
  endif


  "" Common Lisp
  Plug 'l04m33/vlime',            {'for': 'lisp', 'rtp': 'vim'}

  "" Rust
  Plug 'rust-lang/rust.vim',      {'for': 'rust'}

  "" Lua
  Plug 'rhysd/reply.vim', {'for': ['lua', 'typescript']}

  Plug 'ziglang/zig.vim', {'for': 'zig'}

  if has('nvim')
    if s:use_ddc
      Plug 'prabirshrestha/vim-lsp'
      Plug 'mattn/vim-lsp-settings'
    endif
    " ---- NEOVIM ----
    "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Plug 'subnut/nvim-ghost.nvim', {'do': ':call nvim_ghost#installer#install()'}

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
    " Plug '~/src/github.com/liquidz/vim-iced-asyncomplete',  {'for': 'clojure'}


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
			Plug '~/src/github.com/liquidz/vim-iced-coc-source', {'on': [], 'for': 'clojure'}
		endif
    " Plug '~/src/github.com/liquidz/vim-diced-coc-source', {'for': 'clojure'}
  endif


  " }}}
endif

" /filetype }}}

call plug#end()

if s:has_plug('vim-anzu') " {{{
  if s:has_plug('vim-search-pulse')
    nmap n <Plug>(anzu-n)<Plug>Pulse
    nmap N <Plug>(anzu-N)<Plug>Pulse
    nmap * <Plug>(anzu-star)<Plug>Pulse
    nmap # <Plug>(anzu-sharp)<Plug>Pulse
  else
    nmap n <Plug>(anzu-mode-n)
    nmap N <Plug>(anzu-mode-N)
    nmap * <Plug>(anzu-star)
    nmap # <Plug>(anzu-sharp)
  endif
endif " }}}

if s:has_plug('auto-pairs') " {{{
  aug AutoPairFileType
    au Filetype clojure let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}
  aug END
endif " }}}

if s:has_plug('ayu-vim') " {{{
  " Important!!
  if has('termguicolors')
    set termguicolors
  endif

  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  "let ayucolor="dark"   " for dark version of theme
  let ayucolor="mirage" " for mirage version of theme

  colorscheme ayu
endif " }}}

if s:has_plug('vim-brightest') " {{{
  let g:brightest#highlight = {
        \ "group" : "BrightestUndercurl"
        \ }
endif " }}}

if s:has_plug('caw.vim') " {{{
  nmap <LocalLeader>g <Plug>(caw:prefix)
  xmap <LocalLeader>g <Plug>(caw:prefix)

  aug MyCawSetting
    au!
    au FileType clojure let b:caw_oneline_comment = ';;'
  aug END
endif " }}}

if s:has_plug('coc.nvim') " {{{
  function! s:coc_check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
  endfunction

  iunmap <expr><tab>
  inoremap <expr><tab>
        \ pumvisible() ? "\<c-n>" :
        \ <SID>coc_check_back_space() ? "\<Tab>" :
        \ coc#refresh()

  nmap <silent> <LocalLeader>cr  <Cmd>call CocAction('rename')<CR>
  nmap <silent> <LocalLeader>cf  <Cmd>call CocAction('jumpReferences')<CR>
  nmap <silent> <LocalLeader>cic <Cmd>call CocAction('showIncomingCalls')<CR>
  "nmap <silent> gd                    <Plug>(coc-definition)

  command! LspRenameSymbol :call CocActionAsync('rename')
  "command! LspRenameSymbol :call CocAction('rename')

  aug MyCocSetting
    au!
    au FileType typescript nnoremap <buffer> K :call CocActionAsync('doHover')<CR>
  aug END
endif " }}}

if s:has_plug('columnskip.vim') " {{{
  nmap cj <Plug>(columnskip-j)
  nmap ck <Plug>(columnskip-k)
endif " }}}

if s:has_plug('ctrlp.vim') " {{{
  let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
  let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
  let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く
  let g:ctrlp_show_hidden         = 1   " 隠しファイルも表示
  let g:ctrlp_match_window        = 'results:50'
  let g:ctrlp_follow_symlinks     = 1
  let g:ctrlp_root_markers        = ['.root', 'project.clj', 'deps.edn', 'Cargo.toml', 'pom.xml', 'README.md']
  let g:ctrlp_custom_ignore = {
        \   'dir' : '\v[\/](\.git|\.hg|\.svn|cookbooks|target|Vendor|.dein|cache|node_modules|\.cache|\.cpcache)$',
        \   'file': '\v\.(o|bk|org|exe|so|dll|skl|cgi|gitkeep|png|gif|jpg)$',
        \   'link': 'some_bad_symbolic_links',
        \ }
  let g:ctrlp_prompt_mappings = {
        \ 'PrtCurLeft()'   : ['<c-b>', '<left>'],
        \ 'PrtCurRight()'  : ['<c-f>', '<right>'],
        \ 'PrtClearCache()': ['<c-l>'],
        \ }

  nnoremap <LocalLeader>pb  :CtrlPBuffer<CR>
  nnoremap <LocalLeader>pq  :CtrlPBuffer<CR>
  nnoremap <LocalLeader>pcc :CtrlPClearCache<CR>

  let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
endif " }}}

if s:has_plug('ddc.vim') " {{{
  "let s:pum_loaded = !empty(globpath(&rtp, 'autoload/pum.vim'))
  let s:pum_loaded = s:has_plug('pum.vim')

  " Disable preview window
  set completeopt-=preview

  " Customize global settings
  " Use around source.
  " https://github.com/Shougo/ddc-around
  " call ddc#custom#patch_global('sources', [
  "      \ 'around',
  "      \ 'vim-lsp',
  "      \ 'iced',
  "      \ ])
  call ddc#custom#patch_global('sources', [ 'around' ])

  call ddc#custom#patch_global('backspaceCompletion', v:true)
  if s:pum_loaded
    call ddc#custom#patch_global('autoCompleteEvents', [
          \ 'InsertEnter', 'TextChangedI', 'TextChangedP',
          \ 'CmdlineEnter', 'CmdlineChanged',
          \ ])
    call ddc#custom#patch_global('completionMenu', 'pum.vim')
  endif

  " matsui54/ddc-matcher_fuzzy
  call ddc#custom#patch_global('sourceOptions', {
        \ '_': {'matchers': ['matcher_fuzzy']},
        \ })
  call ddc#custom#patch_global('filterParams', {
        \ 'matcher_fuzzy': {'camelcase': v:true},
        \ })

  " Change source options
  call ddc#custom#patch_global('sourceOptions', {
        \ 'around': {
        \     'mark': 'A',
        \     'matchers': ['matcher_head', 'matcher_length'],
        \ },
        \ 'vim-lsp': {
        \     'mark': 'lsp',
        \     'forceCompletionPattern': '\.',
        \ },
        \ 'iced': {
        \     'mark': 'iced',
        \ 'keywordPattern': '[a-zA-Z_]\w*',
        \     'forceCompletionPattern': '\w\/\w*',
        \ },
        \ 'cmdline-history': {'mark': 'history'},
        \ })

  call ddc#custom#patch_global('sourceParams', {
        \ 'around': {'maxSize': 500},
        \ })

  " Customize settings on a filetype
  call ddc#custom#patch_filetype(['txt'], 'sources', ['around'])
  " call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['around', 'clangd'])
  " call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {
  "      \ 'clangd': {'mark': 'C'},
  "      \ })
  " call ddc#custom#patch_filetype('markdown', 'sourceParams', {
  "      \ 'around': {'maxSize': 100},
  "      \ })
  call ddc#custom#patch_filetype('typescript', 'sources', ['vim-lsp', 'around'])
  call ddc#custom#patch_filetype('clojure', 'sources', ['iced', 'around'])
  call ddc#custom#patch_filetype('vim', 'sources', ['vim-lsp', 'around'])
  call ddc#custom#patch_filetype('sql', 'sources', ['vim-lsp', 'around'])

  " Mappings
  " <TAB>: completion.
  if s:pum_loaded
    inoremap <silent><expr> <TAB>
          \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
          \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
          \ '<TAB>' : ddc#manual_complete()
    inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
    inoremap <C-n>   <Cmd>call pum#map#select_relative(+1)<CR>
    inoremap <C-p>   <Cmd>call pum#map#select_relative(-1)<CR>
    inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
    inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

    function! CommandlinePre() abort
      " Note: It disables default command line completion!
      cnoremap <expr> <Tab>
            \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
            \ ddc#manual_complete()
      cnoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
      cnoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
      cnoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

      " Overwrite sources
      let s:prev_buffer_config = ddc#custom#get_buffer()
      call ddc#custom#patch_buffer('sources',
            \ ['cmdline-history', 'around'])
      autocmd MyAutoCmd CmdlineLeave * ++once call CommandlinePost()
      " Enable command line completion
      call ddc#enable_cmdline_completion()
      call ddc#enable()
    endfunction
    function! CommandlinePost() abort
      " Restore sources
      call ddc#custom#set_buffer(s:prev_buffer_config)
      cunmap <Tab>
    endfunction

    nnoremap : <Cmd>call CommandlinePre()<CR>:

  else
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
          \ "\<TAB>" : ddc#manual_complete()
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
  endif

  " Use ddc.
  call ddc#enable()
endif " }}}

if s:has_plug('vim-eft') " {{{
  nmap f <Plug>(eft-f-repeatable)
  xmap f <Plug>(eft-f-repeatable)
  omap f <Plug>(eft-f-repeatable)
  nmap F <Plug>(eft-F-repeatable)
  xmap F <Plug>(eft-F-repeatable)
  omap F <Plug>(eft-F-repeatable)

  nmap t <Plug>(eft-t-repeatable)
  xmap t <Plug>(eft-t-repeatable)
  omap t <Plug>(eft-t-repeatable)
  nmap T <Plug>(eft-T-repeatable)
  xmap T <Plug>(eft-T-repeatable)
  omap T <Plug>(eft-T-repeatable)
endif " }}}

if s:has_plug('fern.vim') " {{{
  " nnoremap <LocalLeader><LocalLeader> <Cmd>Fern %:h<CR>

  aug MyFernFileSetting
    au!
    " lambdalisue/fern-bookmark.vim
    au FileType fern nmap <buffer><nowait> b :<C-u>Fern bookmark:///<CR>
  aug END
endif " }}}

if s:has_plug('fzf.vim') " {{{
  function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
  endfunction

  command! FzfProjectFiles execute 'Files' s:find_git_root()

  nnoremap <C-p> :<C-u>FzfProjectFiles<CR>
  nnoremap <C-b> :<C-u>Buffers<CR>
endif " }}}

if s:has_plug('lightline.vim') " {{{
  if s:has_plug('ayu-vim')
    let s:colorscheme = 'ayu'
  endif

  if !has('gui_running')
    set t_Co=256
  endif

  function! MyCocStatus() abort
    return get(g:, 'coc_status', '')
  endfunction

  let g:lightline = {
        \ 'colorscheme': s:colorscheme,
        \ 'active': {
          \   'left': [['mode', 'readonly'],
          \            ['paste', 'modified']],
          \   'right': [['lineinfo'], ['fileformat', 'filetype'], ['anzu'], ['coc_status'], ['iced_multi_session'], ['iced']]
          \ },
          \ 'component_function': {
            \   'anzu': 'anzu#search_status',
            \   'iced': 'iced#repl#status',
            \   'iced_multi_session': 'iced_multi_session#current',
            \   'coc_status': 'MyCocStatus',
            \ },
            \ 'separator': { 'left': "\ue0b4", 'right': "\ue0b6"},
            \ 'subseparator': { 'left': "\ue0b5", 'right':  "\ue0b7" },
            \ 'tabline': { 'left': [[ 'tabs' ]], 'right': [[ 'bufnum' ]] }
            \ }
endif " }}}

if s:has_plug('vim-operator-replace') " {{{
  map <Leader>r <Plug>(operator-replace)
endif " }}}

if s:has_plug('vim-quickhl') " {{{
  nmap <LocalLeader>m <Plug>(quickhl-manual-this)
  xmap <LocalLeader>m <Plug>(quickhl-manual-this)
  nmap <LocalLeader>M <Plug>(quickhl-manual-reset)
  xmap <LocalLeader>M <Plug>(quickhl-manual-reset)

  let g:quickhl_manual_keywords = [
        \ 'TODO', 'FIXME',
        \ ]
endif " }}}

if s:has_plug('vim-quickrun') " {{{
  nmap <LocalLeader>r <Plug>(quickrun)

  " 結果を縦分割で表示
  let b:quickrun_config = {'_': {'split': 'vertical'}}
  " 横分割時は下､ 縦分割時は右へ新しいウィンドウを開く
  set splitbelow
  set splitright

  let g:quickrun_config = {
        \   '_': {
        \     'runner/vimproc/updatetime'      : 60,
        \     'hook/back_window/enable_exit'   : 1,
        \     'hook/back_window/priority_exit' : 100,
        \   },
        \   'go': {
        \     'command' : 'go',
        \     'exec'    : '%c run %s'
        \   },
        \   'matlab': {
        \     'command' : 'octave',
        \     'exec'    : '%c -q %s'
        \   },
        \   'make': {
        \     'command'   : 'make',
        \     'exec'      : '%c %o',
        \     'outputter' : 'error:buffer:quickfix'
        \   },
        \   'tla': {
        \     'command': 'tlc',
        \     'exec'   : '%c %s'
        \   },
        \   'julia': {
        \     'command': 'julia',
        \     'exec'   : '%c %s'
        \   },
        \   'yaml': {
        \     'command': 'actionlint',
        \     'exec'   : '%c %s'
        \   },
        \   'zig': {
        \     'command': 'zig',
        \     'exec'   : '%c test %s'
        \   },
        \   'liz': {
        \     'command': 'sh',
        \     'exec'   : '%c -c ''liz %s && zig version''',
        \   },
        \   'typescript': {
        \     'command': 'deno',
        \     'exec'   : '%c run --allow-all --unstable %s'
        \   },
        \   'typescript_test': {
        \     'command': 'deno',
        \     'exec'   : '%c --unstable test --allow-all %s'
        \   },
        \   'watchdogs_checker/phpcs': {
        \     'command' : 'phpcs',
        \     'exec'    : '%c --report=emacs %s'
        \   },
        \   'php/watchdogs_checker': {
        \     'type'
        \       : executable('phpcs') ? 'watchdogs_checker/phpcs'
        \       : executable('php') ? 'watchdogs_checker/php'
        \       : ''
        \   },
        \   'watchdogs_checker/rubocop' : {
        \     'command'     : 'rubocop',
        \     'exec'        : 'bundle exec %c %o %s:p',
        \     'errorformat' : '%f:%l:%c:%m',
        \   },
        \   'ruby/watchdogs_checker': {
        \     'type'
        \       : executable('rubocop') ? 'watchdogs_checker/rubocop'
        \       : executable('ruby') ? 'watchdogs_checker/ruby'
        \       : '',
        \   },
        \ }

  aug MyQuickrunSetting
    au!
    au FileType quickrun AnsiEsc
  aug END
endif " }}}

if s:has_plug('vim-sandwich') " {{{
  let g:textobj_sandwich_no_default_key_mappings = 1

  omap ii <Plug>(textobj-sandwich-auto-i)
  xmap ii <Plug>(textobj-sandwich-auto-i)
  omap aa <Plug>(textobj-sandwich-auto-a)
  xmap aa <Plug>(textobj-sandwich-auto-a)
endif " }}}

if s:has_plug('vim-search-pulse') " {{{
  let g:vim_search_pulse_mode = 'cursor_line'
  let g:vim_search_pulse_disable_auto_mappings = 1
endif " }}}

if s:has_plug('vim-sonictemplate') " {{{
  let g:sonictemplate_vim_template_dir = '$HOME/.vim/template'

  function! s:my_sonictemplate() abort
    let line = getline(line('.'))
    let input = trim(strpart(line, 0, col('.')))
    let pos = getcurpos()

    if empty(input)
      call fzf#sonictemplate#run()
    else
      call sonictemplate#postfix()
      " 何も展開されなかった
      if pos == getcurpos()
        call fzf#sonictemplate#run()
      endif
    endif
  endfunction

  nnoremap <silent> <C-l> <Cmd>call <SID>my_sonictemplate()<CR>
  inoremap <silent> <C-l> <Cmd>call <SID>my_sonictemplate()<CR>
endif " }}}

if s:has_plug('tig-explorer.vim') " {{{
  function! s:tig_grep() abort
    let reg_save = @@
    try
      normal! yiw
      let pattern = @@
      if empty(pattern)
        silent execute ':TigGrep'
      else
        call feedkeys(printf(':TigGrep %s', pattern), 'n')
      endif
    finally
      let @@ = reg_save
    endtry
  endfunction

  nnoremap <LocalLeader>gf :<C-u>TigOpenCurrentFile<CR>
  nnoremap <silent> <LocalLeader>gg :call <SID>tig_grep()<CR>
  nnoremap <LocalLeader>gs :<C-u>TigStatus<CR>
  nnoremap <LocalLeader>gb :<C-u>TigBlame<CR>
endif " }}}

if s:has_plug('vim-which-key') " {{{
  call which_key#register('<Space>', "g:which_key_map")
  nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
  nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

  set timeoutlen=500

  if !exists('g:which_key_map')
    let g:which_key_map = {}
  endif

  let g:which_key_map["'"] = 'Make connection to nREPL'
  let g:which_key_map['"'] = 'Start REPL and connect to it'

  let g:which_key_map['e'] = {
        \ 'name' : '+evaluating',
        \ 'i': 'Evaluate inner element',
        \ 'e': 'Evaluate outer list',
        \ 't': 'Evaluate outer top list',
        \ 'n': 'Evaluate ns form',
        \ 'u': 'Undefine symbol',
        \ 'U': 'Undefine all symbols in ns',
        \ }

  let g:which_key_map['t'] = {
        \ 'name' : '+testing',
        \ }


  let g:which_key_map['s'] = {
        \ 'name' : '+stdout buffer',
        \ }
  let g:which_key_map['r'] = {
        \ 'name' : '+refactoring',
        \ }

  let g:which_key_map['h'] = {
        \ 'name' : '+help/document',
        \ }

  let g:which_key_map['b'] = {
        \ 'name' : '+browsing',
        \ }

  let g:which_key_map['j'] = {
        \ 'name' : '+jumping',
        \ }
endif " }}}

if s:has_plug('vim-lsp') " {{{
  " For debugging
  let g:lsp_log_verbose = 1
  let g:lsp_log_file = expand('~/vim-lsp.log')

  let g:lsp_signs_enabled = 1
  let g:lsp_fold_enabled = 0
  let g:lsp_diagnostics_float_cursor = 1

  let g:lsp_document_code_action_signs_enabled = v:false
  " let g:lsp_diagnostics_float_delay = 200
  " let g:lsp_diagnostics_signs_delay = 200

  " c.f. https://www.nerdfonts.com/cheat-sheet
  let g:lsp_diagnostics_signs_error = {'text': "\ufb8f"}
  let g:lsp_diagnostics_signs_warning = {'text': "\uf27a"}
  let g:lsp_diagnostics_signs_hint = {'text': "\uf27a"}
  "let g:lsp_document_code_action_signs_hint = {'text': "\uf0eb"}
  let g:lsp_document_code_action_signs_hint = {'text': "\uf089"}

  " TODO clojure-lsp の diagnostic は止めたい
  let g:lsp_settings = {
        \ 'clojure-lsp': {
        \   'disabled': v:false,
        \ },
        \ 'json-languageserver': {'disabled': v:true},
        \ 'efm-langserver': { 'disabled': v:false, 'allowlist': ['vim', 'yaml'] },
        \ 'deno': {'disabled': v:false},
        \ 'typescript-language-server': {'disabled': v:true},
        \ 'rome': {'disabled': v:true},
        \ 'eslint-language-server': {'disabled': v:true},
        \ 'sql-language-server': {'disabled': v:true},
        \ 'sqls': {'disabled': v:false, 'allowlist': ['sql']},
        \ 'vim-language-server': {'disabled': v:false},
        \}

  nmap <LocalLeader>ca <plug>(lsp-code-action)
  nmap <LocalLeader>cl <plug>(lsp-code-lens)

  aug VimLspSetting
    au FileType vim nmap <C-]> :<C-u>LspDefinition<CR>
    au FileType sql nmap K <plug>(lsp-hover)
  aug END
endif " }}}

if s:has_plug('parinfer-rust') " {{{
  let g:parinfer_mode = 'smart'
  let g:parinfer_force_balance = v:true

  function! s:parinfer_toggle() abort
    if g:parinfer_mode ==# 'smart'
      let g:parinfer_mode = 'paren'
    else
      let g:parinfer_mode = 'smart'
    endif
    echo printf('Parinfer is "%s" mode now', g:parinfer_mode)
  endfunction

  command! ParinferToggle call <SID>parinfer_toggle()
  nnoremap <Leader>pt :<C-u>ParinferToggle<CR>
endif " }}}

if s:has_plug('previm') " {{{
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
endif " }}}

if s:has_plug('vim-easy-align') " {{{
  vmap <Enter> <Plug>(EasyAlign)
  let g:easy_align_delimiters = {
        \ '>': { 'pattern': '->\|=>' }
        \ }
endif " }}}

if s:has_plug('vim-easymotion') " {{{
  map e <Plug>(easymotion-prefix)
  let g:EasyMotion_keys='hklyuiopnm,qwertzxcvbasdgjf'
endif " }}}

if s:has_plug('vim-sexp') " {{{
  let g:sexp_filetypes = 'clojure,lisp'
  "let g:sexp_enable_insert_mode_mappings = 1
  let g:sexp_mappings = {
        \ 'sexp_indent': '',
        \ 'sexp_indent_top': '',
        \ }
endif " }}}

if s:has_plug('vim-submode') " {{{
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
endif " }}}

if s:has_plug('rainbow') " {{{
  let g:rainbow_active = 1
  let g:rainbow_conf = {
        \ 'ctermfgs': ['darkmagenta', 'red', 'darkcyan', 'brown', 'darkgreen', 'darkred'],
        \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
        \ 'separately': {'*': 0, 'clojure': {}}
        \ }
endif " }}}

if s:has_plug('vlime') " {{{
  let g:vlime_window_settings = {
        \ 'repl':      { 'pos': 'botright',   'size': 60, 'vertical': v:true},
        \ 'sldb':      { 'pos': 'belowright', 'size': 20},
        \ 'inspector': { 'pos': 'belowright', 'size': 10}
        \ }

  let g:vlime_compiler_policy = { 'DEBUG': 3 }
endif " }}}

if s:has_plug('translate.vim') " {{{
  let g:translate_source = 'en'
  let g:translate_target = 'ja'

  xmap <LocalLeader>en <Plug>(VTranslate)
  xmap <LocalLeader>ja <Plug>(VTranslateBang)
endif " }}}

if s:has_plug('yankround.vim') " {{{
  nmap p <Plug>(yankround-p)
  xmap p <Plug>(yankround-p)
  nmap P <Plug>(yankround-P)
  nmap gp <Plug>(yankround-gp)
  xmap gp <Plug>(yankround-gp)
  nmap gP <Plug>(yankround-gP)
  nmap <Tab> <Plug>(yankround-prev)
  nmap <S-Tab> <Plug>(yankround-next)
  let g:yankround_use_region_hl = 1
endif " }}}

if s:has_plug('vim-searchx') " {{{
  " Overwrite / and ?.
  nnoremap ? <Cmd>call searchx#start({ 'dir': 0 })<CR>
  nnoremap / <Cmd>call searchx#start({ 'dir': 1 })<CR>
  xnoremap ? <Cmd>call searchx#start({ 'dir': 0 })<CR>
  xnoremap / <Cmd>call searchx#start({ 'dir': 1 })<CR>
  nnoremap ; <Cmd>call searchx#select()<CR>

  " Move to next/prev match.
  nnoremap N <Cmd>call searchx#prev_dir()<CR>
  nnoremap n <Cmd>call searchx#next_dir()<CR>
  xnoremap N <Cmd>call searchx#prev_dir()<CR>
  xnoremap n <Cmd>call searchx#next_dir()<CR>
  nnoremap <Up> <Cmd>call searchx#prev()<CR>
  nnoremap <Down> <Cmd>call searchx#next()<CR>
  xnoremap <Up> <Cmd>call searchx#prev()<CR>
  xnoremap <Down> <Cmd>call searchx#next()<CR>
  cnoremap <Up> <Cmd>call searchx#prev()<CR>
  cnoremap <Down> <Cmd>call searchx#next()<CR>

  " Clear highlights
  " nnoremap <Esc><Esc> <Cmd>call searchx#clear()<CR>

  let g:searchx = {}

  " Auto jump if the recent input matches to any marker.
  let g:searchx.auto_accept = v:true

  " The scrolloff value for moving to next/prev.
  let g:searchx.scrolloff = &scrolloff

  " To enable scrolling animation.
  let g:searchx.scrolltime = 500

  " Marker characters.
  let g:searchx.markers = split('ABCDEFHIJKLMNOPQRSTUVWXYZ', '.\zs')

  " Convert search pattern.
  function g:searchx.convert(input) abort
    if a:input !~# '\k'
      return '\V' .. a:input
    endif
    return join(split(a:input, ' '), '.\{-}')
  endfunction
endif " }}}

" if s:has_plug('fixme') " {{{
" endif " }}}

" タイマーによる遅延読み込み {{{
function! s:load_plug(timer_id) abort
  let l:load_plug_names = []
  for l:plug_name in keys(g:plugs)
    let l:on = get(g:plugs[l:plug_name], 'on')
    if type(l:on) == v:t_list && l:on == []
      call add(l:load_plug_names, l:plug_name)
    endif
  endfor

  " 対象が20以上あると Too many arguments になってしまうので分割してロードする
  let l:tmp = copy(l:load_plug_names)
  while !empty(l:tmp)
    call call('plug#load', l:tmp[:19])
    let l:tmp = l:tmp[20:]
  endwhile

  "call call('plug#load', l:load_plug_names)
endfunction

call timer_start(200, funcref('s:load_plug'))
" }}}

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
