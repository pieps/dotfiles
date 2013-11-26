" All-important hotkeys

" map <M-e> :e **/
" map <M-e> :FindInProject **
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

" I've been hitting the emacs a bit hard lately
noremap <C-g> <Esc>
map <C-x><C-b> :FufBuffer<CR>

" map <M-b> :buffers<CR>:b 
map <silent><M-b> :FufBuffer<CR>
map <silent><M-f> :FufFile<CR>
map <silent><M-S-f> :FufFileWithCurrentBufferDir<CR>
map <silent> <M-d> :b 1<CR>:bd #
" Disabling because I don't use C/C++ and I want to use M-o for :cn.
" map <silent> <M-o> :FSHere<CR>
map <M-r> :b #<CR>

map <silent> <M-p> p=']
map <silent> <M-n> :noh<CR>
map <silent> <M-=> =aB

map <M-/> /\c

map <M-S-o> :ToggleProj<CR>

map <M-t> :tag 
map <M-S-s> <M-t>

map <silent> <M-q> :QFix<CR>
map <silent> <M-w> :cp<CR>
map <silent> <M-e> :cn<CR>

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

" Eclim validate!
map <Leader>v :Validate<CR>

noremap <Leader>w :DeWhitespace<cr>

" Remap ` to '
nnoremap ' `
nnoremap ` '

" Scroll viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

