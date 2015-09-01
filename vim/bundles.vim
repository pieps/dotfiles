" Load all bundles with vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
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
Bundle 'scrooloose/nerdtree'
"Bundle 'simple-pairs'
Bundle 'jacquesbh/vim-showmarks'
Bundle 'Syntastic'
Bundle 'taglist.vim'
Bundle 'Vimacs'
if !filereadable(expand("~/.vim/google.vimrc"))
  Bundle 'Valloric/YouCompleteMe'
endif
