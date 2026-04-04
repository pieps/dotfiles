require('config.opts')

-- TODO(neovim/neovim#12378): Migrate this to native lua when autocmds work.
vim.cmd('source ~/.vim/functions.vim')

-- Plugins.
require('config.lazy')

require('config.mappings')
