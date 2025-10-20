----------------------------------------------------------
--                                                      --
--  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  --
--  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  --
--  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  --
--  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  --
--  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  --
--  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  --
--                                                      --
----------------------------------------------------------

require('options')
require('keymap')

local vim = vim
local Plug = vim.fn['plug#']

------------- Vim-Plug -------------
-- https://github.com/junegunn/vim-plug
-- Specify a directory for plugins
-- - For Neovim: ~/.local/share/nvim/plugged
-- - Avoid using standard Vim directory names like 'plugin'
vim.call('plug#begin', '~/.local/share/nvim/plugged')
-- Install with `:PlugInstall`


-- for ollama
Plug 'frankroeder/parrot.nvim'

Plug 'ibhagwan/fzf-lua'
--Plug('saghen/blink.cmp' , { ["do"] = '/home/davide/.cargo/bin/cargo +nightly build --release' } )

-- For AI
Plug 'marcinjahn/gemini-cli.nvim'

-- Nvim cheatsheet
Plug 'sudormrfbin/cheatsheet.nvim'


-- startup page
Plug 'mhinz/vim-startify'

-- Lualine 
Plug 'nvim-lualine/lualine.nvim'
-- If you want to have icons in your statusline
Plug 'nvim-tree/nvim-web-devicons'  -- :NvimWebDeviconsHiTest   to see all the icons
--Plug 'itchyny/lightline.vim' --(alternative)
--Plug 'feline-nvim/feline.nvim' --(alternative)

-- https://github.com/tpope/vim-commentary
-- For automatic commenting of line or paragraph
Plug 'tpope/vim-commentary'

-- Per virgolette ecc.. automatiche
--Plug 'tpope/vim-surround'

-- For see last change in git repository 
Plug 'APZelos/blamer.nvim'

-- Some colorscheme
Plug('catppuccin/nvim', { ["as"] = 'catppuccin' }) --(optional)
Plug 'fenetikm/falcon' --(optional)
Plug 'morhetz/gruvbox'

-- Planetary general library for telescope...
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'  --for extra winow managment
Plug 'nvim-pack/nvim-spectre' --for search replace all code
-- Telescope plugin
Plug('nvim-telescope/telescope.nvim', { ["tag"] = '0.1.8' })

-- Media preview Telescope supporting
Plug 'nvim-telescope/telescope-media-files.nvim' -- Need: Chafa
-- For Telescope gen (AI assistant)
Plug 'nvim-telescope/telescope-ui-select.nvim'

-- Hilighting of different programming linguage
Plug('nvim-treesitter/nvim-treesitter', { ["do"] = ':TSUpdate'})

-- Undoo tree
Plug 'mbbill/undotree'

-- Lsp Config (for code autocompletion)
Plug 'neovim/nvim-lspconfig'

-- Autocompletion window visualizer plugin 
--Plug 'tzachar/cmp-ai' -- For ai autocomp
Plug 'hrsh7th/cmp-nvim-lsp' -- Completion for lsp 
Plug 'hrsh7th/cmp-buffer'   -- For buffers 
Plug 'hrsh7th/cmp-path'     -- For path
Plug 'hrsh7th/cmp-cmdline'  -- For command line 
Plug 'hrsh7th/nvim-cmp'     
-- Autocompletion extension for vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
-- For custom snippets
Plug 'hrsh7th/vim-vsnip-integ'

-- Latex preview 
Plug 'lervag/vimtex'

-- markdown preview (install nodejs and yarn)
Plug('iamcco/markdown-preview.nvim', { ["do"] = 'cd app && npx --yes yarn install' })
-- headlines markdowns
--Plug 'MeanderingProgrammer/markdown.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim' --new
-- Old:
--Plug 'lukas-reineke/headlines.nvim'

-- Markdown tables formatting
--Plug 'Kicamon/markdown-table-mode.nvim'
-- Obsidian link plugin
--Plug 'epwalsh/obsidian.nvim'

-- Git plugin (for managing commits, ecc...)
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
-- Git diff (for seeing git diif files ...)
Plug 'sindrets/diffview.nvim'

--Dap Debug adapter protocol ()
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'    --ui library
Plug 'rcarriga/nvim-dap-ui'     --ui library

