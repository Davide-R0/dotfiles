-- Setup language servers.


--Enable (broadcasting) snippet capability for completion (for html lsp)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

--Attach nvim-cmp to lsp derver fitures
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')
-- Per ogniuno di questi installare il relativo pacchetto su linux
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
lspconfig.pyright.setup({
  capabilities = lsp_capabilities,
})    -- Python 
lspconfig.clangd.setup({
  capabilities = lsp_capabilities,
})       -- c/c#/c++
lspconfig.html.setup({
  capabilities = lsp_capabilities,
})        -- html
lspconfig.openscad_lsp.setup({
  capabilities = lsp_capabilities,
})        -- openscad
lspconfig.rust_analyzer.setup({
    --capabilities = lsp_capabilities,
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})        -- rust

lspconfig.ltex.setup({
  capabilities = lsp_capabilities,
  --lang = { "it" },  
 settings = {
    ltex = {
      -- language = "en"
      language = "it,en"
    }
  },
  on_attach = on_attach, 

  --ltex = {
  --  dictionary = {
  --          ["it-IT"] = words,
  --      },
    --disabledRules = { ['en-US'] = { 'PROFANITY', 'MORFOLOGIK_RULE_EN_US' } },
      --disabledRules = {["it"]    = { "MORFOLOGIK_RULE_IT_IT" },},
  --  },
})      -- LaTex
lspconfig.bashls.setup({
  capabilities = lsp_capabilities,
})       -- Bash
lspconfig.tsserver.setup({
  capabilities = lsp_capabilities,
})     -- JavaScript o TypeScript

lspconfig.fortls.setup({
    --cmd = {"fortls"};
	 capabilities = lsp_capabilities,

    --filetypes = {"fortran"};
	--root_dir = lspconfig.util.root_pattern(".git",".fortls")
})     -- fortrain
lspconfig.asm_lsp.setup({
  capabilities = lsp_capabilities,
})     -- assembly

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
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
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

