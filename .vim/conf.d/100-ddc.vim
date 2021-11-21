if empty(globpath(&rtp, 'autoload/ddc.vim'))
  finish
endif
let s:pum_loaded = !empty(globpath(&rtp, 'autoload/pum.vim'))
let s:pum_loaded = v:false

" Disable preview window
set completeopt-=preview

" Customize global settings
" Use around source.
" https://github.com/Shougo/ddc-around
call ddc#custom#patch_global('sources', [
      \ 'around',
      \ 'vim-lsp',
      \ 'iced',
      \ 'nextword',
      \ ])

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
      \ 'around': {'mark': 'A'},
      \ 'nextword': {
      \     'mark': 'nextword',
      \     'minAutoCompleteLength': 3,
      \     'isVolatile': v:true,
      \ },
      \ 'vim-lsp': {
      \     'mark': 'lsp',
      \     'forceCompletionPattern': '\.',
      \ },
      \ 'iced': {'mark': 'iced'},
      \ 'cmdline-history': {'mark': 'history'},
      \ })

call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ })

" Customize settings on a filetype
call ddc#custom#patch_filetype(['txt'], 'sources', ['around', 'nextword'])
" call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['around', 'clangd'])
" call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {
"      \ 'clangd': {'mark': 'C'},
"      \ })
" call ddc#custom#patch_filetype('markdown', 'sourceParams', {
"      \ 'around': {'maxSize': 100},
"      \ })
call ddc#custom#patch_filetype('typescript', 'sources', ['vim-lsp', 'nextword', 'around'])
call ddc#custom#patch_filetype('clojure', 'sources', ['iced',  'nextword', 'around'])
call ddc#custom#patch_filetype('vim', 'sources', ['vim-lsp',  'nextword', 'around'])
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
