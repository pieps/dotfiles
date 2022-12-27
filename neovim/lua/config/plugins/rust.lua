local util = require('config.util')

local M = {
  util.gh('rust-lang/rust.vim'),
  { util.gh('simrat39/rust-tools.nvim'),
    dependencies = {
      util.gh('mfussenegger/nvim-dap'),
      util.gh('nvim-lua/plenary.nvim')
    },
  }
}

return M
