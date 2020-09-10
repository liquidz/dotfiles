scriptencoding utf-8

syntax keyword myGlobalVar g:
syntax keyword mySelfVar self
highlight cMyVimKeyword term=reverse cterm=underline ctermfg=213 guifg=#e27878
highlight link myGlobalVar cMyVimKeyword
highlight link mySelfVar cMyVimKeyword

syntax match themisTestSuite 'function! s:suite.*$'
highlight default link themisTestSuite Todo



