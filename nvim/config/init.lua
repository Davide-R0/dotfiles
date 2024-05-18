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

--filetype plugin indent on 
vim.cmd [[set clipboard+=unnamedplus]]
--set signcolumn=auto:1

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

-- Powerline https://github.com/itchyny/lightline.vim
--Plug 'itchyny/lightline.vim'
--Plug 'feline-nvim/feline.nvim' --(alternative)
Plug 'nvim-lualine/lualine.nvim'
-- If you want to have icons in your statusline
Plug 'nvim-tree/nvim-web-devicons'

-- Icons
Plug 'ryanoasis/vim-devicons'

-- Tab line
--Plug 'romgrk/barbar.nvim'

-- https://github.com/tpope/vim-commentary
-- For automatic commenting of line or paragraph
Plug 'tpope/vim-commentary'

-- https://github.com/tpope/vim-surround
-- Per virgolette ecc.. automatiche
--Plug 'tpope/vim-surround'

-- https://github.com/tpope/vim-vinegar
-- For more option in Netrw envoirement
--Plug 'tpope/vim-vinegar'

-- https://github.com/APZelos/blamer.nvim
-- For see last change in git repository 
Plug 'APZelos/blamer.nvim'

-- Some colorscheme
Plug('catppuccin/nvim', { ["as"] = 'catppuccin' }) --(optional)
Plug 'fenetikm/falcon' --(optional)
Plug 'morhetz/gruvbox'

-- https://github.com/nvim-telescope/telescope.nvim
-- Telescope plugin
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { ["tag"] = '0.1.6' })
Plug 'nvim-lua/popup.nvim'
-- Media preview supporting
Plug 'nvim-telescope/telescope-media-files.nvim' -- Need: Chafa
-- For Telescope gen (AI assistant)
Plug 'nvim-telescope/telescope-ui-select.nvim'

-- https://github.com/nvim-treesitter/nvim-treesitter
-- Hilighting of different programming linguage
Plug('nvim-treesitter/nvim-treesitter', { ["do"] = ':TSUpdate'})

-- https://github.com/hrsh7th/vim-vsnip
-- For snippets: vsnip 
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

-- Undoo tree
Plug 'mbbill/undotree'

-- https://github.com/hrsh7th/nvim-cmp
-- Completion and lsp Plugin
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'
-- For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

-- Latex preview 
Plug 'lervag/vimtex'
--Plug 'jakewvincent/texmagic.nvim'

-- markdown preview (install nodejs and yarn)
Plug('iamcco/markdown-preview.nvim', { ["do"] = 'cd app && npx --yes yarn install' })
-- headlines markdowns
Plug 'MeanderingProgrammer/markdown.nvim'
Plug 'lukas-reineke/headlines.nvim'
-- Obsidian link plugin
Plug 'epwalsh/obsidian.nvim'

-- Git plugin
Plug 'lewis6991/gitsigns.nvim'
-- Git diff
Plug 'sindrets/diffview.nvim'

-- openscad preview 
Plug 'salkin-mada/openscad.nvim'

-- AI ollama
Plug 'David-Kunz/gen.nvim'

-- File explorer
Plug 'stevearc/oil.nvim'

-- UML language
Plug 'javiorfo/nvim-soil'
-- Optional for puml syntax highlighting:
Plug 'javiorfo/nvim-nyctophilia'

-- End plugin system
vim.call('plug#end')


-------- Configuration Files ----------

-- Sturtup page 
--require('plug.startup')

-- Oil file manager coniguration file 
require('plug.oil')

-- AI gen configuration file 
require('plug.gen')

-- openscad configuration file 
require('openscad')     -- Necessary for some reason
require('plug.openscad')

-- vimtex configuration file
require('plug.vimtex')

-- Telescope configuration file
require('plug.telescope')

-- UML soil configuration file
require('plug.soil')

require('gitsigns').setup()
-- ????? set statusline+=%{get(b:,'gitsigns_status','')}

-- Lualine setup 
require('lualine').setup({options = { theme = 'gruvbox' }})
--lua require('barbar').setup({ auto_hide = 0 })

-- Lsp Server configuration file (in più oltre a quello sotto)
require('plug.lsp_conf')

-- Completion configuration file
require('plug.cmp_conf')

-- Vsnip Configuration file
require('plug.vsnip_conf')
-- ???? let g:vsnip_snippet_dir = "/home/davide/.config/nvim/snippets/" "directory for snippets

-- Clangd configuration file 
require('plug.clangd')

-- Markdowns configuration file 
-- lua require('plug.markdown')
require('plug.headlines')
require('plug.obsidian')
-- lua require('plug.undotree')

-- After plugins 
vim.cmd [[colorscheme gruvbox]]
vim.cmd [[set background=dark]]    -- Setting dark mode

-- Show character column
vim.cmd [[hi ColorColumn cterm=none gui=none guibg=white ctermfg=white]]

--let g:blamer_enabled = 1  
--  %a is the day of week, in case it's needed
--let g:blamer_date_format = '%e %b %Y'
--vim.cmd [[highlight Blamer guifg=darkorange]]


-- netrw config
--let g:netrw_liststyle = 3
--let g:netrw_browse_split = 3
--let g:netrw_winsize = 15
-- Automatic netrw bar open 
--augroup ProjectDrawer
--  autocmd!
--  autocmd VimEnter * :Vexplore
--augroup END
--let g:netrw_keepdir=0
-- For Vexplore
--nnoremap <leader><leader>f :Vexplore <cr>

-- Remove background in window
vim.cmd [[
hi Normal guibg=NONE ctermbg=NONE
hi NormalFloat guibg=NONE ctermbg=NONE
hi FloatBorder guibg=NONE ctermbg=NONE
]]

