
local M = {
  'stevearc/conform.nvim',
  cmd = { 'ConformInfo' },
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    formatters = {
      pyformat = {
        command = '/usr/bin/pyformat',
      },
      ktfmt = {
        command = '/google/bin/releases/kotlin-google-eng/ktfmt/ktfmt',
      },
    },
    formatters_by_ft = {
      python = { 'pyformat' },
      kotlin = { 'ktfmt' },
    },
    default_format_opts = {
      lsp_format = 'fallback',
    },
    format_on_save = { timeout_ms = 3000, lsp_format = 'fallback', },
  },
}

return M
