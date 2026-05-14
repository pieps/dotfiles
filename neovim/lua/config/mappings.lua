local wk = require('which-key')

vim.cmd 'au FileType java,kotlin,bzl nnoremap <silent> <Leader>t :lua require("config.util").toggle_test_java(false)<CR>'
vim.cmd 'au FileType java,kotlin,bzl nnoremap <silent> <Leader>T :lua require("config.util").toggle_test_java(true)<CR>'
vim.keymap.set('n', "'", '`')
vim.keymap.set('n', '`', "'")
vim.keymap.set('n', '<C-e>', '3<C-e>')
vim.keymap.set('n', '<C-y>', '3<C-y>')

wk.setup({
  show_help = false,
})

local keys = {
    { "<C-n>", "<cmd>tabnew<CR>", desc = "New Tab" },
    { "<C-p>", '<cmd>lua require("telescope.builtin").find_files({search_dirs=require("config.util").find_search_dirs()})<CR>', desc = "Find Files" },
    { "<M-/>", "<cmd>History/<CR>", desc = "Open search history" },
    { "<M-;>", "<cmd>History:<CR>", desc = "Open command history" },
    { "<M-=>", "=aB", desc = "Fix indentation for block" },
    { "<M-S-h>", "<C-w>H", desc = "Move window left" },
    { "<M-S-j>", "<C-w>J", desc = "Move window down" },
    { "<M-S-k>", "<C-w>K", desc = "Move window up" },
    { "<M-S-l>", "<C-w>L", desc = "Move window right" },
    { "<M-b>", '<cmd>lua require("telescope.builtin").buffers()<CR>', desc = "Buffers" },
    { "<M-d>", "<cmd>b #<CR>:bd #<CR>", desc = "Delete this buffer and go to previous" },
    { "<M-e>", "<cmd>cn<CR>", desc = "Go to next error in quickfix list" },
    { "<M-h>", "<C-w>h", desc = "Go to the left window" },
    { "<M-j>", "<C-w>j", desc = "Go to the down window" },
    { "<M-k>", "<C-w>k", desc = "Go to the up window" },
    { "<M-l>", "<C-w>l", desc = "Go to the right window" },
    { "<M-n>", "<cmd>noh<CR>", desc = "Turn off search highlighting" },
    { "<M-o>", "<cmd>call CurtineIncSw()<CR>", desc = "Toggle between .cc/.h files" },
    { "<M-p>", "p=']", desc = "Paste and fix indentation" },
    { "<M-q>", "<cmd>QFix<CR>", desc = "Open quickfix window" },
    { "<M-r>", "<C-^>", desc = "Go to previous file" },
    { "<M-v>", "<cmd>Vista!!<CR>", desc = "Toggle Vista" },
    { "<M-w>", "<cmd>cp<CR>", desc = "Go to previous error in quickfix list" },
    { "<leader>E", ':e <C-R>=expand("%:p:h") . "/"<CR>', desc = "Edit file in current buffer's directory", silent = false },
  }

wk.add(keys)
