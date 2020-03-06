syntax keyword merrErrorSymbol +err+
syntax keyword merrErr merr/err

highlight cMerrKeyword term=reverse cterm=underline ctermfg=213 guifg=#e27878

highlight link merrErrorSymbol cMerrKeyword
highlight link merrErr cMerrKeyword
