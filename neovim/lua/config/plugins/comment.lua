local util = require('config.util')

local M = {
  util.gh('terrortylor/nvim-comment'),
}

function M.config()
  require('nvim_comment').setup({})
end

return M
