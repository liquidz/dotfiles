" vim: foldmethod=marker
" vim: foldlevel=0

" basic {{{1
if has('vim_starting')
    set runtimepath+=$HOME/dotfiles/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand($HOME . '/dotfiles/.vim/bundle/'))
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
        " �L�[�}�b�v�̃J�X�^�}�C�Y
        nmap <buffer> <C-r> <Plug>(vimfiler_rename_file)
        nmap <buffer> a <Plug>(vimfiler_toggle_mark_all_lines)
        nmap <buffer> m <Plug>(vimfiler_set_current_mask)
        nmap <buffer> M <Plug>(vimfiler_move_file)
        nmap <buffer> D <Plug>(vimfiler_make_directory)
        nmap <buffer> h <Plug>(vimfiler_smart_h)zz
        nmap <buffer> F <Plug>(vimfiler_new_file)
        " sendto�Ăяo��
        nnoremap <buffer> <Leader>s :Unite sendto<CR>

        " �֘A�t��
        if has('unix')
            call vimfiler#set_execute_file('sh', 'sh')
            call vimfiler#set_execute_file('html,htm,pdf,jpg,gif,png,svg,lzh,mp3,mpg,wmv,rm,flv', 'xdg-open')
        endif

        " Unite bookmark�A�g
        nnoremap <buffer> z <C-u>:Unite bookmark<CR>
        nnoremap <buffer> A <C-u>:UniteBookmarkAdd<CR>
        " Unite bookmark�̃A�N�V������VimFiler��
        call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
    endfunction
aug END

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
let howm_dir = $HOME . '/dotfiles/.vim/howm'
let QFixMRU_Filename = $HOME . '/dotfiles/.vim/qfixmru'
let howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.md'
let QFixHowm_FileType = 'markdown'
let QFixHowm_Title = '#'
" �^�C�g���s�������K�\���̎�����������
let QFixMRU_Title = {}
" MRU�Ń^�C�g���s�Ƃ݂Ȃ����K�\��(Vim�̐��K�\���Ŏw��)
let QFixMRU_Title['mkd'] = '^###[^#]'
" grep�Ń^�C�g���s�Ƃ݂Ȃ����K�\��(�g�p����grep�ɂ���Ă͕ύX����K�v������܂�)
let QFixMRU_Title['mkd_regxp'] = '^###[^#]'
let QFixMRU_Key = 'g'

" ctrlp{{{2
let g:ctrlp_clear_cache_on_exit = 0   " �I�����L���b�V�����N���A���Ȃ�
let g:ctrlp_mruf_max            = 500 " MRU�̍ő�L�^��
let g:ctrlp_open_new_file       = 1   " �V�K�t�@�C���쐬���Ƀ^�u�ŊJ��

" quickrun {{{2
let b:quickrun_config = {'outputter/buffer/split': 10}

" yankround {{{2
"nmap p <Plug>(yankround-p)
nnoremap <Leader>yr :Unite yankround<CR>

