local util = require('config.util')

local M = {
  util.gh('kdheepak/tabline.nvim'),
  dependencies = {
    util.gh('nvim-tree/nvim-web-devicons'),
  },
  config = true,
}

return M
