local util = require('config.util')

local M = {
  util.gh('ryanoasis/vim-devicons'),
}

function M.config()
  -- Use ferris, not the Rust logo.
  vim.g.WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {
    rs = '',
    rlib = ''
  }
end

return M
