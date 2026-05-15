local M = {
  'folke/trouble.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = true,
  keys = {
    { '<leader>xx', '<cmd>TroubleToggle<cr>' },
    { '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>' },
    { '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>' },
    { '<leader>xl', '<cmd>TroubleToggle loclist<cr>' },
    { '<leader>xq', '<cmd>TroubleToggle quickfix<cr>' },
    { '<M-q>', '<cmd>TroubleToggle quickfix<cr>' },
    { 'gR', '<cmd>TroubleToggle lsp_references<cr>' },
  },
}

return M
