scriptencoding utf-8

" 位置を把握しやすくするためのハイライト
syntax keyword merrErrorSymbol +err+
syntax keyword merrErr merr/err
syntax keyword merrTry merr/try
highlight cMerrKeyword term=reverse cterm=underline ctermfg=213 guifg=#e27878
highlight link merrErrorSymbol cMerrKeyword
highlight link merrErr cMerrKeyword
highlight link merrTry cMerrKeyword

" 間違いや消し忘れを防ぐためのハイライト
" empty? と間違えて empty と書いても気付けるように
syntax keyword cljEmpty empty
syntax keyword myComment comment
syntax keyword myGo go
syntax keyword myAsyncGo async/go
syntax keyword myTap tap>
"highlight cMyWarning term=reverse cterm=reverse ctermfg=160
highlight cMyWarning term=reverse guifg=#000000 guibg=#e27878
highlight link cljEmpty cMyWarning
highlight link myComment cMyWarning
highlight link myGo cMyWarning
highlight link myAsyncGo cMyWarning
highlight link myTap cMyWarning

" テストがとこから始まるのかわかりやすくするためのハイライト
syntax match cljDefTest '\(t/\)\?deftest.*$' contains=clojureMeta,clojureKeyword
highlight default link cljDefTest Todo
