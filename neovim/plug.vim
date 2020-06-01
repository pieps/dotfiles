" Load all bundles with vundle

filetype off
call plug#begin(stdpath('config').'/plugged')
Plug 'Blackrush/vim-gocode'
Plug 'easymotion/vim-easymotion'
"Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/genutils'
Plug 'vim-scripts/keepcase.vim'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/multvals.vim'
"Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'jacquesbh/vim-showmarks'
Plug 'marijnh/tern_for_vim'
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'troydm/zoomwintab.vim'
Plug 'powerline/fonts'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
call plug#end()
filetype plugin indent on
