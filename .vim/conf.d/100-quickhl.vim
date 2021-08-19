if empty(globpath(&rtp, 'autoload/quickhl.vim'))
  finish
endif

nmap <LocalLeader>m <Plug>(quickhl-manual-this)
xmap <LocalLeader>m <Plug>(quickhl-manual-this)
nmap <LocalLeader>M <Plug>(quickhl-manual-reset)
xmap <LocalLeader>M <Plug>(quickhl-manual-reset)

let g:quickhl_manual_keywords = [
      \ 'TODO', 'FIXME',
      \ ]

