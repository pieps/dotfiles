" Miscellaneous settings

" Added by nick for sane tabbing:
"set noexpandtab tabstop=4 shiftwidth=4
" Be Googley
set expandtab tabstop=2 shiftwidth=2

" Added by Nick to get rid of annoying swap files (I can't say I've benefitted
" from them ever!)
set noswapfile

" Added by nick for some Slick-like keys
set wak=no

" Highlight long lines!
set colorcolumn=+1

" status bar at bottom
set laststatus=2
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P

" Font/colors
colorscheme darkspectrum
"TODO(pieps): Figure out what values I want for solarized.
"set background=dark
"colorscheme solarized
"using monospace 10 now
"set guifont=Dina:h8:cDEFAULT 
set gfn=Monospace

" Options for netrw (tree view)
let g:netrw_liststyle = 3
let g:netrw_altv = 1

" Make windows at least 20 chars wide when have focus
set winwidth=20	

" This _should_ allow me to resize the window to larger than one screen, but
" it doesn't...
" set cpo+=\|

" make sure changes aren't abandoned when switching buffers
set hidden
" get rid of nag screen when file changes outside of Vim but hasn't been
" modified inside Vim
set autoread

" Enable omnicomplete
set ofu=syntaxcomplete#Complete

set ignorecase smartcase

let g:ctags_statusline=1

"if &diff
  "autocmd VimEnter * call DiffSetup()
"endif

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

" Better autocompletion
" Complete until unique prefix, then show menu
set completeopt+=longest

" Maintain more text around cursor
set scrolloff=3

" Visual bell
set visualbell

" Save last session
autocmd VimLeave * mksession! ~/.vim/last-session.vim

" For Conque to keep it updating
let g:ConqueTerm_ReadUnfocused = 1

" Make indendtation for go correct
au BufRead,BufNewFile *.go set noet ts=4 sw=4

let g:ycm_extra_conf_globlist = ['~/src/cpp/*', '!~/*']
let g:ycm_rust_src_path = '/usr/local/rust/rustc-1.11.0/src'

call showmarks#ShowMarks('global,enable')
