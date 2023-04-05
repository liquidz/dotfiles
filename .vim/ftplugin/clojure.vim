scriptencoding utf-8

" cf. https://github.com/vim/vim/blob/adce965162dd89bf29ee0e5baf53652e7515762c/runtime/syntax/clojure.vim#L54
let g:clojure_syntax_keywords = {
      \ 'clojureDefine': ['s/defn', 's/fn', 's/defschema', 's/defmethod', 's/defprotocol', 's/defrecord'],
      \ 'clojureSpecial': ['merr/let'],
      \ }

if exists('g:loaded_clojure_ftplugin')
  finish
endif
let g:loaded_clojure_ftplugin = 1

if !exists('g:use_vim_diced')
  let g:use_vim_diced = v:false
endif


if g:use_vim_diced
  aug myDicedSetting
    au!
    au FileType clojure nmap <silent> <buffer> <Leader>' <Plug>(diced_connect)
    au FileType clojure nmap <silent> <buffer> <Leader>ee <Plug>(diced_eval_outer_list)
    au FileType clojure nmap <silent> <buffer> <Leader>et <Plug>(diced_eval_outer_top_list)
    au FileType clojure nmap <silent> <buffer> <Leader>eb <Plug>(diced_eval_buffer)
    au FileType clojure nmap <silent> <buffer> <Leader>em <Plug>(diced_eval_at_mark)
    au FileType clojure nmap <silent> <buffer> <Leader>tt <Plug>(diced_test_under_cursor)
    au FileType clojure nmap <silent> <buffer> <Leader>ss <Plug>(diced_open_info_buffer)
    au FileType clojure nmap <silent> <buffer> <Leader>hs <Plug>(diced_show_source)
    au FileType clojure nmap <silent> <buffer> K <Plug>(diced_show_document)
    au FileType clojure nmap <silent> <buffer> <C-]> <Plug>(diced_jump_to_definition)
    au FileType clojure nmap <silent> <buffer> g<C-]> :<C-u>DicedJumpToDefinition ++cmd=tabedit<CR>
    au FileType clojure nmap <silent> <buffer> v<C-]> :<C-u>DicedJumpToDefinition ++cmd=vsplit<CR>
  aug END
endif

"let g:iced#debug = v:true
"let g:iced#debug#debugger = 'stdout'


let g:iced_formatter = 'cljstyle'
"let g:iced_formatter = 'joker'
"let g:iced_formatter = 'zprint'
let g:iced_enable_clj_kondo_analysis = v:true
let g:iced_enable_clj_kondo_local_analysis = v:true
let g:iced_enable_enhanced_definition_extraction = v:false
let g:iced_enable_auto_document = 'insert'
"let g:iced_enable_auto_document = 'never'

"let g:iced_enable_enhanced_cljs_completion = v:false
"let g:iced_formatter = 'joker'
"let g:iced_formatter = 'zprint'

let g:clojure_fuzzy_indent_patterns = [
    \ '^with', '^def', '^let', '^\w\+-let'
    \ ]

"let g:iced_default_key_mapping_leader = '<LocalLeader>'

let g:iced#buffer#stdout#max_line = 512
let g:iced#buffer#stdout#mods = 'vertical'
"let g:iced#buffer#document#mods = 'vertical'
let g:iced#clojuredocs#use_clj_docs_on_cljs = v:true
let g:iced#grep#prg = 'git grep -I --line-number --no-color'
let g:iced#nrepl#auto#does_switch_session = v:true
let g:iced#nrepl#complete#ignore_context = v:true
let g:iced#nrepl#skip_evaluation_when_buffer_size_is_exceeded = v:true
let g:iced_enable_auto_indent = v:false
"let g:iced_enable_default_key_mappings = v:true
let g:iced_enable_default_key_mappings = (! g:use_vim_diced)
"let g:iced#message#enable_notify = v:true
let g:iced#navigate#prefer_local_jump = v:true
let g:iced#nrepl#auto#document_delay = 200

" hi link IcedEvalPopupColor Title
" " highlight IcedEvalPopupColor ctermfg=5 guifg=#FF7BA9
let g:iced#eval#popup_highlight = 'IcedEvalPopupColor'

"let g:iced#eval#popup_align = 'right'
"let g:iced#eval#keep_inline_result = v:true

"set clipboard=unnamed

let g:iced#navigate#jump_fallback_command = ':call CocAction("jumpDefinition")'

let g:iced_multi_session#does_switch_session = v:true

