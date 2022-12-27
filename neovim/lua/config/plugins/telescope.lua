local util = require('config.util')

local M = {
  util.gh('nvim-telescope/telescope.nvim'),
  dependencies = { util.gh('nvim-telescope/telescope-fzf-native.nvim'), build = 'make' },
}

function M.config()
  require('telescope').load_extension('fzf')
end

return M
