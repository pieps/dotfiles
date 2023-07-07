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
  local trouble = require('trouble.providers.telescope')
  local telescope = require('telescope')
  telescope.setup {
    defaults = {
      mappings = {
        i = {
          ['<c-t>'] = trouble.open_with_trouble,
          ["<c-j>"] = require('telescope.actions').cycle_history_next,
          ["<c-k>"] = require('telescope.actions').cycle_history_prev,
        },
        n = { ['<c-t>'] = trouble.open_with_trouble },
      },
    },
  }
  telescope.load_extension('fzf')
end

return M
