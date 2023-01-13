local wk = require('which-key')

local M = {}

function M.setup(_client, buffer)
  local keymap = {
    buffer = buffer,
    ['<leader>'] = {
      ['D'] = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type Definition' },
      c = {
        a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action' },
      },
      e = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Open Float' },
      j = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Next Diagnostic' },
      k = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Prev Diagnostic' },
      q = { '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', 'Add to Loclist' },
      r = {
        n = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename Symbol' },
      },
      w = {
        name = '+workspace',
        a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'Add Workspace Folder' },
        r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'Remove Workspace Folder' },
        l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'List Workspace Folders' },
      },
    },
    ['<C-k>'] = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature Help', mode = { 'n', 'i' } },
    ['['] = {
      d = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Prev Diagnostic.' },
    },
    [']'] = {
      d = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Next Diagnostic.' },
    },
    ['K'] = { '<Cmd>lua vim.lsp.buf.hover()<CR>', 'Hover' },
    g = {
      name = '+goto',
      ['0'] = { '<cmd>lua vim.lsp.buf.document_symbol()<CR>', 'List Symbols in Buffer' },
      ['D'] = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Goto Declaration' },
      ['W'] = { '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', 'List Symbols in Workspace' },
      d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Goto Definition' },
      i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Goto Implementation' },
      r = { '<cmd>lua vim.lsp.buf.references()<CR>', 'Goto References' },
      t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Goto Type Definition' },
    },
  }

  wk.register(keymap)
end

return M
