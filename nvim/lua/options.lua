-- Per le funzioni set...=... in .vim
local set = vim.opt

-- On saving files
set.backup = false 
set.swapfile = false 
-- undoo save
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

-- Number line option
set.nu = true
set.relativenumber = true
set.number = true

-- Set the behavior of tab
set.tabstop = 4 
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true  --per avere solo spazi e non tab
    
-- Reload files changed outside nvim
set.autoread = true

--Set Encoding
set.encoding = "utf-8"

-- Search hilighting
set.hlsearch = false
set.incsearch = true

-- Error flash instead of sound
set.visualbell = true

-- Enable true color (optional)
set.termguicolors = true

--Scrolling setting
set.scrolloff = 5 --lascia sempre un offset di righe
--vim.signcolumn = true --Attivazione barra sinistra per gli errori e vari (magari non necessaio)

-- Setting backspace key like delite
--set.backspace = "indent", "eol", "start"

-- 

-- Autoindentation
set.autoindent = true

-- Set status line to visualize the modes
-- Hide insert, normal, visual status mode
set.showmode = false
set.showcmd = true 

-- Hilight matching parentesis..
set.showmatch = true

-- Status line visible
--set.laststatus = 2
--set.statusline = "%f"

-- clipboard initialization
--set.clipboard += "unnamedplus"

-- Enable standard hilighting of text
vim.syntax = "on"

-- Folding method
vim.foldmethod = "indent"
vim.foldnestmax = 1
vim.foldlevelstart = 1

-- Set scrool number line
vim.scrolloff = 2

---- Standard setup ----

-- Set Python directory
-- analogo ad let g:... = /...
vim.g['python3_host_prog'] = "/usr/bin/python3"

--Deactivate perl provider
vim.g['loaded_perl_provider'] = 0
--Deactivate ruby provider
vim.g['loaded_ruby_provider'] = 0

-- Terminal choose
vim.cmd[[ 
  let term_program=$TERM_PROGRAM
]]


