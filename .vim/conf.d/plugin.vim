" vim: foldmethod=marker
" vim: foldlevel=0

" basic {{{1
if has('vim_starting')
    set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand($HOME . '/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" plugins {{{1

NeoBundle 'Shougo/unite.vim'
NeoBundleLazy 'Shougo/vimfiler', {'autoload': {'commands': ['VimFiler']}}
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'kana/vim-submode'
NeoBundle 'tpope/vim-surround'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'kien/ctrlp.vim'
"NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'kien/rainbow_parentheses.vim'

NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-classpath'

"NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'

" Neosnippet
if has("lua")
    NeoBundle 'Shougo/neocomplete'
else
    NeoBundle 'Shougo/neocomplcache'
endif
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

if has("unix")
    NeoBundle 'tpope/vim-fireplace'
    NeoBundle 'tpope/vim-classpath'
    NeoBundle 'typedclojure/vim-typedclojure'
endif

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" VimFiler {{{2
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_sort_type = "filename"
let g:vimfiler_enable_auto_cd = 1

nnoremap <Leader><leader> :VimFiler<CR>

aug VimFilerKeyMapping
    au!
    autocmd FileType vimfiler call s:vimfiler_local()

    function! s:vimfiler_local()
        " キーマップのカスタマイズ
        nmap <buffer> <C-r> <Plug>(vimfiler_rename_file)
        nmap <buffer> a <Plug>(vimfiler_toggle_mark_all_lines)
        nmap <buffer> m <Plug>(vimfiler_set_current_mask)
        nmap <buffer> M <Plug>(vimfiler_move_file)
        nmap <buffer> D <Plug>(vimfiler_make_directory)
        nmap <buffer> h <Plug>(vimfiler_smart_h)
        nmap <buffer> F <Plug>(vimfiler_new_file)
        " sendto呼び出し
        nnoremap <buffer> <Leader>s :Unite sendto<CR>

        " 関連付け
        if has('unix')
            call vimfiler#set_execute_file('sh', 'sh')
            call vimfiler#set_execute_file('html,htm,pdf,jpg,gif,png,svg,lzh,mp3,mpg,wmv,rm,flv', 'xdg-open')
        endif

        " Unite bookmark連携
        nnoremap <buffer> z <C-u>:Unite bookmark<CR>
        nnoremap <buffer> A <C-u>:UniteBookmarkAdd<CR>
        " Unite bookmarkのアクションをVimFilerに
        call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
    endfunction
aug END

" unite.vim {{{2
nnoremap <Leader>b :Unite file buffer tab<CR>

" submode {{{2
let g:submode_timeout = 0
" window {{{3
call submode#enter_with('window', 'n', '', '<C-w><C-w>', '<Nop>')
call submode#leave_with('window', 'n', '', '<Esc>')
call submode#map('window', 'n', '', 'j', '<C-w>j')
call submode#map('window', 'n', '', 'J', '<C-w>J')
call submode#map('window', 'n', '', 'k', '<C-w>k')
call submode#map('window', 'n', '', 'K', '<C-w>K')
call submode#map('window', 'n', '', 'l', '<C-w>l')
call submode#map('window', 'n', '', 'L', '<C-w>L')
call submode#map('window', 'n', '', 'h', '<C-w>h')
call submode#map('window', 'n', '', 'H', '<C-w>h')
call submode#map('window', 'n', '', 's', '<C-w>s')
call submode#map('window', 'n', '', 'v', '<C-w>v')
call submode#map('window', 'n', '', 'x', ':q<CR>')
call submode#map('window', 'n', '', '>', '<C-w>5>')
call submode#map('window', 'n', '', '<', '<C-w>5<lt>')
call submode#map('window', 'n', '', '+', '<C-w>5+')
call submode#map('window', 'n', '', '-', '<C-w>5-')

" hybrid {{{2
colorscheme hybrid

" clever_f {{{2
let g:clever_f_across_no_line = 1
let g:clever_f_ignore_case = 1

" qfixhowm {{{2
let howm_dir = $HOME . '/.vim/howm'
let QFixMRU_Filename = $HOME . '/.vim/qfixmru'
let howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.md'
let QFixHowm_FileType = 'markdown'
let QFixHowm_Title = '#'
" タイトル行検索正規表現の辞書を初期化
let QFixMRU_Title = {}
" MRUでタイトル行とみなす正規表現(Vimの正規表現で指定)
let QFixMRU_Title['mkd'] = '^###[^#]'
" grepでタイトル行とみなす正規表現(使用するgrepによっては変更する必要があります)
let QFixMRU_Title['mkd_regxp'] = '^###[^#]'
let QFixMRU_Key = 'g'

" ctrlp{{{2
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く

" quickrun {{{2
" 結果を縦分割で表示
let b:quickrun_config = {'_': {'split': 'vertical'}}
" 横分割時は下､ 縦分割時は右へ新しいウィンドウを開く
set splitbelow
set splitright

let g:quickrun_config = {}
let g:quickrun_config.go = {
    \ 'command' : 'go',
    \ 'exec'    :  '%c run %s'
    \ }

" yankround {{{2
"nmap p <Plug>(yankround-p)
nnoremap <Leader>yr :Unite yankround<CR>

" vim-clojure-static {{{2
aug MyLispWords
    au!
    " compojure
	au FileType clojure set lispwords+=defroutes,GET,POST
    " misaki
	au FileType clojure set lispwords+=defvalidate,validate,testing,defhtml,bind-config,defcompilertest
    " midje
	au FileType clojure set lispwords+=facts,fact
    " conjure
	au FileType clojure set lispwords+=stubbing
aug END

" rainbow_parentheses {{{2
aug MyRainbowParentheses
    au!
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
aug END

" previm {{{2
let g:previm_open_cmd = '' " set empty to use open-browser.vim

aug PrevimSettings
    au!
    au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
aug END

" gist-vim {{{2
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_get_multiplefile = 1

" neosnippet {{{2
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory = $HOME . '/.vim/snippets'
