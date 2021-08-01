local pack_path =  '/site/pack/packer/start/packer.nvim'
local install_path = vim.fn.stdpath('data') .. pack_path
local packer_repo = 'https://github.com/wbthomason/packer.nvim'

if vim.fn.isdirectory(install_path) == 0 then
  vim.cmd(table.concat({'!git', 'clone', packer_repo, install_path}, ' '))
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]], false)

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'

  -- LSP & languages.
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'rust-lang/rust.vim'
  use 'simrat39/rust-tools.nvim'
  use 'ericcurtin/CurtineIncSw.vim'
  use 'leafgarland/typescript-vim'
  use 'onsails/lspkind-nvim'
  use 'honza/vim-snippets'
  use 'h-michael/lsp-ext.nvim'
  use 'cohama/lexima.vim'

  -- Buffer management.
  use 'tpope/vim-vinegar'
  use 'troydm/zoomwintab.vim'
  --use {'junegunn/fzf', run='./install --all'}
  --use 'junegunn/fzf.vim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'lukas-reineke/indent-blankline.nvim'

  -- Eye candy
  use 'vim-airline/vim-airline'
  use {
    'vim-airline/vim-airline-themes',
    requires = {'vim-airline/vim-airline'}}
  use 'powerline/fonts'
  use 'sainnhe/sonokai'
  use 'sainnhe/edge'
  use 'arzg/vim-colors-xcode'
  use 'sickill/vim-monokai'
  use 'Mcmartelle/vim-monokai-bold'
  use 'ludovicchabant/vim-lawrencium'
  use 'flazz/vim-colorschemes'
  use 'ryanoasis/vim-devicons'
  use 'liuchengxu/vista.vim'
end)


