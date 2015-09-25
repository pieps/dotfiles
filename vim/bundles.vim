" Load all bundles with vundle

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"TODO(pieps): Clean up existing plugins, install here.
Bundle 'Blackrush/vim-gocode'
Bundle 'cscope.vim'
Bundle 'EasyMotion'
Bundle 'ervandew/supertab'
Bundle 'FSwitch'
Bundle 'ctrlp.vim'
"Bundle 'FuzzyFinder'
Bundle 'genutils'
Bundle 'keepcase.vim'
Bundle 'L9'
Bundle 'multvals.vim'
"Bundle 'project.vim'
Bundle 'ReplaceWithRegister'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
"Bundle 'simple-pairs'
Bundle 'jacquesbh/vim-showmarks'
Bundle 'Syntastic'
Bundle 'taglist.vim'
Bundle 'marijnh/tern_for_vim'
Bundle 'Vimacs'
if !filereadable(expand("~/.vim/google.vimrc"))
  Plugin 'Valloric/YouCompleteMe'
endif
call vundle#end()
filetype plugin indent on