let g:iced#nrepl#eval#ignoring_vars_in_stacktrace = [
      \ 'clojure.core/apply',
      \ 'clojure.core/eval',
      \ 'clojure.core/with-bindings*',
      \ 'clojure.lang.AFn/applyTo',
      \ 'clojure.lang.AFn/applyToHelper',
      \ 'clojure.lang.AFn/run',
      \ 'clojure.lang.Compiler/eval',
      \ 'clojure.lang.RestFn/invoke',
      \ 'clojure.lang.Var/applyTo',
      \ 'clojure.main/repl',
      \ 'java.lang.Thread/run',
      \ 'nrepl.middleware.interruptible-eval/evaluate',
      \ 'nrepl.middleware.interruptible-eval/interruptible-eval',
      \ 'nrepl.middleware.session/session-exec',
      \ ]

let g:iced#selector#search_order = ['ddu', 'telescope', 'fzf']
"let g:iced#selector#search_order = ['telescope', 'fzf']

"let g:iced#refactor#insert_newline_after_require = v:false



let g:iced#ddu#selector#ddu_options = {
      \ 'uiParams': {'ff': {'startFilter': v:true}},
      \ }


function! MyCocExecuteCommand(command, extra_args) abort
  let file = expand('%:p')
  let uri = (file ==# '' ? '' : printf('file://%s', file))
  let arguments = extend([uri, line('.') - 1, col('.') - 1], a:extra_args)
  return CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': a:command, 'arguments': arguments})
endfunction

nnoremap <silent> <Leader>cltf :call MyCocExecuteCommand('thread-first-all', [])<CR>
nnoremap <silent> <Leader>cltl :call MyCocExecuteCommand('thread-last-all', [])<CR>
nnoremap <silent> <Leader>clcc :call MyCocExecuteCommand('cycle-coll', [])<CR>
nnoremap <silent> <Leader>clcp :call MyCocExecuteCommand('cycle-privacy', [])<CR>
nnoremap <silent> <Leader>clsm :call MyCocExecuteCommand('sort-map', [])<CR>
nnoremap <silent> <Leader>clml :call MyCocExecuteCommand('move-to-let', [input('name: ')])<CR>
nnoremap <silent> <Leader>clil :call MyCocExecuteCommand('introduce-let', [input('name: ')])<CR>
nnoremap <silent> <Leader>clis :call MyCocExecuteCommand('inline-symbol', [])<CR>
nnoremap <silent> <Leader>clef :call MyCocExecuteCommand('extract-function', [input('name: ')])<CR>
nnoremap <silent> <Leader>cldf :call MyCocExecuteCommand('demote-fn', [])<CR>

let g:iced#palette = {
      \ 'LspDemoteFn': ":call MyCocExecuteCommand('demote-fn', [])",
      \ 'LspPromoteFn': ":call MyCocExecuteCommand('promote-fn', [])",
      \ 'LspCreateFunction': ":call MyCocExecuteCommand('create-function', [])",
      \ 'LspCyclePrivacy': ":call MyCocExecuteCommand('cycle-privacy', [])",
      \ 'LspSortMap': ":call MyCocExecuteCommand('sort-map', [])",
      \ 'LspIntroduceLet': ":call MyCocExecuteCommand('introduce-let', [])",
      \ 'LspBrowseReferences': ":call CocActionAsync('jumpReferences')",
      \ }
" let g:iced#palette = {
"      \ 'LspRenameSymbol': ":call CocActionAsync('rename')",
"      \ 'LspBrowseReferences': ":call CocActionAsync('jumpReferences')",
"      \ }

aug MyCoCSetting
  au!
  au CursorHold * silent call CocActionAsync('highlight')
  au BufEnter list://* highlight CursorLine ctermbg=242 guibg=#343F4C
aug END



" let g:iced_cache_directory = '/tmp'

" nf-fa-bomb
let g:iced_sign = {'error': "\uf1e2", 'trace': 'T', 'lint': 'L'}

" let g:iced#format#rule = {
"     \ 'core-let': '[[:block 1]]',
"     \ 'merr.core/let': '[[:block 2] [:inner 1]]',
"     \ 'clojure.spec.alpha/fdef': '[[:block 1]]',
"     \ 're-frame.core/reg-event-db': '[[:block 1]]',
"     \ 're-frame.core/reg-event-fx': '[[:block 1]]',
"     \ 're-frame.core/reg-sub': '[[:block 1]]',
"     \ }

