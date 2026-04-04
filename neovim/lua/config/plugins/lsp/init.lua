local util = require('config.util')

local M = {
  util.gh('neovim/nvim-lspconfig'),
  event = 'BufReadPre',
  dependencies = {
    util.gh('hrsh7th/cmp-nvim-lsp'),
  }
}

function M.config()
  require('config.plugins.lsp.diagnostics').setup()

  --- auto-commands
  vim.cmd 'au BufWritePre *.cc,*.h,*.lua,*.rs,*.c,*.ts,*.borg,*BUILD,*.java lua vim.lsp.buf.format()'

  local on_attach = function(client, bufnr)
    require('config.plugins.lsp.keys').setup(client, bufnr)

    vim.api.nvim_command('augroup LSP')
    vim.api.nvim_command('autocmd!')
    if client.server_capabilities.document_highlight then
      vim.api.nvim_command('autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()')
      vim.api.nvim_command('autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()')
      vim.api.nvim_command('autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()')
    end
    vim.api.nvim_command('augroup END')
  end

  -- Update LSP capabilities with nvim-cmp's/cmp-nvim-lsp's.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  -- Enable the following language servers
  local loaded, custom_lsp = pcall(require, 'neo.custom_lsp')
  if loaded then
    custom_lsp.setup(on_attach, capabilities)
  else
    require('notify')("Couldn't load custom LSP!")
  end

  -- vim.lsp.config('clangd', { on_attach = on_attach, capabilities = capabilities })
  -- vim.lsp.enable('clangd')

  vim.lsp.config('tsserver', 
   { on_attach = on_attach, capabilities = capabilities })
  vim.lsp.enable('tsserver')


  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, 'lua/?.lua')
  table.insert(runtime_path, 'lua/?/init.lua')

  vim.lsp.config('lua_ls', {
    on_attach = on_attach,
    capabilities = capabilities,
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
          checkThirdParty = false,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
        format = {
          enable = true,
        },
      },
    },
  })
  vim.lsp.enable('lua_ls')
end

return M
