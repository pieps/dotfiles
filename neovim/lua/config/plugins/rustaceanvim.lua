local util = require('config.util')

local M = {
  util.gh('mrcjkb/rustaceanvim'),
  version = '^9',
  dependencies = {
    util.gh('mfussenegger/nvim-dap'),
  },
}

return M
