" Helper functions

" toggles the quickfix window.
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
  else
"	execute "copen " . g:jah_Quickfix_Win_Height
    execute "copen "
  endif
endfunction

" used to track the quickfix window
augroup QFixToggle
 autocmd!
 autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
 autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

function ToggleTestJava()
  let s:cur_file = expand("%:p")
  if s:cur_file =~ 'javatests/'
    return substitute(substitute(expand("%:p"), "javatests/", "java/", ""), "Test\.java$", ".java", "")
  elseif s:cur_file =~ 'java/'
    return substitute(substitute(expand("%:p"), "java/", "javatests/", ""), "\.java$", "Test.java", "")
  endif
endfunction

