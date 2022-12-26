local M = {
  'neovim/nvim-lspconfig',
--  event = 'BufWritePre',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  }
}

function M.config()
  local nvim_lsp = require('lspconfig')
  pcall(require, 'neo.custom_lsp')

  --- auto-commands
  vim.cmd 'au BufWritePre *.cc,*.h,*.lua,*.rs,*.c,*.ts,*.borg,*BUILD,*.java lua vim.lsp.buf.format()'

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
    if _client.server_capabilities.document_highlight then
      vim.api.nvim_command('autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()')
      vim.api.nvim_command('autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()')
      vim.api.nvim_command('autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()')
    end
    vim.api.nvim_command('augroup END')
  end

  -- Update LSP capabilities with nvim-cmp's/cmp-nvim-lsp's.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

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

return M
