local wk = require('which-key')

local M = {}

function M.setup(_client, buffer)
  local keymap = {
    buffer = buffer,
    { '<leader>D',  '<cmd>lua vim.lsp.buf.type_definition()<CR>', desc = 'Type Definition' },
    { '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', desc = 'Code Action' },
    { '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', desc = 'Open Float' },
    { '<leader>j', '<cmd>lua vim.diagnostic.goto_next()<CR>', desc = 'Next Diagnostic' },
    { '<leader>k', '<cmd>lua vim.diagnostic.goto_prev()<CR>', desc = 'Prev Diagnostic' },
    { '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', desc = 'Add to Loclist' },
    { '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', desc = 'Rename Symbol' },
    { 
      name = '+workspace',
      { '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', desc = 'Add Workspace Folder' },
      { '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', desc = 'Remove Workspace Folder' },
      { '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', desc = 'List Workspace Folders' },
    },
    { '<C-k>',  '<cmd>lua vim.lsp.buf.signature_help()<CR>', desc = 'Signature Help', mode = { 'n', 'i' } },
      { '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', desc = 'Prev Diagnostic.' },
      { ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', desc = 'Next Diagnostic.' },
    { 'K',  '<Cmd>lua vim.lsp.buf.hover()<CR>', desc = 'Hover' },
    { 
      name = '+goto',
      { 'g0',  '<cmd>lua vim.lsp.buf.document_symbol()<CR>', desc = 'List Symbols in Buffer' },
      { 'gD',  '<cmd>lua vim.lsp.buf.declaration()<CR>', desc = 'Goto Declaration' },
      { 'gW',  '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', desc = 'List Symbols in Workspace' },
      { 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', desc = 'Goto Definition' },
      { 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', desc = 'Goto Implementation' },
      { 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', desc = 'Goto References' },
      { 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', desc = 'Goto Type Definition' },
    },
  }

  wk.add(keymap)
end

return M
