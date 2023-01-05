local util = require('config.util')

local M = {
  util.gh('sainnhe/sonokai'),
  lazy = false,
  priority = 1000,
}

function M.config()
  vim.g.sonokai_style = 'andromeda'
  vim.cmd [[colorscheme sonokai]]
end

return M
