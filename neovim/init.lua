require('config.opts')

-- TODO(neovim/neovim#12378): Migrate this to native lua when autocmds work.
vim.cmd('source ~/.vim/functions.vim')

-- Plugins.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)
require('config.plugins.lsp.diagnostics').setup()
require('lazy').setup({
  spec = {
    { import = 'config.plugins' }
  },
  git = { url_format = '%s' },
  checker = { enabled = true },
})

require('config.mappings')
