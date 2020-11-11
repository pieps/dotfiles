set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

set termguicolors
set mouse=a
set pumblend=30

if !exists('g:vscode')
  source ~/.config/nvim/plug.vim
endif
source ~/.vim/functions.vim
source ~/.vim/settings.vim
source ~/.vim/hotkeys.vim
if !exists('g:vscode')
  source ~/.vim/coc_recommended_settings.vim
endif

" Load Google-internal stuff
if filereadable(expand("~/google.vimrc"))
  source ~/google.vimrc
endif
