local util = require('config.util')

local M = {
  util.gh('liuchengxu/vista.vim'),
}

function M.config()
  vim.g.vista_default_executive = 'nvim_lsp'
end

return M
