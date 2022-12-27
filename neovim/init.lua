do -- Settings.

  vim.o.hidden = true
  vim.o.backup = false
  vim.o.writebackup = false
  vim.o.updatetime = 250
  vim.wo.signcolumn = 'yes'
  vim.o.termguicolors = true
  vim.o.mouse = 'a'
  vim.o.pumblend = 30
  vim.o.expandtab = true
  vim.o.tabstop = 2
  vim.o.shiftwidth = 2
  vim.o.swapfile = false
  vim.o.winaltkeys = 'no'
  vim.wo.colorcolumn = '+1'
  vim.o.laststatus = 2
  vim.o.background = 'dark'
  vim.o.guifont = 'Monospace'
  vim.o.autoread = true
  vim.o.ignorecase = true
  vim.o.smartcase = true
  vim.o.number = true
  vim.o.visualbell = true
  vim.o.scrolloff = 3

  -- Disable keycode delays.
  vim.g.ttimeoutlen = 0
end

-- TODO(neovim/neovim#12378): Migrate this to native lua when autocmds work.
vim.cmd('source ~/.vim/functions.vim')

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
require('lazy').setup('config.plugins')

do -- lspconfig
  pcall(require, 'neo.custom_lsp')
end

vim.cmd [[colorscheme sonokai]]

do -- Keybindings.
  search_dirs = nil
  function find_search_dirs()
    if search_dirs then
      return search_dirs
    end
    local loaded, dirs = pcall(require, 'neo.search_dirs')
    if loaded then
      for key, value in pairs(dirs) do
        if vim.fn.getcwd():sub(- #key) == key then
          search_dirs = value
          return value
        end
      end
    end
    search_dirs = {}
    return {}
  end

  local function map(lhs, rhs, mode, expr) -- wait for lua keymaps: neovim/neovim#13823
    mode = mode or 'n'
    if mode == 'n' then rhs = '<cmd>' .. rhs .. '<cr>' end
    vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true, expr = expr })
  end

  map('<C-n>', 'tabnew')
  map("'", '`', '')
  map('`', "'", '')
  map('<C-e>', '3<C-e>', '')
  map('<C-y>', '3<C-y>', '')

  map('<C-p>', 'lua require("telescope.builtin").find_files({search_dirs=find_search_dirs()})')
  map('<M-b>', 'lua require("telescope.builtin").buffers()')

  vim.cmd 'au FileType java nnoremap <Leader>t :call ToggleTestJava(0)<CR>'
  vim.cmd 'au FileType java nnoremap <Leader>T :call ToggleTestJava(1)<CR>'

  if vim.fn.has('unix') then
    vim.api.nvim_set_keymap('n', '<Leader>E', ':e <C-R>=expand("%:p:h") . "/"<CR>', { noremap = true })
  else
    vim.api.nvim_set_keymap('n', '<Leader>E', ':e <C-R>=expand("%:p:h") . "\\"<CR>', { noremap = true })
  end

  map('<M-h>', '<C-w>h', '')
  map('<M-j>', '<C-w>j', '')
  map('<M-k>', '<C-w>k', '')
  map('<M-l>', '<C-w>l', '')

  map('<M-S-h>', '<C-w>H', '')
  map('<M-S-j>', '<C-w>J', '')
  map('<M-S-k>', '<C-w>K', '')
  map('<M-S-l>', '<C-w>L', '')

  map('<M-d>', 'b #<CR>:bd #')
  map('<M-r>', '<C-^>', '')
  map('<M-o>', 'call CurtineIncSw()')

  map('<M-p>', "p=']", '')
  map('<M-n>', 'noh')
  map('<M-=>', '=aB', '')

  map('<M-/>', 'History/')
  map('<M-;>', 'History:')

  map('<M-q>', 'QFix')
  map('<M-w>', 'cp')
  map('<M-e>', 'cn')

  map('<M-v>', 'Vista!!')
end
