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


--lspconfig.lua_ls.setup({
--  capabilities = lsp_capabilities,
--})         -- Lua (la parte aggiunta serve per scrivere plugin)
--[=====[ 
  on_init = function(client)
  local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end--]=====]


--lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  --settings = {
  --  ['rust-analyzer'] = {},
  --},
--}


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

--[=====[ 
vim.cmd[[
if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
]]
--]=====]
