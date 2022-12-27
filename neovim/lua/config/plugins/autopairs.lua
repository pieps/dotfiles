local util = require('config.util')

local M = {
  util.gh('windwp/nvim-autopairs'),
  dependencies = {
    util.gh('hrsh7th/nvim-cmp'),
  },
  event = 'BufRead',
}

function M.config()
  require('nvim-autopairs').setup({ check_ts = true })

  -- If you want insert `(` after select function or method item
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp = require('cmp')
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
end

return M
