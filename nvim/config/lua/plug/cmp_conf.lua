-- Set up for nvim-cmp Completion
-- https://github.com/hrsh7th/nvim-cmp


local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#FF0000" })

local cmp = require'cmp'
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },

  window = {
    completion = { -- rounded border; thin-style scrollbar
      border='rounded',
    --border = 'shadow',
      winhighlight = "Normal:CmpNormal,FloatBorder:CmpNormal",
      --scrollbar = '║',
    },
    documentation = {
      border='rounded',
    --border = 'shadow',
      winhighlight = "Normal:CmpNormal,FloatBorder:CmpNormal",
      --scrollbar = '║',
    }
    --completion = cmp.config.window.bordered(),
    --documentation = cmp.config.window.bordered(),
  },


mapping = cmp.mapping.preset.insert({  
    ['<C-j>'] = cmp.mapping.select_next_item(),

    ['<C-k>'] = cmp.mapping.select_prev_item(),

 
    --['<C-b>'] = cmp.mapping.scroll_docs(-4),
    --['<C-f>'] = cmp.mapping.scroll_docs(4), --4
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-n>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer', keyword_lenght=3 },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

