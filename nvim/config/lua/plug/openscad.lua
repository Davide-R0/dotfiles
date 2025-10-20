-- C-m cheatsheet
-- A-m offline manual
-- C-o openscad preview
-- A-c htop

vim.g.openscad_fuzzy_finder = 'fzf'
vim.g.openscad_cheatsheet_window_blend = 25 --%
--vim.g.openscad_load_snippets = true
-- should the openscad project automatically be opened on startup
vim.g.openscad_auto_open = false

vim.g.openscad_default_mappings = true
vim.g.openscad_exec_openscad_trig_key = '<C-o>'

-- Default mappings
vim.g.openscad_cheatsheet_toggle_key = '<Enter>'
vim.g.openscad_help_trig_key = '<A-h>'
vim.g.openscad_help_manual_trig_key = '<A-m>'
vim.g.openscad_top_toggle = '<A-c>'
