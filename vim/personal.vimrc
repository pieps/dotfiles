" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Added by nick for sane tabbing:
"set noexpandtab tabstop=4 shiftwidth=4
" Be Googley
set expandtab tabstop=2 shiftwidth=2

" Added by Nick to get rid of annoying swap files (I can't say I've benefitted
" from them ever!)
set noswapfile

" Added by nick for better ctags mapping
"map <C-]> g<C-]>
"map <C-Y> <C-]>

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

" Added by nick for some Slick-like keys
set wak=no
" map <M-e> :e **/
map <M-e> :FindInProject **
" Switching these to not wrap for better l-r control
" noremap <M-h> <C-w>W
noremap <M-h> <C-w>h
noremap <M-j> <C-w>j
noremap <M-k> <C-w>k
" noremap <M-l> <C-w>w
noremap <M-l> <C-w>l

noremap <M-S-h> <C-w>H
noremap <M-S-j> <C-w>J
noremap <M-S-k> <C-w>K
noremap <M-S-l> <C-w>L

noremap <C-S-l> <C-w>h<C-w>\|
noremap <C-S-k> <C-w>j<C-w>_
noremap <C-S-j> <C-w>k<C-w>_
noremap <C-S-h> <C-w>l<C-w>\|

map <M-b> :buffers<CR>:b 
map <silent> <M-d> :b 1<CR>:bd #
map <silent> <M-o> :FSHere<CR>
map <M-r> :b #<CR>

map <silent> <M-p> p=']
map <silent> <M-n> :noh<CR>
map <silent> <M-=> =aB

map <M-/> /\c

map <M-S-o> :ToggleProj<CR>

map <M-t> :tag 
map <M-S-s> <M-t>

map <silent> <M-q> :QFix<CR>

if has("unix")
  map <Leader><C-e> :e <C-R>=expand("%:p:h") . "/" <CR>
  map <Leader>sp :sp <C-R>=expand("%:p:h") . "/" <CR>
else
  map <Leader><C-e> :e <C-R>=expand("%:p:h") . "\" <CR>
  map <Leader>sp :sp <C-R>=expand("%:p:h") . "\" <CR>
endif
map <Leader>J :tabn<CR>
map <Leader>K :tabp<CR>

" Folding!
map <space> za
map <C-space> $zfa%
map <S-space> zd

" Eclim validate!
map <Leader>v :Validate<CR>

" Highlight long lines!
set colorcolumn=+1

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

" to ignore .pyc files in NERDTree:
let NERDTreeIgnore=['\.pyc$', '\.pyc-2\.4', '^tags$', '\~$', '\.o$']

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


" status bar at bottom
set laststatus=2
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P

" Font/colors
colorscheme darkspectrum
"using monospace 10 now
"set guifont=Dina:h8:cDEFAULT 
set gfn=Monospace

" Options for netrw (tree view)
let g:netrw_liststyle = 3
let g:netrw_altv = 1

" Make windows at least 20 chars wide when have focus
set winwidth=20	

function Fullscreen()
	set columns=314
	set lines=85
endfunction

com Fullscreen call Fullscreen()

function DeWhitespace()
  %s/^\s\+$//g
endfunction

com DeWhitespace call DeWhitespace()

noremap <Leader>w :DeWhitespace<cr>

" This _should_ allow me to resize the window to larger than one screen, but
" it doesn't...
set cpo+=\|

" For p4
"runtime perforce\perforceutils.vim
"runtime perforce\perforcemenu.vim

" make sure changes aren't abandoned when switching buffers
set hidden
" get rid of nag screen when file changes outside of Vim but hasn't been
" modified inside Vim
set autoread

" For quick searching for ids in files
map _u :call ID_search()<Bar>execute "/\\<" . g:word . "\\>"<CR>
	map _n :n<Bar>execute "/\\<" . g:word . "\\>"<CR>

	function! ID_search()
	  let g:word = expand("<cword>")
	  let x = system("lid --key=none ". g:word)
	  let x = substitute(x, "\n", " ", "g")
	  execute "next " . x
	endfun


set tags=./tags,tags
" For omnicppcomplete
filetype plugin on

" Enable omnicomplete
set ofu=syntaxcomplete#Complete

" Set user defined completion as default (for Eclim)
let g:SuperTabSetDefaultCompletionType="context"
let g:SuperTabContextDefaultCompletionType="<c-x><c-u>"

" Disable automatic validation on save (for Eclim)
let g:EclimJavaSrcValidate=0

set ignorecase smartcase

let g:ctags_statusline=1

" Load Google-internal stuff
if filereadable("/home/pieps/.vim/google.vimrc")
  source /home/pieps/.vim/google.vimrc
endif

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

if &diff
  autocmd VimEnter * call DiffSetup()
endif

" P4 integration part III: reading //depot files
autocmd BufReadCmd //depot/* exe "0r !p4 print -q <afile>"
autocmd BufReadCmd //depot/* 1
autocmd BufReadCmd //depot/* set readonly

" Make locking code more visible
highlight Locking term=standout ctermfg=Yellow ctermbg=Blue guifg=Yellow guibg=Blue
match Locking /\(Reader\|Writer\|\)MutexLock \w\+([^(]\+)\|\.Lock()\|\.Unlock()\|lock_/

" for FSwitch - make cc go to h
let fsneednomatch = 'on'
au! BufEnter *.cc let b:fswitchdst = 'h' | let b:fswitchlocs = '.'
au! BufEnter *.h let b:fswitchdst = 'cc' | let b:fswitchlocs = '.'

" for sane line wrapping in Java
au BufEnter *.java setlocal cinoptions-=(0
au BufEnter *.java setlocal cinoptions+=(2s

" To preserve valuable screen real estate
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar (in all situations)

" Enable extended % matching
runtime macros/matchit.vim

" Better command completion
" Complete until unique prefix
"set wildmode=list:longest
" First tab completes as much as possible
" Second tab provides a list
" Third+ tabs cycle through results
set wildmode=list:longest,full
set wildmenu
if has("wildignorecase")
  set wildignorecase
endif

" Remap ` to '
nnoremap ' `
nnoremap ` '

" Maintain more text around cursor
set scrolloff=3

" Scroll viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Visual bell
set visualbell

" For taglist to work correctly per
" http://groups.google.com/group/eclim-user/browse_thread/thread/feaef5416af60715
let g:taglisttoo_disabled = 1

" Save last session
autocmd VimLeave * mksession! ~/.vim/last-session.vim

" For Conque to keep it updating
let g:ConqueTerm_ReadUnfocused = 1
