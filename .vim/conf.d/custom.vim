set directory=$HOME/.vim/backup

" auto saving
aug MyAutoSaving
    au!
    autocmd CursorHold * update
aug END
set updatetime=300000 "5min

" external grep
if executable('pt')
    set grepprg=pt\ --nogroup\ -iS
    set grepformat=%f:%l:%m
endif

"function! s:set_default_macro() abort
"  " 先頭のコメント以降を削除
"  let @c = "0f,D"
"  " aaa,bbb を ('aaa', 'bbb', 0); に変換
"  let @s = "I('f,i'llli'A', 0);"
"  " xmind のテキストを asciidoc/confluence のリスト形式に変換
"  let @x = "V::s/\t/*/g0wi "
"  echo "finished"
"endfunction
"command! SetDefaultMacro call <SID>set_default_macro()
