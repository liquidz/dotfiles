let g:submode_timeout = 0
try
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

  " c.f. vim-iced jumping signs
  call submode#enter_with('sign_jump', 'n', '', '<LocalLeader>n', ':<C-u>IcedJumpToNextSign<CR>')
  call submode#enter_with('sign_jump', 'n', '', '<LocalLeader>N', ':<C-u>IcedJumpToPrevSign<CR>')
  call submode#leave_with('sign_jump', 'n', '', '<Esc>')
  call submode#map('sign_jump', 'n', '', 'n', ':<C-u>IcedJumpToNextSign<CR>')
  call submode#map('sign_jump', 'n', '', 'N', ':<C-u>IcedJumpToPrevSign<CR>')

  " " c.f. ftplugin/clojure.vim
  " call submode#enter_with('slurp', 'n', '', '<LocalLeader><', ':<C-u>DPSlurpSexp<CR>')
  " call submode#enter_with('slurp', 'n', '', '<LocalLeader>>', ':<C-u>DPBarfSexp<CR>')
  " call submode#leave_with('slurp', 'n', '', '<Esc>')
  " call submode#map('slurp', 'n', '', 's', ':<C-u>DPSlurpSexp<CR>')
  " call submode#map('slurp', 'n', '', 'b', ':<C-u>DPBarfSexp<CR>')

  call submode#enter_with('slurp', 'n', '', '<LocalLeader>ks', ':<C-u>IcedSlurp<CR>')
  call submode#enter_with('slurp', 'n', '', '<LocalLeader>kb', ':<C-u>IcedBarf<CR>')
  call submode#leave_with('slurp', 'n', '', '<Esc>')
  call submode#map('slurp', 'n', '', 's', ':<C-u>IcedSlurp<CR>')
  call submode#map('slurp', 'n', '', 'b', ':<C-u>IcedBarf<CR>')
catch
  echo 'submode is not installed'
endtry
