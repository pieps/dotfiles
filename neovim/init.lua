do -- Settings.
  -- Required by hrsh7th/nvim-cmp.
  vim.o.completeopt = 'menu,menuone,noselect'

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
end

-- TODO(neovim/neovim#12378): Migrate this to native lua when autocmds work.
vim.cmd('source ~/.vim/functions.vim')

do -- Pre-plugin
  -- sainnhe/sonokai
  vim.g.sonokai_style = 'andromeda'

  -- Airline config.
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

  -- ryanoasis/vim-devicons
  -- Use ferris, not the Rust logo.
  vim.g.WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {
    rs = '',
    rlib = ''
  }

  -- Neo-tree: remove the deprecated commands from v1.x.
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
end

-- Plugins.
require('neo.plugins')

vim.cmd [[colorscheme sonokai]]

do -- nvim-cmp for autocompletion.
  -- Setup nvim-cmp.
  local cmp = require('cmp')
  local types = require('cmp.types')
  local str = require('cmp.utils.str')
  local lspkind = require('lspkind')
  local luasnip = require('luasnip')

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
  end

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.mapping.confirm({ select = false }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { 'i', 's' }),

      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    }),
    formatting = {
      format = lspkind.cmp_format({
        with_text = false, -- do not show text alongside icons
        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        before = function(entry, vim_item)
          local word = entry:get_insert_text()
          if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
            word = vim.lsp.util.parse_snippet(word)
          end
          word = str.oneline(word)
          if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
            word = word .. '~'
          end
          vim_item.abbr = word
          return vim_item
        end
      })
    }
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
end

do -- lspconfig
  local nvim_lsp = require('lspconfig')
  pcall(require, 'neo.custom_lsp')

  --- auto-commands
  vim.cmd 'au BufWritePre *.cc,*.h,*.lua,*.rs,*.c,*.ts,*.borg,*BUILD,*.java lua vim.lsp.buf.formatting_sync()'

  local on_attach = function(_client, bufnr)
    if vim.lsp.formatexpr then -- Neovim v0.6.0+ only.
      vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr')
    end
    if vim.lsp.tagfunc then -- Neovim v0.6.0+ only.
      -- Tag functionality via LSP. See `:help tag-commands`. Use <c-]> to
      -- go-to-definition.
      vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
    end

    -- LSP bindings
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl',
      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>j', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>k', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)

    vim.api.nvim_command('augroup LSP')
    vim.api.nvim_command('autocmd!')
    if _client.resolved_capabilities.document_highlight then
      vim.api.nvim_command('autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()')
      vim.api.nvim_command('autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()')
      vim.api.nvim_command('autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()')
    end
    vim.api.nvim_command('augroup END')
  end

  -- Update LSP capabilities with nvim-cmp's/cmp-nvim-lsp's.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  -- Enable the following language servers
  nvim_lsp.clangd.setup { on_attach = on_attach, capabilities = capabilities }

  nvim_lsp.tsserver.setup { on_attach = on_attach, capabilities = capabilities }

  local opts = {
    server = { cmd = { 'rustup', 'run', 'nightly', 'rust-analyzer' }, on_attach = on_attach, capabilities = capabilities } -- rust-analyer options
  }
  require('rust-tools').setup(opts)

  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, 'lua/?.lua')
  table.insert(runtime_path, 'lua/?/init.lua')

  nvim_lsp.sumneko_lua.setup {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file('', true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  }

  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
  vim.diagnostic.config({
    update_in_insert = true,
  })
end

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

  map('<M-f>', 'Neotree toggle reveal')
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
