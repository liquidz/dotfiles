if empty(globpath(&rtp, 'plugin/columnskip.vim'))
  finish
endif

nmap cj <Plug>(columnskip-j)
nmap ck <Plug>(columnskip-k)
