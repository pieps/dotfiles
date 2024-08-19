local util = require('config.util')

local M = {
  util.gh('hrsh7th/nvim-cmp'),
  dependencies = {
    util.gh('hrsh7th/cmp-nvim-lsp'),
    util.gh('hrsh7th/cmp-buffer'),
    util.gh('hrsh7th/cmp-path'),
    util.gh('hrsh7th/cmp-cmdline'),
    util.gh('hrsh7th/cmp-nvim-lsp-signature-help'),
    util.gh('onsails/lspkind-nvim'),
  },
}

function M.config()
  -- Required by hrsh7th/nvim-cmp.
  vim.o.completeopt = 'menu,menuone,noselect'

  -- Incremental live completion.
  vim.o.inccommand = 'nosplit'

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

  local loaded, custom_cmp = pcall(require, 'neo.custom_cmp')
  local custom_sources = {}
  if loaded then
    custom_sources = custom_cmp
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
    }, custom_sources, {
      { name = 'buffer' },
    }),
    formatting = {
      format = lspkind.cmp_format({
        with_text = false, -- do not show text alongside icons
        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        before = function(entry, vim_item)
          local word = entry:get_insert_text()
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

return M