-- Man pages
Plug 'paretje/nvim-man'

-- Openscad preview 
Plug 'salkin-mada/openscad.nvim'
Plug('junegunn/fzf', { ['do'] = '-> fzf#install()' })
Plug 'junegunn/fzf.vim'

-- AI ollama
--Plug 'David-Kunz/gen.nvim'

-- File explorer
Plug 'stevearc/oil.nvim'

-- UML language
Plug 'javiorfo/nvim-soil'
-- Optional for puml syntax highlighting:
Plug 'javiorfo/nvim-nyctophilia'

--Doxygen documentation (install doxygen separatly)
Plug 'hat0uma/prelive.nvim'
Plug 'hat0uma/doxygen-previewer.nvim'
--automatic dxygen documentation creation
-- Plug( 'kkoomen/vim-doge', { ["do"] = { 'call doge#install()' } })
Plug 'kkoomen/vim-doge'     -- after execute manually :call doge#install() in nvim 

-- GLSL viewer
Plug( 'timtro/glslView-nvim', { ["ft"] = 'glsl'})

--Some colosrcheme
Plug 'rebelot/kanagawa.nvim'
Plug 'navarasu/onedark.nvim'

--For markdown image render
--Plug 'edluffy/hologram.nvim'
Plug '3rd/diagram.nvim'
Plug '3rd/image.nvim'


Plug 'olimorris/codecompanion.nvim'

-- Lean
Plug 'Julian/lean.nvim'

--Lightbulb for floating emji
Plug 'kosayoda/nvim-lightbulb'

Plug 'Kicamon/markdown-table-mode.nvim'
-- To use jupiter notebook python
--Plug('benlubas/molten-nvim', {["tag"] = 'v1.0.0', ["do"] = ':UpdateRemotePlugins'})

-- Strudel Music
Plug 'gruvw/strudel.nvim'

--for sql managing
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
-- API interfaces
-- Usage: ':DBUI'
Plug 'rest-nvim/rest.nvim'

-- For notification
Plug 'j-hui/fidget.nvim'    -- for http notifications



-- End plugin system
vim.call('plug#end')

-------- Configuration Files ----------


require("strudel").setup()

-- for sql managing
-- Set up your database connections
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_save_location = vim.fn.stdpath("config") .. "/db_ui"
-- The connection string for your 'davide' database
vim.g.dbs = {
  davide_db = 'postgres://davide@localhost:5432/davide',
  apraxy_db = 'postgres://davide@localhost:5432/apraxy_db'
}
-- for the http notifications
require("fidget").setup()
-- ADD THIS SNIPPET FOR REST.NVIM
-- Add luarocks packages to Neovim's package.path
-- This is the recommended way to fix the error you are seeing.
-- Add luarocks paths for both Lua and C modules
local function setup_luarocks_path()
  -- For Lua modules (.lua)
  local lua_path = vim.fn.system("luarocks path --lr-path"):gsub("\n", "")
  package.path = package.path .. ';' .. lua_path

  -- For C modules (.so, .dll)
  local c_path = vim.fn.system("luarocks path --lr-cpath"):gsub("\n", "")
  package.cpath = package.cpath .. ';' .. c_path
end

setup_luarocks_path()

-- Create a dedicated augroup for these formatters
local augroup = vim.api.nvim_create_augroup("RestNvimFormatters", { clear = true })
---- Use jq to format JSON files
--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "json",
--  command = "setlocal formatprg=jq",
--  group = augroup,
--})
-- Use prettier to format HTML files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  command = "setlocal formatprg=prettier --parser html",
  group = augroup,
})
------------------------------------------



-- Oil file manager coniguration file 
require('plug.oil')

-- AI gen configuration file 
--require('plug.gen')

-- openscad configuration file 
require('openscad')     -- Necessary for some reason
require('plug.openscad')

-- vimtex configuration file (For latex)
require('plug.vimtex')

-- Telescope configuration file
require('plug.telescope')

-- Soil configuration file (for UML Diagrams)
require('plug.soil')

-- Gitsigns configuration (for git stauus)
require('plug.gitsigns')

-- Lualine setup 
require('plug.lualine')


-- Completion configuration file
--require('plug.cmp-ai')
require('plug.cmp')

