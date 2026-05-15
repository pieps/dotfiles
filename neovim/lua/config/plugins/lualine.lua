local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'kdheepak/tabline.nvim',
  },
  opts = {
    options = {
      extensions = { 'neo-tree', 'quickfix' }
    },
    sections = {
      lualine_c = {
        {
          'filename',
          path = 1,
        }
      }
    }
  },
}

return M
