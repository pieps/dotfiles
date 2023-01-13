local util = require('config.util')

local M = {
  util.gh('nvim-telescope/telescope.nvim'),
  dependencies = {
    {
      util.gh('nvim-telescope/telescope-fzf-native.nvim'),
      build = 'make',
    },
    util.gh('folke/trouble.nvim')
  },
}

function M.config()
  local trouble = require('trouble')
  local telescope = require('telescope')
  telescope.setup {
    defaults = {
      mappings = {
        i = { ['<c-t>'] = trouble.open_with_trouble },
        n = { ['<c-t>'] = trouble.open_with_trouble },
      },
    },
  }
  telescope.load_extension('fzf')
end

return M
