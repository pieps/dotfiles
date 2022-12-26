local M = {
  'rust-lang/rust.vim',
  { 'simrat39/rust-tools.nvim',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-lua/plenary.nvim'
    },
  }
}

return M
