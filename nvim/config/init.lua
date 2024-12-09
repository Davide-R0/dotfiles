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

-- startup page
Plug 'mhinz/vim-startify'
--Plug 'startup-nvim/startup.nvim'

-- Lualine 
Plug 'nvim-lualine/lualine.nvim'
-- If you want to have icons in your statusline
Plug 'nvim-tree/nvim-web-devicons'
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
Plug 'hrsh7th/cmp-nvim-lsp' -- Completion for lsp 
Plug 'hrsh7th/cmp-buffer'   -- For buffers 
Plug 'hrsh7th/cmp-path'     -- For path
Plug 'hrsh7th/cmp-cmdline'  -- For command line 
Plug 'hrsh7th/nvim-cmp'     
-- Autocompletion extension for vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

-- For custom snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

-- Latex preview 
Plug 'lervag/vimtex'

-- markdown preview (install nodejs and yarn)
Plug('iamcco/markdown-preview.nvim', { ["do"] = 'cd app && npx --yes yarn install' })
-- headlines markdowns
Plug 'MeanderingProgrammer/markdown.nvim'
Plug 'lukas-reineke/headlines.nvim'
-- Markdown tables formatting
Plug 'Kicamon/markdown-table-mode.nvim'
-- Obsidian link plugin
Plug 'epwalsh/obsidian.nvim'

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

-- AI ollama
Plug 'David-Kunz/gen.nvim'

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

-- End plugin system
vim.call('plug#end')


-------- Configuration Files ----------

--treesetter
require('plug.treesitter')

-- Oil file manager coniguration file 
require('plug.oil')

-- AI gen configuration file 
require('plug.gen')

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

-- Lsp Server configuration file (in più oltre a quello sotto)
require('plug.lsp')

-- Completion configuration file
require('plug.cmp')

-- DAP debug protocol configuration file
require('plug.dap')
require("dapui").setup()    --ui setup

-- Vsnip Configuration file
require('plug.vsnip')
-- let g:vsnip_snippet_dir = "/home/davide/.config/nvim/snippets/" "directory for snippets

-- Clangd configuration file 
require('plug.clangd')

-- Markdowns configuration file 
require('plug.headlines')
require('plug.obsidian')
-- Markdown table setup
require('markdown-table-mode').setup()

-- Doxygen setup
require('plug.doxygen')

-- GLSL viewer
require('glslView').setup {
  viewer_path = 'glslViewer',
  args = { '-l' },
}

-- After plugins 
vim.cmd [[colorscheme gruvbox]]
vim.cmd [[set background=dark]]    -- Setting dark mode

-- Show character column
vim.cmd [[hi ColorColumn cterm=none gui=none guibg=white ctermfg=white]]

-- Remove background in window
vim.cmd [[
hi Normal guibg=NONE ctermbg=NONE
hi NormalFloat guibg=NONE ctermbg=NONE
hi FloatBorder guibg=NONE ctermbg=NONE
]]

