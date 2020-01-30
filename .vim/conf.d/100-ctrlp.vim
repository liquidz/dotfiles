scriptencoding utf-8
if empty(globpath(&rtp, 'autoload/ctrlp.vim'))
  finish
endif

let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く
let g:ctrlp_show_hidden         = 1   " 隠しファイルも表示
let g:ctrlp_match_window        = 'results:50'
let g:ctrlp_follow_symlinks     = 1
let g:ctrlp_root_markers        = ['.root', 'project.clj', 'deps.edn', 'Cargo.toml', 'pom.xml', 'README.md']
let g:ctrlp_custom_ignore = {
  \   'dir' : '\v[\/](\.git|\.hg|\.svn|cookbooks|target|Vendor|.dein|cache|node_modules|\.cache|\.cpcache)$',
  \   'file': '\v\.(o|bk|org|exe|so|dll|skl|cgi|gitkeep|png|gif|jpg)$',
  \   'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_prompt_mappings = {
  \ 'PrtCurLeft()'   : ['<c-b>', '<left>'],
  \ 'PrtCurRight()'  : ['<c-f>', '<right>'],
  \ 'PrtClearCache()': ['<c-l>'],
  \ }

nnoremap <LocalLeader>pb  :CtrlPBuffer<CR>
nnoremap <LocalLeader>pq  :CtrlPBuffer<CR>
nnoremap <LocalLeader>pcc :CtrlPClearCache<CR>

if exists('*cpsm#CtrlPMatch')
  let g:cpsm_query_inverting_delimiter = ' '
  let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
endif
