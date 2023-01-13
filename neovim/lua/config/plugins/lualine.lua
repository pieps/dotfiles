local util = require('config.util')

local M = {
  util.gh('nvim-lualine/lualine.nvim'),
  dependencies = {
    util.gh('nvim-tree/nvim-web-devicons'),
    util.gh('kdheepak/tabline.nvim'),
  },
  opts = {
    options = {
      extensions = { 'neo-tree', 'quickfix' }
    },
  },
}

return M
