-- Setup language servers.

-- For html lsp --
--Enable (broadcasting) snippet capability for completion (for html lsp)
local lsp_capabilities_html = vim.lsp.protocol.make_client_capabilities()
lsp_capabilities_html.textDocument.completion.completionItem.snippetSupport = true

--Attach nvim-cmp to lsp derver fitures
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')
-- For each of this install the relative package on linux
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md 
-- Clangd c/c++/c# (external file configuration) --
lspconfig.clangd.setup({
    capabilities = lsp_capabilities,
})
-- Rust --
lspconfig.rust_analyzer.setup({
    capabilities = lsp_capabilities,
})
-- LaTex --
lspconfig.ltex.setup({
    capabilities = lsp_capabilities,
    settings = {
        ltex = {
            language = "it,en"
        }
    },
    on_attach = on_attach, 
})
-- Bash --
lspconfig.bashls.setup({
    capabilities = lsp_capabilities,
})
-- cmake --
lspconfig.cmake.setup({
    capabilities = lsp_capabilities,
})
-- Openscad --
lspconfig.openscad_lsp.setup({          
    capabilities = lsp_capabilities,
})
-- Arduino --
lspconfig.arduino_language_server.setup({
    capabilities = lsp_capabilities,
})
-- Assembly --
lspconfig.asm_lsp.setup({
    capabilities = lsp_capabilities,
})
-- Python --
lspconfig.pyright.setup({
    capabilities = lsp_capabilities,
})
-- Html/Css/Javascript --
lspconfig.html.setup({
    capabilities = lsp_capabilities_html,
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html", "templ" },
    init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true
        },
        provideFormatter = true
    }
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        --vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

