do  -- Settings.
  -- Required by hrsh7th/nvim-compe.
  vim.o.completeopt = 'menuone,noinsert'

  -- Incremental live completion.
  vim.o.inccommand = 'nosplit'

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

  -- TODO(pieps): Showmarks?
  -- TODO(pieps): AutoPairs? Or does treesitter-textobjects handle that?
end

-- TODO(neovim/neovim#12378): Migrate this to native lua when autocmds work.
vim.cmd('source ~/.vim/functions.vim')

do  -- Pre-plugin
  -- sainnhe/sonokai
  vim.g.sonokai_style = 'andromeda'

  -- Airline config.
  vim.g.airline_powerline_fonts = 1
  vim.g['airline#extensions#ale#enabled'] = 1
  vim.g['airline#extensions#bufferline#enabled'] = 1
  vim.g['airline#extensions#fugitiveline#enabled'] = 1
  vim.g['airline#extensions#tabline#enabled'] = 1
  vim.g['airline#extensions#tabline#formatter'] = 'unique_tail_improved'
  vim.g['airline#extensions#whitespace#enabled'] = 1
  vim.g.webdevicons_enable_airline_tabline = 1
  vim.g.webdevicons_enable_airline_statusline = 1

  -- ryanoasis/vim-devicons
  -- Use ferris, not the Rust logo.
  vim.g.WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {
    rs = '',
    rlib = ''
  }
end

-- Plugins.
require('neo.plugins')

vim.cmd[[colorscheme sonokai]]

do  -- Compe for autocompletion.
  require("compe").setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
      path = true;
      nvim_lsp = true;
      utlisnips = true
    };
  }

  vim.g.lexima_no_default_rules = true
  vim.call("lexima#set_default_rules")
  vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {expr = true})
  vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm(lexima#expand('<LT>CR>', 'i'))", {expr = true})
  vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {expr = true})

  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
      return true
    else
      return false
    end
  end
  -- Use (s-)tab to:
  --- move to prev/next item in completion menuone
  --- jump to prev/next snippet's placeholder
  _G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-n>"
    elseif check_back_space() then
      return t "<Tab>"
    else
      return vim.fn['compe#complete']()
    end
  end
  _G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-p>"
    else
      return t "<S-Tab>"
    end
  end
  vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
end


do  -- lspconfig
  local nvim_lsp = require("lspconfig")

  --- auto-commands
  vim.cmd 'au BufWritePre *.rs,*.c,*.ts lua vim.lsp.buf.formatting_sync()'

  local on_attach = function(_client, bufnr)
    -- LSP bindings
     local opts = { noremap=true, silent=true }
     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  end

  -- Enable the following language servers
  nvim_lsp.clangd.setup { on_attach = on_attach }
  nvim_lsp.tsserver.setup { on_attach = on_attach }

  local opts = {
    server = { cmd = {'rustup', 'run', 'nightly', 'rust-analyzer'}, on_attach = on_attach } -- rust-analyer options
  }
  require('rust-tools').setup(opts)
end

do  -- Vista.vim
  vim.g.vista_default_executive = 'nvim_lsp'
end

do  -- Keybindings.
  local function map(lhs, rhs, mode, expr)    -- wait for lua keymaps: neovim/neovim#13823
    mode = mode or 'n'
    if mode == 'n' then rhs = '<cmd>' .. rhs .. '<cr>' end
    vim.api.nvim_set_keymap(mode, lhs, rhs, {noremap=true, silent=true, expr=expr})
  end

  map('<C-n>', 'tabnew')
  map("'", '`', '')
  map('`', "'", '')
  map('<C-e>', '3<C-e>', '')
  map('<C-y>', '3<C-y>', '')

  --map('<C-p>', 'FZF')
  map('<C-p>', 'lua require("telescope.builtin").find_files()')
  --map('<M-b>', 'Buffers')
  map('<M-b>', 'lua require("telescope.builtin").buffers()')

  vim.cmd "au FileType java nnoremap <Leader>t :call ToggleTestJava(0)<CR>"
  vim.cmd "au FileType java nnoremap <Leader>T :call ToggleTestJava(1)<CR>"

  if vim.fn.has('unix') then
    vim.api.nvim_set_keymap('n', '<Leader>e', ':e <C-R>=expand("%:p:h") . "/"<CR>', {noremap=true})
  else
    vim.api.nvim_set_keymap('n', '<Leader>e', ':e <C-R>=expand("%:p:h") . "\\"<CR>', {noremap=true})
  end

  map('<M-h>', '<C-w>h', '')
  map('<M-j>', '<C-w>j', '')
  map('<M-k>', '<C-w>k', '')
  map('<M-l>', '<C-w>l', '')

  map('<M-S-h>', '<C-w>H', '')
  map('<M-S-j>', '<C-w>J', '')
  map('<M-S-k>', '<C-w>K', '')
  map('<M-S-l>', '<C-w>L', '')

  map('<M-f>', 'Ex')
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
