local util = require('config.util')

local M = {
  util.gh('nvim-treesitter/nvim-treesitter'),
  build = ':TSUpdate',
  dependencies = {
    util.gh('nvim-treesitter/nvim-treesitter-refactor'),
    util.gh('nvim-treesitter/nvim-treesitter-textobjects'),
    util.gh('nvim-treesitter/playground'),
  },
}

function M.config()
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
end

return M
