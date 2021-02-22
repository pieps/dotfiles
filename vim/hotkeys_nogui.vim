" All-important hotkeys

noremap <Esc>h <C-w>h
noremap <Esc>j <C-w>j
noremap <Esc>k <C-w>k
noremap <Esc>l <C-w>l

noremap <Esc><S-h> <C-w>H
noremap <Esc><S-j> <C-w>J
noremap <Esc><S-k> <C-w>K
noremap <Esc><S-l> <C-w>L

nnoremap <silent> <Esc>b :Buffers<CR>
nnoremap <silent> <Esc>f :Ex<CR>
nnoremap <silent> <Esc>d :b #<CR>:bd #<CR>
nnoremap <silent> <Esc>r <C-^>
nnoremap <silent> <Esc>o :call CurtineIncSw()<CR>

nnoremap <silent> <Esc>p p=']
nnoremap <silent> <Esc>n :noh<CR>
nnoremap <silent> <Esc-=> =aB


nnoremap <silent> <Esc>/ :History/<CR>
nnoremap <silent> <Esc>; :History:<CR>

nnoremap <silent> <Esc>q :QFix<CR>
nnoremap <silent> <Esc>w :cp<CR>
nnoremap <silent> <Esc>e :cn<CR>

nnoremap <silent> <Esc>v :Vista!!<CR>
