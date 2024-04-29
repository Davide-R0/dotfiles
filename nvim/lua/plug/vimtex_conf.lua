-- Setup vimtex previewer
-- https://github.com/lervag/vimtex
-- External installation: zathura, xdotool
-- Command: \ll start or stop compiling
--          \lc clear the file
--          \lv forward search in the pdf preview (also from pdf to code)
--          \lt show a window with table of content of the document
--          \le close essor window 

-- Set pdf previewer program
vim.g['vimtex_view_method'] = 'zathura'
