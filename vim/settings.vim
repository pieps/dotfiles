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
" No longer relevant: set by airline.
"set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P

" Font/colors
set background=dark
"colorscheme darkspectrum
colorscheme sonokai
set gfn=Monospace

" Options for netrw (tree view)
let g:netrw_liststyle = 3
let g:netrw_altv = 1

" Make windows at least 20 chars wide when have focus
set winwidth=20	

" make sure changes aren't abandoned when switching buffers
set hidden
" get rid of nag screen when file changes outside of Vim but hasn't been
" modified inside Vim
set autoread

" Enable omnicomplete
set ofu=syntaxcomplete#Complete

set ignorecase smartcase

set number

let g:ctags_statusline=1

"if &diff
  "autocmd VimEnter * call DiffSetup()
"endif

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

" Make indendtation for go correct
au BufRead,BufNewFile *.go set noet ts=4 sw=4

let g:ycm_extra_conf_globlist = ['~/src/cpp/*', '!~/*']
let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_server_python_interpreter = '/usr/bin/python'

let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#whitespace#enabled = 1
let g:airline_left_sep = "\uE0B4"
let g:airline_right_sep = "\uE0B6"
"let g:airline_left_sep = "\ue0b8" 
"let g:airline_left_alt_sep = "\ue0b9" 
"let g:airline_right_sep = "\ue0be" 
"let g:airline_right_alt_sep = "\ue0bf" 

let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_linters = {}
let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

let g:vista_default_executive = 'coc'
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc 
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" Disable keycode delays
set ttimeoutlen=0

call showmarks#ShowMarks('global,enable')

" auto-pairs settings.
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutFastWrap = '<M-w>'
let g:AutoPairsShortcutJump = '<M-e>'
