" All-important hotkeys

noremap <M-h> <C-w>h
noremap <M-j> <C-w>j
noremap <M-k> <C-w>k
noremap <M-l> <C-w>l

noremap <M-S-h> <C-w>H
noremap <M-S-j> <C-w>J
noremap <M-S-k> <C-w>K
noremap <M-S-l> <C-w>L

noremap <C-S-l> <C-w>h<C-w>\|
noremap <C-S-k> <C-w>j<C-w>_
noremap <C-S-j> <C-w>k<C-w>_
noremap <C-S-h> <C-w>l<C-w>\|

nnoremap <silent><M-b> :Buffers<CR>
nnoremap <silent><M-f> :Files<CR>
nmap <silent> <M-d> :b 1<CR>:bd #
map <M-r> :b #<CR>

map <silent> <M-p> p=']
map <silent> <M-n> :noh<CR>
map <silent> <M-=> =aB

map <M-/> /\c

map <silent> <M-q> :QFix<CR>
map <silent> <M-w> :cp<CR>
map <silent> <M-e> :cn<CR>
