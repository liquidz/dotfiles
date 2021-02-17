if empty(globpath(&rtp, 'autoload/operator/replace.vim'))
  finish
endif

map <Space>r <Plug>(operator-replace)
