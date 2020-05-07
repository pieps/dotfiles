" All-important hotkeys

" map <Esc>e :e **/
" map <Esc>e :FindInProject **
" Switching these to not wrap for better l-r control
" noremap <Esc>h <C-w>W
noremap <Esc>h <C-w>h
noremap <Esc>j <C-w>j
noremap <Esc>k <C-w>k
" noremap <Esc>l <C-w>w
noremap <Esc>l <C-w>l

noremap <Esc><S-h> <C-w>H
noremap <Esc><S-j> <C-w>J
noremap <Esc><S-k> <C-w>K
noremap <Esc><S-l> <C-w>L

noremap <C-S-l> <C-w>h<C-w>\|
noremap <C-S-k> <C-w>j<C-w>_
noremap <C-S-j> <C-w>k<C-w>_
noremap <C-S-h> <C-w>l<C-w>\|

" I've been hitting the emacs a bit hard lately
noremap <C-g> <Esc>

" map <Esc>b :buffers<CR>:b 
nnoremap <Esc>b :Buffers<CR>
map <silent> <Esc>d :b 1<CR>:bd #
map <Esc>r :b #<CR>

map <silent> <Esc>p p=']
map <silent> <Esc>n :noh<CR>
map <silent> <Esc-=> =aB

map <Esc-/> /\c

map <Esc>t :tag 
map <Esc><S-s> <Esc>t

map <silent> <Esc>q :QFix<CR>
map <silent> <Esc>w :cp<CR>
map <silent> <Esc>e :cn<CR>

if has("unix")
  map <Leader><C-e> :e <C-R>=expand("%:p:h") . "/" <CR>
  map <Leader>sp :sp <C-R>=expand("%:p:h") . "/" <CR>
else
  map <Leader><C-e> :e <C-R>=expand("%:p:h") . "\" <CR>
  map <Leader>sp :sp <C-R>=expand("%:p:h") . "\" <CR>
endif
map <Leader>J :tabn<CR>
map <Leader>K :tabp<CR>
map <silent><Leader>o :FufFile<CR>

" Folding!
map <space> za
map <C-space> $zfa%
map <S-space> zd

noremap <Leader>w :DeWhitespace<cr>

" Remap ` to '
nnoremap ' `
nnoremap ` '

" Scroll viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

map <Leader>i :JavaImport

" Go to definition via YCM.
nnoremap <C-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>

nnoremap <C-p> :FZF<CR>

" Haskell fun with ALE
autocmd FileType haskell nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<cr>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
