" Load all plugins with vim-plug.

function GeneralPurpose()
  Plug 'vim-scripts/genutils'
  Plug 'vim-scripts/keepcase.vim'
  Plug 'vim-scripts/L9'
  Plug 'vim-scripts/multvals.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'jacquesbh/vim-showmarks'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'honza/vim-snippets'
endfunction

function Lang()
  Plug 'Blackrush/vim-gocode'
  Plug 'rust-lang/rust.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'sheerun/vim-polyglot'
endfunction

function TextManagement()
Plug 'easymotion/vim-easymotion'
"Plug 'vim-scripts/ReplaceWithRegister'
Plug 'jiangmiao/auto-pairs'
endfunction

function BufferManagement()
  Plug 'tpope/vim-vinegar'
  Plug 'troydm/zoomwintab.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
endfunction

function Ide()
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'dense-analysis/ale'
  Plug 'tpope/vim-fugitive'
endfunction


function EyeCandy()
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'powerline/fonts'
  Plug 'sainnhe/sonokai'
  Plug 'sainnhe/edge'
  Plug 'arzg/vim-colors-xcode'
  Plug 'sickill/vim-monokai'
  Plug 'Mcmartelle/vim-monokai-bold'
  Plug 'ludovicchabant/vim-lawrencium'
  Plug 'flazz/vim-colorschemes'
  Plug 'ryanoasis/vim-devicons'
  Plug 'liuchengxu/vista.vim'
endfunction

filetype off
call plug#begin(stdpath('config').'/plugged')
if !exists('g:vscode')
  call GeneralPurpose()
  call Lang()
  call TextManagement()
  call BufferManagement()
  call Ide()
endif
call EyeCandy()
call plug#end()
filetype plugin indent on

