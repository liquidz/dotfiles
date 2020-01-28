if empty(globpath(&rtp, 'autoload/anzu.vim'))
  finish
endif

if empty(globpath(&rtp, 'autoload/search_pulse.vim'))
  nmap n <Plug>(anzu-mode-n)
  nmap N <Plug>(anzu-mode-N)
  nmap * <Plug>(anzu-star)
  nmap # <Plug>(anzu-sharp)
else
  nmap n <Plug>(anzu-n)<Plug>Pulse
  nmap N <Plug>(anzu-N)<Plug>Pulse
  nmap * <Plug>(anzu-star)<Plug>Pulse
  nmap # <Plug>(anzu-sharp)<Plug>Pulse
endif
