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

nnoremap <silent> <M-b> :Buffers<CR>
nnoremap <silent> <M-f> :Ex<CR>
nnoremap <silent> <M-d> :b #<CR>:bd #<CR>
nnoremap <silent> <M-r> <C-^>

nnoremap <silent> <M-p> p=']
nnoremap <silent> <M-n> :noh<CR>
nnoremap <silent> <M-=> =aB

nnoremap <M-/> /\c

nnoremap <silent> <M-q> :QFix<CR>
nnoremap <silent> <M-w> :cp<CR>
nnoremap <silent> <M-e> :cn<CR>
