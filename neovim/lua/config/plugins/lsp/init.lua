local M = {
  'neovim/nvim-lspconfig',
  event = 'BufWritePre',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  }
}

return M