" tonsky
let g:iced#format#rule = {'#"^\w"': '[[:inner 0]]'}
let g:iced#format#options = {
    \ 'remove-consecutive-blank-lines?': v:false,
    \ 'remove-multiple-non-indenting-spaces?': v:true,
    \ }

" let g:iced#hook = {
"      \ 'session_switched': {'type': 'shell',
"      \                   'exec': {v -> printf('tmux display-message "Session: switch to %s"', v.session)}},
"      \ }

" function! s:fixme(param) abort
"   if iced#buffer#nr(bufname('%')) == bufnr('%')
"     return
"   endif
"
"   let code = trim(get(a:param, 'code', ''))
"   let code =  substitute(code, '\s*\r\?\n\s*', ' ', 'g')
"
"   let option = get(a:param, 'option', {})
"   if empty(code)
"     return
"   endif
"
"   if get(option, 'verbose', v:true)
"     call iced#buffer#stdout#append(printf(';; Eval: %s', code))
"   endif
" endfunction
"
" call iced#hook#add('eval_prepared', {
"      \ 'type': 'function',
"      \ 'exec': funcref('s:fixme'),
"      \ })
" call iced#hook#add('evaluated', {
"     \ 'type': 'function',
"     \ 'exec': {d -> iced#buffer#stdout#append(d['result']['value'])},
"     \ })

" call iced#hook#add('connected', {
"      \ 'type': 'function',
"      \ 'exec': {_ -> lsp#disable_diagnostics_for_buffer(bufnr('iced_stdout'))},
"      \ })

let s:counter = 0
function! s:test_finished(v) abort
  " let s:counter += 1
  " if s:counter > 10
  "   let s:counter = 0
  " endif
  "
  " let success_color = ['AACF53', '7BA23F']
  " let failure_color = ['E95464', 'D0104C']
  "
  " let idx = s:counter % 2
  " let color = (a:v.result ==# 'succeeded' ? success_color[idx] : failure_color[idx])
  "
  " return ['curl', '-XPOST', printf('localhost:8890/%s', color)]

  " let label = (a:v.result ==# 'succeeded' ? 'Succeeded' : 'Failed')
  " let text = printf("Test Finished\nResult: %s\n%s", label, a:v.summary)
  " return ['osascript', '-e', printf('display notification "%s"', text)]

  if a:v.result ==# 'succeeded'
    return ['curl', '-d', 'succeeded', printf('ntfy.sh/%s', $NTFY_TOPIC)]
  else
    return ['curl', '-H', 'Priority: high', '-d', 'failed', printf('ntfy.sh/%s', $NTFY_TOPIC)]
  endif
endfunction


" if ! has('nvim')
"   let g:iced#hook['connected'] = {'type': 'function', 'exec': {_ -> notification#show('✅ Connected')}}
" endif
" "let g:iced#hook['test_finished'] = {'type': 'function', 'exec': {v -> notification#show(printf('%s %s', (v.result ==# 'succeeded' ? '😊' : '😱'), v.result))}}
" let g:iced#hook['test_finished'] = {'type': 'shell', 'exec': funcref('s:test_finished')}
" " let g:iced#hook['form_change_prepared'] = {'type': 'command', 'exec': 'ParinferOff'}
" " let g:iced#hook['form_changed'] = {'type': 'command', 'exec': 'ParinferOn'}

function! s:auto_connect() abort
  if expand('%:t') ==# 'project.clj' || expand('%:e') ==# 'edn'
    return
  endif
  call timer_start(250, {-> execute(':IcedConnect')})
endfunction

function! s:auto_format_current_form() abort
  if ! iced#repl#is_connected() | return | endif
  let x = iced#format#current()
  if iced#promise#is_promise(x)
    return iced#promise#wait(x)
  endif
endfunction

" overwrite mapping
nmap <Leader>em <Plug>(iced_eval_at_mark)
nmap <Leader>ecm <Plug>(iced_eval_in_context_at_mark)
nmap <Leader>eM <Plug>(iced_macroexpand_1_outer_list)
nmap <Nop>(disable_expand_all) <Plug>(iced_macroexpand_outer_list)

function! MyClojureDefJump() abort
  if iced#repl#is_connected()
    exe "normal \<Plug>(iced_def_jump)"
  else
    exe "normal \<Plug>(coc-definition)"
  endif
endfunction

nmap <silent> <C-]> :call MyClojureDefJump()<CR>
nmap <Nop>(disable_def_jump) <Plug>(iced_def_jump)

