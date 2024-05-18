-- undoo tree
vim.keymap.set('n', '<leader>t', vim.cmd.UndotreeToggle)

vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", ".", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- gen AI
vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen<CR>')

-- Obsidain
vim.keymap.set('n', '<leader>ow', ':ObsidianWorkspace<CR>', { desc = "Show all warkspaces" }) 
vim.keymap.set('n', '<leader>os', ':ObsidianSearch<CR>', { desc = "Grep in all the vault" })  
vim.keymap.set('n', '<leader>ol', ':ObsidianLinks<CR>', { desc = "Show links in the file" })  
vim.keymap.set('n', '<leader>ot', ':ObsidianTags<CR>', { desc = "Show the tags created" })
-- 'gf' follow the link 
-- 'Invio' follow link and/or check checkbokes

-- prnter setup
vim.cmd[[nnoremap <leader><leader><leader>pp :r !echo; lpstat -p \| sed 's/printer //g' \| sed 's/is idle.  enabled since.*//g'; echo<cr>]]
vim.cmd[[nnoremap <leader><leader><leader>ph :w<cr>:!lpoptions -d Smart_Tank_7000<cr>:!lp -n 1 -o media=a4 -o sides=two-sided-long-edge -o page-top=72 -o page-bottom=72 -o page-left=72 -o page-right=72 %<cr><cr>]]

-- For spelling checking
vim.cmd[[nnoremap <leader>it :setlocal spell spelllang=it <cr>]]
vim.cmd[[nnoremap <leader>en :setlocal spell spelllang=en <cr>]]
