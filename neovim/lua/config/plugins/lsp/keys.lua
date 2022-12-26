local wk = require('which-key')

local M = {}

function M.setup(client, buffer)
  local cap = client.server_capabilities

  local keymap = {
    buffer = buffer,
  }

  wk.register(keymap)
end

return M
