local wk = require('which-key')

vim.cmd 'au FileType java,kotlin nnoremap <silent> <Leader>t :lua require("config.util").toggle_test_java(false)<CR>'
vim.cmd 'au FileType java,kotlin nnoremap <silent> <Leader>T :lua require("config.util").toggle_test_java(true)<CR>'
vim.keymap.set('n', "'", '`')
vim.keymap.set('n', '`', "'")
vim.keymap.set('n', '<C-e>', '3<C-e>')
vim.keymap.set('n', '<C-y>', '3<C-y>')

wk.setup({
  show_help = false,
  triggers = 'auto',
  plugins = { spelling = true },
  key_labels = { ['<leader>'] = '\\' },
})

local keys = {
  ['<C-n>'] = { '<cmd>tabnew<CR>', 'New Tab' },

  ['<C-p>'] = { '<cmd>lua require("telescope.builtin").find_files({search_dirs=require("config.util").find_search_dirs()})<CR>', 'Find Files' },
  ['<M-b>'] = { '<cmd>lua require("telescope.builtin").buffers()<CR>', 'Buffers' },

  ['<leader>E'] = {
    ':e <C-R>=expand("%:p:h") . "/"<CR>',
    'Edit file in current buffer\'s directory',
    silent = false
  },

  ['<M-h>'] = { '<C-w>h', 'Go to the left window' },
  ['<M-j>'] = { '<C-w>j', 'Go to the down window' },
  ['<M-k>'] = { '<C-w>k', 'Go to the up window' },
  ['<M-l>'] = { '<C-w>l', 'Go to the right window' },

  ['<M-S-h>'] = { '<C-w>H', 'Move window left' },
  ['<M-S-j>'] = { '<C-w>J', 'Move window down' },
  ['<M-S-k>'] = { '<C-w>K', 'Move window up' },
  ['<M-S-l>'] = { '<C-w>L', 'Move window right' },

  ['<M-d>'] = { '<cmd>b #<CR>:bd #<CR>', 'Delete this buffer and go to previous' },
  ['<M-r>'] = { '<C-^>', 'Go to previous file' },
  ['<M-o>'] = { '<cmd>call CurtineIncSw()<CR>', 'Toggle between .cc/.h files' },

  ['<M-p>'] = { "p=']", 'Paste and fix indentation' },
  ['<M-n>'] = { '<cmd>noh<CR>', 'Turn off search highlighting' },
  ['<M-=>'] = { '=aB', 'Fix indentation for block' },

  ['<M-/>'] = { '<cmd>History/<CR>', 'Open search history' },
  ['<M-;>'] = { '<cmd>History:<CR>', 'Open command history' },

  ['<M-w>'] = { '<cmd>cp<CR>', 'Go to previous error in quickfix list' },
  ['<M-e>'] = { '<cmd>cn<CR>', 'Go to next error in quickfix list' },

  ['<M-v>'] = { '<cmd>Vista!!<CR>', 'Toggle Vista' },
}
wk.register(keys)
