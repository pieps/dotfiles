local util = require('config.util')

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
local M = {
  util.gh('nvim-neo-tree/neo-tree.nvim'),
  cmd = 'Neotree',
  dependencies = {
    util.gh('nvim-lua/plenary.nvim'),
    util.gh('nvim-tree/nvim-web-devicons'), -- not strictly required, but recommended
    util.gh('MunifTanjim/nui.nvim'),
  },
  keys = {
    { '<M-f>', '<cmd>Neotree toggle reveal<cr>' }
  },
}

return M
