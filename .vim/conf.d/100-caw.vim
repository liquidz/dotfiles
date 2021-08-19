if empty(globpath(&rtp, 'autoload/caw.vim'))
  finish
endif

nmap <LocalLeader>g <Plug>(caw:prefix)
xmap <LocalLeader>g <Plug>(caw:prefix)

aug MyCawSetting
  au!
  au FileType clojure let b:caw_oneline_comment = ';;'
aug END
