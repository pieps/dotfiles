" Shift doesn't make it into these mappings on terminal.
" Disabling these in favor of coc-snippets bindings in
" coc_recommended_settings.vim.
"nnoremap <C-S-l> <C-w>h<C-w>\|
"nnoremap <C-S-k> <C-w>j<C-w>_
"nnoremap <C-S-j> <C-w>k<C-w>_
"nnoremap <C-S-h> <C-w>l<C-w>\|

" gt and gT are easy enough to type on their own.
"nnoremap <silent> <C-j> gt
"nnoremap <silent> <C-k> gT
nnoremap <silent> <C-n> :tabnew<CR>

" Remap ` to '
nnoremap ' `
nnoremap ` '

" Scroll viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

nnoremap <C-p> :FZF<CR>

" Haskell fun with ALE
autocmd FileType haskell nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<cr>

" ALE keys
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <Leader>F <Plug>(ale_fix)

if has("unix")
  nnoremap <silent> <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
  nnoremap <silent> <Leader>sp :sp <C-R>=expand("%:p:h") . "/" <CR>
else
  nnoremap <silent> <Leader>e :e <C-R>=expand("%:p:h") . "\" <CR>
  nnoremap <silent> <Leader>sp :sp <C-R>=expand("%:p:h") . "\" <CR>
endif

" I've been hitting the emacs a bit hard lately
"noremap <C-g> <Esc>

if has("gui_running") || has('nvim')
  source ~/.vim/hotkeys_gui.vim
else
  source ~/.vim/hotkeys_nogui.vim
endif
