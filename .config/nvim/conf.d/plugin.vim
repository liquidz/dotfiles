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

let g:deoplete#enable_at_startup = 1

aug MyNeoMake
  au!
  au BufWritePost * Neomake
aug END
