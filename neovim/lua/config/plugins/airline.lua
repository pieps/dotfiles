local util = require('config.util')

local M = {
  util.gh('vim-airline/vim-airline'),
  util.gh('vim-airline/vim-airline-themes'),
  util.gh('powerline/fonts'),
}

function M.config()
  vim.g.airline_powerline_fonts = 1
  vim.g['airline#extensions#ale#enabled'] = 1
  vim.g['airline#extensions#bufferline#enabled'] = 1
  vim.g['airline#extensions#fugitiveline#enabled'] = 1
  vim.g['airline#extensions#nvimlsp#enabled'] = 1
  vim.g['airline#extensions#tabline#enabled'] = 1
  vim.g['airline#extensions#tabline#formatter'] = 'unique_tail_improved'
  vim.g['airline#extensions#vista#enabled'] = 1
  vim.g['airline#extensions#whitespace#enabled'] = 1
  vim.g['airline#extensions#zoomwintab#enabled'] = 1
  vim.g.webdevicons_enable_airline_tabline = 1
  vim.g.webdevicons_enable_airline_statusline = 1
end

return M
