local pack_path = '/site/pack/packer/start/packer.nvim'
local install_path = vim.fn.stdpath('data') .. pack_path
local packer_repo = 'https://github.com/wbthomason/packer.nvim'

if vim.fn.isdirectory(install_path) == 0 then
  vim.cmd(table.concat({ '!git', 'clone', packer_repo, install_path }, ' '))
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]], false)

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = 'all',
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        textobjects = {
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
      }
    end,
  }

  -- LSP & text editing.
  use 'neovim/nvim-lspconfig'
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    },
  }
  use 'h-michael/lsp-ext.nvim'
  use 'onsails/lspkind-nvim'
  use {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup({})
    end,
  }
  use {
    'windwp/nvim-autopairs',
    event = 'BufRead',
    config = function()
      require('nvim-autopairs').setup({ check_ts = true })

      -- If you want insert `(` after select function or method item
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
    end,
    after = { 'nvim-cmp', 'nvim-treesitter' },
  }
  use 'tpope/vim-abolish'

  -- Languages.
  use 'rust-lang/rust.vim'
  use { 'simrat39/rust-tools.nvim',
    requires = { 'mfussenegger/nvim-dap', 'nvim-lua/plenary.nvim' },
  }
  use {
    'L3MON4D3/LuaSnip',
    requires = { 'saadparwaiz1/cmp_luasnip' },
  }
  use 'leafgarland/typescript-vim'
  use 'ericcurtin/CurtineIncSw.vim'

  -- Buffer management.
  use 'tpope/vim-vinegar'
  use 'troydm/zoomwintab.vim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').load_extension('fzf')
    end,
  }
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
    end,
  }
  use { 'sso://googler@user/vintharas/telescope-codesearch.nvim', after = { 'telescope.nvim' } }
  use {
    'liuchengxu/vista.vim',
    config = function()
      vim.g.vista_default_executive = 'nvim_lsp'
    end,
  }
  use {
    'chentoast/marks.nvim',
    config = function()
      require('marks').setup {}
    end
  }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  use 'famiu/bufdelete.nvim'

  -- Eye candy
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'powerline/fonts'
  use 'sainnhe/sonokai'
  use 'sainnhe/edge'
  use 'arzg/vim-colors-xcode'
  use 'sickill/vim-monokai'
  use 'Mcmartelle/vim-monokai-bold'
  use 'ludovicchabant/vim-lawrencium'
  use 'flazz/vim-colorschemes'
  use 'ryanoasis/vim-devicons'
  use {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup {}
    end
  }
end)
