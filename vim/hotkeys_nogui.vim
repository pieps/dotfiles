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
"map <C-x><C-b> :FufBuffer<CR>
map <C-x><C-b> :CtrlPBuffer<CR>

" map <Esc>b :buffers<CR>:b 
"map <silent><Esc>b :FufBuffer<CR>
map <silent><Esc>b :CtrlPBuffer<CR>
map <silent><Esc>f :FufFile<CR>
map <silent><Esc><S-f> :FufFileWithCurrentBufferDir<CR>
map <silent> <Esc>d :b 1<CR>:bd #
" Disabling because I don't use C/C++ and I want to use Esc-o for :cn.
" map <silent> <Esc>o :FSHere<CR>
map <Esc>r :b #<CR>

map <silent> <Esc>p p=']
map <silent> <Esc>n :noh<CR>
map <silent> <Esc-=> =aB

map <Esc-/> /\c

map <Esc><S-o> :ToggleProj<CR>

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

" Eclim validate!
map <Leader>v :Validate<CR>

noremap <Leader>w :DeWhitespace<cr>

" Remap ` to '
nnoremap ' `
nnoremap ` '

" Scroll viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

map <Leader>i :JavaImport

" Go to definition via YCM.
nnoremap <C-]> :YcmCompleter GoToDefinition<CR>
