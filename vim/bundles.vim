" Load all bundles with vundle

filetype off
call plug#begin('~/.vim/bundle')
Plug 'Blackrush/vim-gocode'
Plug 'easymotion/vim-easymotion'
"Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/genutils'
Plug 'vim-scripts/keepcase.vim'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/multvals.vim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'jacquesbh/vim-showmarks'
Plug 'marijnh/tern_for_vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'w0rp/ale'
" TODO(pieps): Configure correctly; resolve conflict with internal version.
"Plug 'google/vim-codefmt'
if !filereadable(expand("~/.vim/google.vimrc"))
  Plug 'Valloric/YouCompleteMe'
endif
call plug#end()
filetype plugin indent on
