noremap <C-S-l> <C-w>h<C-w>\|
noremap <C-S-k> <C-w>j<C-w>_
noremap <C-S-j> <C-w>k<C-w>_
noremap <C-S-h> <C-w>l<C-w>\|

" Folding!
map <space> za
map <C-space> $zfa%
map <S-space> zd

" Remap ` to '
nnoremap ' `
nnoremap ` '

" Scroll viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"map <Leader>i :JavaImport

" Go to definition via YCM.
"nnoremap <C-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>

nnoremap <C-p> :FZF<CR>

" Haskell fun with ALE
autocmd FileType haskell nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<cr>

" ALE keys
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <Leader>f <Plug>(ale_fix)
nmap <silent> <Leader>t <Plug>(ale_hover)

" I've been hitting the emacs a bit hard lately
"noremap <C-g> <Esc>

if has("gui_running") || has('nvim')
  source ~/.vim/hotkeys_gui.vim
else
  source ~/.vim/hotkeys_nogui.vim
endif
