if empty(globpath(&rtp, 'autoload/ddc.vim'))
  finish
endif

" Customize global settings
" Use around source.
" https://github.com/Shougo/ddc-around
call ddc#custom#patch_global('sources', [
      \ 'around',
      \ 'iced',
      \ 'nextword',
      \ ])


call ddc#custom#patch_global('sourceOptions', {
      \ '_': {'matchers': ['matcher_fuzzy']},
      \ })

call ddc#custom#patch_global('filterParams', {
      \ 'matcher_fuzzy': {'camelcase': v:true},
      \ })

" call ddc#custom#patch_global('sourceOptions', {
"      \ '_': {'matchers': ['matcher_editdistance'], 'sorters': []},
"      \ })
"
" call ddc#custom#patch_global('filterParams', {
"      \ 'matcher_editdistance': {'showScore': v:true, 'diffLen': 0, 'limit': 2},
"      \ })

" Use matcher_head and sorter_rank.
" https://github.com/Shougo/ddc-matcher_head
" https://github.com/Shougo/ddc-sorter_rank
" call ddc#custom#patch_global('sourceOptions', {
"      \ '_': {
"      \   'matchers': ['matcher_head'],
"      \   'sorters': ['sorter_rank']},
"      \ })

" Change source options
call ddc#custom#patch_global('sourceOptions', {
      \ 'around': {'mark': 'A'},
      \ })
call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ })

call ddc#custom#patch_global('sourceOptions', {
    \ 'nextword': {
    \   'mark': 'nextword',
    \   'minAutoCompleteLength': 3,
    \   'isVolatile': v:true,
    \ }})

" Customize settings on a filetype
call ddc#custom#patch_filetype(['txt'], 'sources', ['around', 'nextword'])
call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['around', 'clangd'])
call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {
      \ 'clangd': {'mark': 'C'},
      \ })
call ddc#custom#patch_filetype('markdown', 'sourceParams', {
      \ 'around': {'maxSize': 100},
      \ })
"call ddc#custom#patch_filetype('typescript', 'sources', ['ddc-vim-lsp'])
call ddc#custom#patch_filetype('clojure', 'sources', ['iced', 'around'])

" Mappings

" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ "\<TAB>" : ddc#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

" Use ddc.
call ddc#enable()
