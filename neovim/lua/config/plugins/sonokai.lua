local util = require('config.util')

local M = {
  util.gh('sainnhe/sonokai'),
}

function M.config()
  vim.g.sonokai_style = 'andromeda'
  vim.cmd [[colorscheme sonokai]]
end

return M
