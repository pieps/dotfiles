" All-important hotkeys

noremap <Esc>h <C-w>h
noremap <Esc>j <C-w>j
noremap <Esc>k <C-w>k
noremap <Esc>l <C-w>l

noremap <Esc><S-h> <C-w>H
noremap <Esc><S-j> <C-w>J
noremap <Esc><S-k> <C-w>K
noremap <Esc><S-l> <C-w>L

nnoremap <Esc>b :Buffers<CR>
nnoremap <Esc>f :Files<CR>
map <silent> <Esc>d :b 1<CR>:bd #
map <Esc>r :b #<CR>

map <silent> <Esc>p p=']
map <silent> <Esc>n :noh<CR>
map <silent> <Esc-=> =aB

map <Esc-/> /\c

map <silent> <Esc>q :QFix<CR>
map <silent> <Esc>w :cp<CR>
map <silent> <Esc>e :cn<CR>
