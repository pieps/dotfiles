local util = require('config.util')

local M = {
  util.gh('nvim-tree/nvim-web-devicons'),
  opts = {
    override = {
      rlib = {
        icon = '',
        color = '#e33b26',
        cterm_color = '209',
        name = 'Rlib',
      },
      rs = {
        icon = '',
        color = '#e33b26',
        cterm_color = '209',
        name = 'Rs',
      },
    },
  },
}

return M
