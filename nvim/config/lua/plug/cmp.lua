-- Set up for cmp Completion
local cmp = require('cmp')

--local compare = require('cmp.config.compare')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
        completion = {
            border='rounded',
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpNormal",
        },
        documentation = {
            border='rounded',
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpNormal",
        }
    },

    
    -- CORRECTED SOURCES CONFIGURATION
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        --{ name = 'cmp_ai' },
        { name = 'render-markdown' },
        { name = 'parrot' },
        { name = 'buffer', keyword_length=5 }, -- Combined into one table
    }),


    mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-n>'] = cmp.mapping.confirm({ select = true }),
        --[[['<C-x>'] = cmp.mapping.complete({
            config = {
                sources = cmp.config.sources({
                    { name = 'cmp_ai' },
                }),
            },
        }),]]--
    }),

    
    -- To set the cmp-ai at the top
    --[[sorting = {
        priority_weight = 2,
        comparators = {
            require('cmp_ai.compare'),
            compare.offset,
            compare.exact,
            compare.score,
            compare.recently_used,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
        },
    },]]--

    --[[
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format('%s', vim_item.kind)
            -- Show signature in the menu
            vim_item.menu = ({
                nvim_lsp = '[LSP]',
                buffer = '[Buffer]',
                vsnip = '[Snippet]',
            })[entry.source.name]

            -- The 'detail' field we implemented in the LSP will be automatically
            -- shown by nvim-cmp next to the completion item.
            return vim_item
        end,
    },]]--

})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' },
    }, {
        { name = 'buffer' },
    })
})
require("cmp_git").setup()  ]]--

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline({
    }),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline({
    }),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})



--[[
This is done in the lsp config file 
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    capabilities = capabilities
}
--]]
