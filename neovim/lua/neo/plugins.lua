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
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'

  -- LSP & languages.
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'h-michael/lsp-ext.nvim'
  use 'onsails/lspkind-nvim'
  use {
    'windwp/nvim-autopairs',
    event = 'BufRead',
    config = function()
      require('nvim-autopairs').setup({check_ts = true})

      -- If you want insert `(` after select function or method item
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
    end,
    after = {'nvim-cmp', 'nvim-treesitter'},
  }

  -- Languages.
  use 'rust-lang/rust.vim'
  use 'simrat39/rust-tools.nvim'
  use 'leafgarland/typescript-vim'
  use 'ericcurtin/CurtineIncSw.vim'

  -- Buffer management.
  use 'tpope/vim-vinegar'
  use 'troydm/zoomwintab.vim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
    end,
  }
  use 'liuchengxu/vista.vim'
  use 'chentau/marks.nvim'
  use {'sso://googler@user/vintharas/telescope-codesearch.nvim', after = { 'telescope.nvim'}}

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
  use 'j-hui/fidget.nvim'
end)