-- DAP debug protocol configuration file
require('plug.dap')
require("dapui").setup()    --ui setup

-- Vsnip Configuration file
require('plug.vsnip')
-- let g:vsnip_snippet_dir = "/home/davide/.config/nvim/snippets/" "directory for snippets

-- Clangd configuration file 
require('plug.clangd')

vim.filetype.add({
  extension = {
    ap = "apate",
  },
})
-- Custom Apate LSP
-- Add your custom LSP plugin to runtimepath
--   vim.opt.runtimepath:append(vim.fn.expand('/home/davide/Code/ApateCompiler/nvim-ap-lsp'))
-- Custom Apate lsp config
--  require('apateConfigLsp')
-- The setup
--  require('lspconfig').apate_lsp.setup({
--      capabilities = require('cmp_nvim_lsp').default_capabilities(),
--  })

-- Lsp Server configuration file (in più oltre a quello sotto)
require('plug.lsp')

-- Add your custom parser config to the runtime path
vim.opt.runtimepath:append(vim.fn.expand("/home/davide/Code/ApateCompiler/nvim-ap-tree-sitter"))

require('apateConfigTS')
--treesetter
require('plug.treesitter')

------------------------------------------


-- Markdowns configuration file 
--require('plug.headlines') -- old:
--require('plug.obsidian')
require('plug.render-markdown')
require('plug.markdown-preview')

-- Doxygen setup
require('plug.doxygen')

--require('hologram').setup{
--    auto_display = false -- WIP automatic markdown image display, may be prone to breaking
--}

--for image live preview 
require('plug.image')

-- GLSL viewer
require('glslView').setup {
  viewer_path = 'glslViewer',
  args = { '-l' },
}

require('plug.diagram-uml')


-- Parrot for ollama
require('plug.parrot')


require("plug.codecompanion_config")

-- Lean
require("plug.lean")

-- Lightbulb
require("nvim-lightbulb").setup({
  autocmd = { enabled = true }
})

-- Markdown table formatting
require('markdown-table-mode').setup({})

-- Fidget, background
require("fidget").setup({
  window = {
      normal_hl = "Comment",      -- Base highlight group in the notification window
      winblend = 0,             -- Background color opacity in the notification window
      border = "none",            -- Border around the notification window
      zindex = 45,                -- Stacking priority of the notification window
      max_width = 0,              -- Maximum width of the notification window
      max_height = 0,             -- Maximum height of the notification window
      x_padding = 1,              -- Padding from right edge of window boundary
      y_padding = 0,              -- Padding from bottom edge of window boundary
      align = "bottom",           -- How to align the notification window
      relative = "editor",        -- What the notification window position is relative to
      tabstop = 8,                -- Width of each tab character in the notification window
      avoid = {}                  -- Filetypes the notification window should avoid
                                  -- e.g., { "aerial", "NvimTree", "neotest-summary" }
    },
  -- ... altre tue opzioni
})

require('onedark').setup({
    -- Main options --
    style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = true,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Lualine options --
    lualine = {
        transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {
    }, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = false,    -- use background color for virtual text
    },
})
require('onedark').load()

-- After plugins 
--vim.cmd [[colorscheme onedark]]   
--catppuccin-frappe   
--gruvbox 
--habamax 
--kanagawa-dragon
--vim.cmd [[set background=dark]]    -- Setting dark mode




-- Remove background in window
-- Add new if necessary

vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalFloat guibg=NONE ctermbg=NONE
  hi FloatBorder guibg=NONE ctermbg=NONE
  hi FloatShadow guibg=NONE ctermbg=NONE
  
  hi Comment guibg=NONE ctermbg=NONE 
  hi NormalNC guibg=NONE ctermbg=NONE 
  hi Constant guibg=NONE ctermbg=NONE 
  hi Special guibg=NONE ctermbg=NONE 
  hi Identifier guibg=NONE ctermbg=NONE 
  hi Statement guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE 
  hi ColorColumn guibg=NONE ctermfg=NONE 

  hi Pmenu guibg=NONE ctermbg=NONE
  hi PmenuBorder guibg=NONE ctermbg=NONE
  hi FidgetNormal guibg=NONE ctermbg=NONE
]]

