local M = {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}

function M.config()
  require('telescope').load_extension('fzf')
end

return M
