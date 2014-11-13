" vim: foldmethod=marker
" vim: foldlevel=0

" basic {{{1
set modeline
set modelines=3
set nocompatible

" color scheme {{{2
syntax enable
colorscheme desert

" search {{{2
set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

nnoremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
nnoremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'
vnoremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
vnoremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'
function! s:search_forward_p()
    return exists('v:searchforward') ? v:searchforward : 1
endfunction

" paste {{{2
set pastetoggle=<C-e>

" visual {{{2
set showtabline=2
set tabstop=4
set expandtab
set autoindent
set backspace=indent,eol,start
set showmatch
set wildmenu
set formatoptions+=mM
set nonumber
set ruler
set list
set listchars=tab:>-,trail:_,eol:\ ,extends:>,precedes:>
set wrap
set cmdheight=2
set showcmd
set smartindent
set smarttab
set shiftwidth=4
set noequalalways
set cursorline
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" fold {{{2
set foldmethod=marker
set foldlevel=2

" buffer {{{2
set hidden
set autoread

" system {{{2
let mapleader=","
let maplocalleader="\\"

" encoding {{{1
if &encoding !=# 'utf-8'
    set encoding=japan
    set fileencoding=japan
endif
if has('iconv')
    let s:enc_euc = 'euc-jp'
    let s:enc_jis = 'iso-2022-jp'
    if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'eucjp-ms'
        let s:enc_jis = 'iso-2022-jp-3'
    elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'euc-jisx0213'
        let s:enc_jis = 'iso-2022-jp-3'
    endif
    if &encoding ==# 'utf-8'
        let s:fileencodings_default = &fileencodings
        let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
        let &fileencodings = &fileencodings .','. s:fileencodings_default
        unlet s:fileencodings_default
    else
        let &fileencodings = &fileencodings .','. s:enc_jis
        set fileencodings+=utf-8,ucs-2le,ucs-2
        if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
            set fileencodings+=cp932
            set fileencodings-=euc-jp
            set fileencodings-=euc-jisx0213
            set fileencodings-=eucjp-ms
            let &encoding = s:enc_euc
            let &fileencoding = s:enc_euc
        else
            let &fileencodings = &fileencodings .','. s:enc_euc
        endif
    endif
    unlet s:enc_euc
    unlet s:enc_jis
endif
if has('autocmd')
    function! AU_ReCheck_FENC()
        if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
            let &fileencoding=&encoding
        endif
    endfunction
    autocmd BufReadPost * call AU_ReCheck_FENC()
endif

" mapping {{{1
nnoremap <C-j> <Esc>
cnoremap <C-j> <Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

nnoremap ; :
nnoremap : ;
nnoremap > %
nnoremap < %

cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Delete>

imap () ()<Left>
imap [] []<Left>
imap {} {}<Left>
imap "" ""<Left>
imap '' ''<Left>
imap `` ``<Left>

nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <silent> <C-j><C-j> :nohlsearch<CR><Esc>

nnoremap <Leader><Leader> :<C-u>Ex<CR>

" go home
nnoremap <silent> <Leader>gh :cd! $HOME<CR>

" copy to clipboard
if has("win32")
    vnoremap <C-c> "*y
endif
" paste from clipboard
nnoremap <C-y> i<C-r><C-o>+<Esc>l
cnoremap <C-y> <C-r><C-o>+
inoremap <C-y> <C-r><C-o>+

" tab {{{2
nnoremap tn :<C-u>tabnew<CR>
nnoremap th :<C-u>tabp<CR>
nnoremap tl :<C-u>tabn<CR>
nnoremap t0 :<C-u>tabfirst<CR>
nnoremap t$ :<C-u>tablast<CR>

"nnoremap [Tab] <Nop>
"nmap t [Tab]
"nnoremap [Tab]n :<C-u>tabnew<CR>
"nnoremap [Tab]h :<C-u>tabp<CR>
"nnoremap [Tab]l :<C-u>tabn<CR>
"nnoremap [Tab]0 :<C-u>tabfirst<CR>
"nnoremap [Tab]$ :<C-u>tablast<CR>
"nnoremap << :<C-u>tabp<CR>
"nnoremap >> :<C-u>tabn<CR>

" command {{{1
command! ToUTF8 set fileencoding=utf-8
command! ToEUC  set fileencoding=euc-jp
command! ToSJIS set fileencoding=sjis

command! ToUNIX set fileformat=unix

" auto command {{{1
aug MyAutoCompletion
    au!
	" XML, HTML補完
    autocmd FileType eruby,html,xml,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType xml,html inoremap <buffer> </ </<C-x><C-o>
aug END

aug MyAutoCd
    au!
    autocmd BufEnter * silent! lcd %:p:h
aug END

aug MyAutoOpenCWindow
    au!
    autocmd QuickFixCmdPost *grep* cwindow
aug END

" status line {{{1
set statusline=[%n]\        " バッファ番号
set statusline+=%f\         " 相対ファイル名
set statusline+=%m\         " バッファ状態[+]
set statusline+=%r          " 読み取り専用フラグ
set statusline+=%<%=        " 右寄せ
set statusline+=%{'['.(&fenc!=''?&fenc:'?').'-'.&ff.']'}\   " フォーマット＆文字コード
set statusline+=%y\         " タイプ
set statusline+=%4l,%2c\    " 行、列
set statusline+=%3p%%\      " 何％
set laststatus=2

" omni completion {{{1
function InsertTabWrapper(type)
    let col = col('.') - 1
    "omni補完の場合、omini以外にも上下左右の移動もする
    if a:type=='omni'
        if pumvisible()
            return "\<c-n>"
        endif
        if !col || getline('.')[col - 1] !~ '\k\|<\|/'
            return "\<tab>"
        elseif exists('&omnifunc') && &omnifunc == ''
            return "\<c-n>"
        else
            return "\<c-x>\<c-o>"
        endif
        "keywordの場合、該当のとき以外は何もしない
    else
        if pumvisible() || !col || getline('.')[col - 1] !~ '\k\|<\|/'
            return ""
        else
            return "\<c-x>\<c-p>"
        endif
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper('omni')<cr><c-r>=InsertTabWrapper('keyword')<cr>

" load conf.d {{{1
set runtimepath+=$HOME/.vim/
runtime! conf.d/*.vim
