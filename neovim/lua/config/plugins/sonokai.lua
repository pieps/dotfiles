local M = {
  'sainnhe/sonokai',
  lazy = false,
  priority = 1000,
}

function M.config()
  vim.g.sonokai_style = 'andromeda'
  vim.g.sonokai_transparent_background = 1
  vim.cmd [[colorscheme sonokai]]
end

return M
