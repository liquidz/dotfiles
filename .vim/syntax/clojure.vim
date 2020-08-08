" merr によるエラー処理の位置を把握しやすくするため
syntax keyword merrErrorSymbol +err+
syntax keyword merrErr merr/err
syntax keyword myTap tap>
highlight cMerrKeyword term=reverse cterm=underline ctermfg=213 guifg=#e27878
highlight link merrErrorSymbol cMerrKeyword
highlight link merrErr cMerrKeyword
highlight link myTap cMerrKeyword

" empty? と間違えて empty と書いても気付けるように
syntax keyword cljEmpty empty
syntax keyword myComment comment
highlight cMyWarning term=reverse cterm=reverse ctermfg=160
highlight link cljEmpty cMyWarning
highlight link myComment cMyWarning

syntax match cljDefTest 't/deftest.*$' contains=clojureMeta,clojureKeyword
highlight default link cljDefTest CursorLineNr
