require('config.opts')

-- TODO(neovim/neovim#12378): Migrate this to native lua when autocmds work.
vim.cmd('source ~/.vim/functions.vim')
vim.cmd('source /usr/share/vim/google/glug/bootstrap.vim')
vim.cmd('Glug core')
vim.cmd('Glug languages')

-- Plugins.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)
require('config.plugins.lsp.diagnostics').setup()
require('lazy').setup('config.plugins', { git = { url_format = '%s' } })

require('config.mappings')
