local util = require('config.util')

local M = {
  util.gh('rcarriga/nvim-notify'),
}

function M.config()
  vim.notify = require('notify')
end

return M
