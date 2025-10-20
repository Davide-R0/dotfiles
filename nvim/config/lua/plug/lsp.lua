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
--
vim.lsp.config('clangd', {
    capabilities = lsp_capabilities,
})
vim.lsp.enable('clangd')


-- Rust --
local rustup_sysroot_path = "/home/davide/.rustup/toolchains/stable-x86_64-unknown-linux-gnu"
vim.lsp.config('rust_analyzer', {
    --on_attach = on_attach,
    capabilities = lsp_capabilities,
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                sysroot = rustup_sysroot_path,
            }
        }
    }
})
vim.lsp.enable('rust_analyzer')

-- LaTex --
-- For the installation download the binary and place in an executable path: https://github.com/latex-lsp/texlab
vim.lsp.config('texlab', {
    settings = {
        texlab = {
            bibtexFormatter = "texlab",
            build = {
                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                executable = "latexmk",
                forwardSearchAfter = false,
                onSave = false
            },
            chktex = {
                onEdit = false,
                onOpenAndSave = false
            },
            diagnosticsDelay = 300,
            formatterLineLength = 80,
            forwardSearch = {
                args = {}
            },
            latexFormatter = "latexindent",
            latexindent = {
                modifyLineBreaks = false
            }
        }
    }
})
vim.lsp.enable('texlab')

-- Bash --
vim.lsp.config('bashls', {
    capabilities = lsp_capabilities,
})
vim.lsp.enable('bashls')

-- cmake --
vim.lsp.config('cmake', {
    capabilities = lsp_capabilities,
})
vim.lsp.enable('cmake')

-- Openscad --
vim.lsp.config('openscad_lsp', {          
    capabilities = lsp_capabilities,
})
vim.lsp.enable('openscad_lsp')

-- Arduino --
vim.lsp.config('arduino_language_server', {
    capabilities = lsp_capabilities,
})
vim.lsp.enable('arduino_language_server')

-- Assembly --
vim.lsp.config('asm_lsp', {
    capabilities = lsp_capabilities,
})
vim.lsp.enable('asm_lsp')

-- Python --
vim.lsp.config('pyright', {
    capabilities = lsp_capabilities,
})
vim.lsp.enable('pyright')

-- Html/Css/Javascript --
vim.lsp.config('html', {
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
vim.lsp.enable('html')

-- Typescript
vim.lsp.enable('ts_ls')

-- Markdown oxide
vim.lsp.config('markdown_oxide', { 
    capabilities = lsp_capabilities_html,
    -- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
    -- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
    --capabilities = vim.tbl_deep_extend('force', capabilities, {
    --    workspace = {
    --        didChangeWatchedFiles = {
    --            dynamicRegistration = true,
    --        },
    --    },
    --}),
    on_attach = on_attach
})
vim.lsp.enable('markdown_oxide')




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
        --vim.keymap.set('n', '<space>f', function()
            --    vim.lsp.buf.format { async = true }
            --end, opts)
        end,
    })
