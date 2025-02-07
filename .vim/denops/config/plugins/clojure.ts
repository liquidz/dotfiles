import type { Plugin } from "../type.ts";

export const clojurePlugins: Plugin[] = [
  {
    url: "guns/vim-sexp",
    profiles: ["default"],
    cache: {
      before: `
        let g:clojure_syntax_keywords = {
             \\ 'clojureDefine': ['s/defn', 's/fn', 's/defschema', 's/defmethod', 's/defprotocol', 's/defrecord'],
             \\ 'clojureSpecial': ['merr/let'],
             \\ }

        function! s:sexp_init() abort
          " nnoremap <buffer> HH :lprevious<CR>
          " nnoremap <buffer> LL :lnext<CR>

          imap <silent><buffer> <C-h> <Plug>(sexp_insert_backspace)
          inoremap <buffer> >> ->
          inoremap <buffer> tpp tap>
          inoremap ** **<Left>

          "" vim-sexp
          nmap <silent><buffer> <LocalLeader>kk <Plug>(sexp_swap_list_backward)
          xmap <silent><buffer> <LocalLeader>kk <Plug>(sexp_swap_list_backward)
          nmap <silent><buffer> <LocalLeader>kj <Plug>(sexp_swap_list_forward)
          xmap <silent><buffer> <LocalLeader>kj <Plug>(sexp_swap_list_forward)
          nmap <silent><buffer> <LocalLeader>kh <Plug>(sexp_swap_element_backward)
          xmap <silent><buffer> <LocalLeader>kh <Plug>(sexp_swap_element_backward)
          nmap <silent><buffer> <LocalLeader>kl <Plug>(sexp_swap_element_forward)
          xmap <silent><buffer> <LocalLeader>kl <Plug>(sexp_swap_element_forward)
          nmap <silent><buffer> <Leader>l <Plug>(sexp_insert_at_list_tail)<CR>
          nmap <silent><buffer> <Leader>o <Plug>(sexp_insert_at_list_tail)<Right><CR>
        endfunction

        aug my_sexp_mapping
          au!
          au FileType clojure call s:sexp_init()
        aug END
      `,
      after: `
        let g:sexp_filetypes = 'clojure,lisp'
        let g:sexp_enable_insert_mode_mappings=0
        let g:sexp_mappings = {
             \\ 'sexp_indent': '',
             \\ 'sexp_indent_top': '',
             \\ }
      `,
    },
  },

  {
    url: "eraserhd/parinfer-rust",
    profiles: ["default"],
    // build = 'sh -c "cargo build --target=aarch64-apple-darwin --release && rm -rf target/release && mv target/aarch64-apple-darwin/release target/release"'
    cache: {
      after: `
        let g:parinfer_mode = 'smart'
        "let g:parinfer_force_balance = v:true
        "let g:parinfer_logfile = '/tmp/parinfer.log'

        function! s:parinfer_toggle() abort
          if g:parinfer_mode ==# 'smart'
            let g:parinfer_mode = 'paren'
          else
            let g:parinfer_mode = 'smart'
          endif
          echo printf('Parinfer is "%s" mode now', g:parinfer_mode)
        endfunction

        command! ParinferToggle call <SID>parinfer_toggle()
        nnoremap <Leader>pt :<C-u>ParinferToggle<CR>
      `,
    },
  },

  {
    url: "liquidz/elin",
    dst: "~/src/github.com/liquidz/elin",
    profiles: ["default"],
    dependencies: ["liquidz/elin-coc-source", "liquidz/elin-format"],
    cache: {
      before: `
        let g:elin_enable_default_key_mappings = v:true

        command! -nargs=1 ElinNreplDebug call elin#notify('elin.handler.debug/nrepl-request', [<q-args>])<CR>
        function! MyPortalOpen() abort
          call elin#notify(
                \\ 'elin.handler.evaluate/evaluate',
                \\ ["(do ((requiring-resolve 'portal.api/open)) (add-tap (requiring-resolve 'portal.api/submit)))"],
                \\ )
        endfunction

        function! MyPortalClear() abort
          call elin#notify(
                \\ 'elin.handler.evaluate/evaluate',
                \\ ['(portal.api/clear)'],
                \\ )
        endfunction

        command! ElinPortalOpen :call MyPortalOpen()
        command! ElinPortalClear :call MyPortalClear()
      `,
    },
  },
  {
    url: "liquidz/elin-coc-source",
    dst: "~/src/github.com/liquidz/elin-coc-source",
    profiles: ["default"],
  },
  {
    url: "liquidz/elin-format",
    dst: "~/src/github.com/liquidz/elin-format",
    profiles: ["default"],
  },
];
