" Helper functions

" Find the buffer whose name (partially) matches the input and switch focus to
" it, or open it here.
" TODO(pieps): Find out how to make buffer numbers work here too.
" TODO(pieps): Ignore case on buffer.
function s:FindWindowFun(expr)
    let n = bufwinnr(bufname(a:expr))
  if bufname(a:expr) && buflisted(a:expr)
    if n > 0
      exe n . "wincmd w"
    else
      exe "buffer " . a:expr
    endif
  else
    exe "edit " . a:expr
  endif
endfunction
command -nargs=1 -complete=custom,ListBuffersAndFiles FindWindow call s:FindWindowFun("<args>")

function s:MatchBuffers(A, bufs)
  let matches = []
  for buf in a:bufs
    " TODO(pieps): Match camelcase here too
    if stridx(buf, a:A) > -1
      call add(matches, buf)
    endif
  endfor
  return matches
endfunction

function s:EnumerateBuffers()
  let n = bufnr("$")
  let output = []
  for i in range(1,n)
    if bufexists(i) && buflisted(i)
      call add(output, bufname(i))
    endif
  endfor
  return output
endfunction

fun ListBuffersAndFiles(A,L,P)
  let files = s:MatchBuffers(a:A, split(system("ls -a"), "\n"))
  let buffers = s:MatchBuffers(a:A, s:EnumerateBuffers())
  return join(buffers + files, "\n")
endfun

" A command to search in the tags file for project filenames. Faster than :e
command -complete=custom,FindInProjectFun -nargs=1 FindInProject e <args>
function FindInProjectFun(A,L,P)
	return system("cut tags -f2 | sort | uniq | tr \"[:upper:]\" \"[:lower:]\"")
endfunction

" Rebuild special tags that allow the above to work
command RebuildProjTags !ctags --c++-kinds=+p --fields=+iaS --extra=+fq --languages=C++ -R

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

command -nargs=0 ToggleProj call ToggleProjFun()
function ToggleProjFun()
	if !exists("s:isShowing")
		let s:isShowing = 0
	endif
	if s:isShowing == 0
		":Proj
                :NERDTree
		let s:isShowing = 1
	else
		":1 wincmd w
		":q
                :NERDTreeClose
		let s:isShowing = 0
	endif
endfunction

function Fullscreen()
	set columns=314
	set lines=85
endfunction

com Fullscreen call Fullscreen()

function DeWhitespace()
  %s/^\s\+$//g
endfunction

com DeWhitespace call DeWhitespace()

" For quick searching for ids in files
map _u :call ID_search()<Bar>execute "/\\<" . g:word . "\\>"<CR>
map _n :n<Bar>execute "/\\<" . g:word . "\\>"<CR>

function! ID_search()
  let g:word = expand("<cword>")
  let x = system("lid --key=none ". g:word)
  let x = substitute(x, "\n", " ", "g")
  execute "next " . x
endfun

" Suggested by genutils
command! -nargs=0 -range=% SortByLength <line1>,<line2>call QSort(
      \ 'CmpByLineLengthNname', 1) 
command! -nargs=0 -range=% RSortByLength <line1>,<line2>call QSort( 
      \ 'CmpByLineLengthNname', -1) 
command! -nargs=0 -range=% SortJavaImports <line1>,<line2>call QSort( 
      \ 'CmpJavaImports', 1) 
command! -nargs=1 -bang -complete=customlist,genutils#UserFileComplete2 
      \ FindInPath :find<bang> <args> 
command! -nargs=* -complete=command Redir 
      \ :new | put! =GetVimCmdOutput('<args>') | setl bufhidden=wipe | 
      \ setl nomodified 

" Make diffing nicer (from http://www.corp.google.com/~laurence/vim/)
func DiffSetup()
  set nofoldenable foldcolumn=0 number
  wincmd b
  set nofoldenable foldcolumn=0 number
  let &columns = &columns * 2
  wincmd =
  winpos 0 0
endfun
