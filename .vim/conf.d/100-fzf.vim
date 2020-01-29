if empty(globpath(&rtp, 'autoload/fzf/vim.vim'))
  finish
endif

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! FzfProjectFiles execute 'Files' s:find_git_root()

nnoremap <C-p> :<C-u>FzfProjectFiles<CR>
