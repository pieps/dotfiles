" Load all bundles with vundle

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"TODO(pieps): Clean up existing plugins, install here.
Plugin 'Blackrush/vim-gocode'
"Plugin 'cscope.vim'
Plugin 'EasyMotion'
Plugin 'ervandew/supertab'
Plugin 'FSwitch'
Plugin 'ctrlp.vim'
"Plugin 'FuzzyFinder'
Plugin 'genutils'
Plugin 'keepcase.vim'
Plugin 'L9'
Plugin 'multvals.vim'
"Plugin 'project.vim'
Plugin 'ReplaceWithRegister'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'simple-pairs'
Plugin 'jacquesbh/vim-showmarks'
Plugin 'Syntastic'
Plugin 'taglist.vim'
Plugin 'marijnh/tern_for_vim'
"Plugin 'Vimacs'
Plugin 'rdnetto/YCM-Generator'
Plugin 'rust-lang/rust.vim'
if !filereadable(expand("~/.vim/google.vimrc"))
  Plugin 'Valloric/YouCompleteMe'
endif
call vundle#end()
filetype plugin indent on