if has('nvim')
  aug MyNeovimClojureSetting
    au!
    au FileType clojure nmap <silent> <C-]> :call MyClojureDefJump()<CR>
  aug END
endif


function! MyClojureShowDocument() abort
  if iced#repl#is_connected()
    exe "normal \<Plug>(iced_document_popup_open)"
  else
    call CocAction('doHover')
  endif
endfunction

nmap <Leader>hn <Plug>(iced_ns_popup_show_form)
nmap <Nop>(disable_next_use_case) <Plug>(iced_next_use_case)

nnoremap <silent> <Plug>(iced_eval_and_time) <Cmd>call iced#operation#setup_wrapper('(clojure.core/time *v)')<CR>g@
aug Fixme
  au!
  au FileType clojure nmap <buffer> <Leader>eat <Plug>(iced_eval_and_time)<Plug>(sexp_outer_list)``
aug END

aug MyClojureSetting
  au!
  "au VimEnter * call s:auto_connect()

  au FileType clojure nnoremap <buffer> HH :lprevious<CR>
  au FileType clojure nnoremap <buffer> LL :lnext<CR>

  au FileType clojure imap <silent><buffer> <C-h> <Plug>(sexp_insert_backspace)
  au FileType clojure inoremap <buffer> >> ->
  "au FileType clojure inoremap <buffer> ## #_

  au FileType clojure nmap <buffer> tt <Plug>(iced_cycle_src_and_test)
  "au FileType clojure nmap <buffer> <C-l><C-l><C-l> <Plug>(iced_clean_all)
  au FileType clojure nnoremap <buffer> <Leader>go :<C-u>IcedEval (user/go)<CR>
  au FileType clojure nnoremap <buffer> <Leader>stop :<C-u>IcedEval (user/stop)<CR>
  au FileType clojure nnoremap <buffer> <Leader>Go :<C-u>IcedEval (user/reset)<CR>

  au FileType clojure nmap <buffer> <Leader><Esc> <Cmd>IcedClearInlineResult<CR>


  "au FileType clojure setl completeopt=menu
  " au FileType clojure setl updatetime=1000
  " "au CursorHoldI *.clj,*.cljs,*.cljc call iced#nrepl#document#current_form()

  au FileType qf nnoremap <buffer> q :<C-u>q<CR>


  "au FileType clojure nmap <buffer> <Leader>et <Plug>(iced_eval)<Plug>(sexp_outer_top_list)``

  "au FileType clojure nmap <buffer> <localleader>ee    m`<Plug>(iced_eval):<c-u>call SelectOuterTopList()<cr>g``

  au FileType clojure nmap <buffer> <Leader>eae <Plug>(iced_eval_and_tap)<Plug>(sexp_outer_list)``
  "au FileType clojure nmap <buffer> <Leader>eat <Plug>(iced_eval_and_tap)<Plug>(sexp_outer_top_list)``

  au FileType clojure nmap <buffer> <Leader>ere <Plug>(iced_eval_and_replace)<Plug>(sexp_outer_list)``
  au FileType clojure nmap <buffer> <Leader>ert <Plug>(iced_eval_and_replace)<Plug>(sexp_outer_top_list)``

  " au FileType clojure nmap <buffer> <Leader>ece <Plug>(iced_eval_and_comment)<Plug>(sexp_outer_list)``
  " au FileType clojure nmap <buffer> <Leader>ect <Plug>(iced_eval_and_comment)<Plug>(sexp_outer_top_list)``

  au FileType clojure nmap <buffer> <Leader>epe <Plug>(iced_eval_and_print)<Plug>(sexp_outer_list)``

  " au FileType clojure nmap <silent> <buffer> <C-w><C-]> :<C-u>IcedDefJump . tabedit<CR>
  au FileType clojure nmap <silent> <buffer> g<C-]> <Cmd>IcedDefJump . tabedit<CR>
  au FileType clojure nmap <silent> <buffer> v<C-]> <Cmd>IcedDefJump . vsplit<CR>
  au FileType clojure nmap <silent> <buffer> r<C-]> <Cmd>IcedBrowseReferences<CR>

  " mapping for yanking (like `"xee"`)
  " au FileType clojure nmap <silent> ee <Plug>(iced_eval)<Plug>(sexp_outer_list)``
  " au FileType clojure nmap <silent> et <Plug>(iced_eval)<Plug>(sexp_outer_top_list)``

  "" vim-sexp
  au FileType clojure nmap <silent><buffer> <LocalLeader>kk <Plug>(sexp_swap_list_backward)
  au FileType clojure xmap <silent><buffer> <LocalLeader>kk <Plug>(sexp_swap_list_backward)
  au FileType clojure nmap <silent><buffer> <LocalLeader>kj <Plug>(sexp_swap_list_forward)
  au FileType clojure xmap <silent><buffer> <LocalLeader>kj <Plug>(sexp_swap_list_forward)
  au FileType clojure nmap <silent><buffer> <LocalLeader>kh <Plug>(sexp_swap_element_backward)
  au FileType clojure xmap <silent><buffer> <LocalLeader>kh <Plug>(sexp_swap_element_backward)
  au FileType clojure nmap <silent><buffer> <LocalLeader>kl <Plug>(sexp_swap_element_forward)
  au FileType clojure xmap <silent><buffer> <LocalLeader>kl <Plug>(sexp_swap_element_forward)

  " au FileType clojure nmap <silent><buffer> <LocalLeader>ks <Plug>(sexp_capture_next_element)
  " au FileType clojure nmap <silent><buffer> <LocalLeader>kb <Plug>(sexp_emit_tail_element)

  " "" NOTE: &<< and &>> are binded to <Alt-.> and <Alt-,> by Alaritty
  " au FileType clojure nmap <silent><buffer> &<< <Plug>(dps_paredit_slurp)
  " au FileType clojure nmap <silent><buffer> &>> <Plug>(dps_paredit_barf)
  " au FileType clojure imap <silent><buffer> &<< <Esc><Plug>(dps_paredit_slurp)
  " au FileType clojure imap <silent><buffer> &>> <Esc><Plug>(dps_paredit_barf)
  " au FileType clojure nmap <silent><buffer> &space <Plug>(dps_paredit_sexp_range)
  " au FileType clojure vmap <silent><buffer> &space <Plug>(dps_paredit_sexp_range_expansion)

  " au FileType clojure nmap <silent><buffer> x <Plug>(dps_paredit_delete)
  " au FileType clojure imap <silent><buffer> <BS> <Esc><Plug>(dps_paredit_delete_backward)
  " au FileType clojure nmap <silent><buffer> D <Plug>(dps_paredit_kill_line)
  " au FileType clojure nmap <silent><buffer> dd V<Plug>(dps_paredit_kill_range)
  " au FileType clojure vmap <silent><buffer> x <Plug>(dps_paredit_kill_range)
  " au FileType clojure vmap <silent><buffer> d <Plug>(dps_paredit_kill_range)

  au FileType clojure vmap <silent><buffer> <LocalLeader>ke <Plug>(dps_paredit_sexp_range_expansion)

  " au FileType clojure nmap <silent><buffer> &<< :<C-u>IcedSlurp<CR>
  " au FileType clojure nmap <silent><buffer> &>> :<C-u>IcedBarf<CR>
  " au FileType clojure imap <silent><buffer> &<< :<C-u>IcedSlurp<CR>
  " au FileType clojure imap <silent><buffer> &>> :<C-u>IcedBarf<CR>

  "au FileType clojure xmap <silent><buffer> <LocalLeader>O <Plug>(sexp_insert_at_list_head)
  au FileType clojure nmap <silent><buffer> <Leader>l <Plug>(sexp_insert_at_list_tail)<CR>
  au FileType clojure nmap <silent><buffer> <Leader>o <Plug>(sexp_insert_at_list_tail)<Right><CR>

  "" vim-iced-kaocha
  au FileType clojure nmap <silent><buffer> <Leader>ktt <Plug>(iced_kaocha_test_under_cursor)
  au FileType clojure nmap <silent><buffer> <Leader>ktn <Plug>(iced_kaocha_test_ns)
  au FileType clojure nmap <silent><buffer> <Leader>ktr <Plug>(iced_kaocha_test_redo)
  au FileType clojure nmap <silent><buffer> <Leader>ktl <Plug>(iced_kaocha_test_rerun_last)

  " " vim-iced-multi-session
  " au FileType clojure nmap <silent><buffer> <Leader>_ <Plug>(iced_connect)
  " au FileType clojure nmap <silent><buffer> <Leader>' <Plug>(iced_multi_session_connect)

  "" cljstyle auto fix
  "au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSyncAll'

  if !g:use_vim_diced
    au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSync'
  endif

  "au FileType clojure setl formatprg=cljstyle\ pipe

  " jiangmiao/auto-pairs
  au Filetype clojure let b:AutoPairs = {
        \ '"':'"',
        \ '```':'```',
        \ }
aug END
