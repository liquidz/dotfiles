if ! executable('node')
  let g:coc_node_path = '/usr/local/bin/node'
endif

let g:coc_global_extensions = [
     \ 'coc-copilot',
     \ 'coc-deno',
     \ 'coc-diagnostic',
     \ 'coc-eslint',
     \ 'coc-lines',
     \ 'coc-prettier',
     \ 'coc-tsdetect',
     \ 'coc-tsserver',
     \ ]
" coc-tsserver と一緒に入っていると ts プロジェクトにて
" tsserver を無効にする .vim/coc-settings.json がプロジェクトルートに作成さ
" れてしまうので一旦 uninstall

function! s:coc_check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

iunmap <expr><tab>
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ exists('b:_copilot.suggestions') ? copilot#Accept("\<CR>") :
  \ <SID>coc_check_back_space() ? "\<Tab>" :
  \ coc#refresh()
inoremap <silent><expr> <c-l> coc#refresh()

inoremap <expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

nmap <silent> <Leader>cc  <Plug>(coc-codeaction-cursor)
nmap <silent> <Leader>cb  <Plug>(coc-codeaction)
nmap <silent> <Leader>cl  <Plug>(coc-codeaction-line)
nmap <silent> <Leader>cs  <Plug>(coc-codeaction-source)
nmap <silent> <Leader>cr  <Plug>(coc-codeaction-refactor)

nmap <silent> <Leader>cR  <Cmd>call CocAction('rename')<CR>
nmap <silent> <Leader>cd  <Cmd>call CocAction('jumpDefinition')<CR>
nmap <silent> <Leader>cf  <Cmd>call CocAction('jumpReferences')<CR>
nmap <silent> <Leader>cic <Cmd>call CocAction('showIncomingCalls')<CR>

command! LspRenameSymbol :call CocActionAsync('rename')
command! LspBrowseReferences :call CocActionAsync('jumpReferences')
command! LspCodeActionCursor :call CocActionAsync('codeAction', 'cursor')

"command! LspRenameSymbol :call CocAction('rename')

aug MyCocSetting
  au!
  au FileType typescript,typescriptreact,css nnoremap <buffer> K :call CocActionAsync('doHover')<CR>
aug END

highlight MyCocInlayHint ctermfg=5 guifg=#3b474f
hi link CocInlayHint MyCocInlayHint
