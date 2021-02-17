if empty(globpath(&rtp, 'plugin/auto-pairs.vim'))
  finish
endif

aug AutoPairFileType
  au Filetype clojure let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}
aug END
