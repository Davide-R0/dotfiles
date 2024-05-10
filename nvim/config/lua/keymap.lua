-- undoo tree
vim.keymap.set('n', '<leader>t', vim.cmd.UndotreeToggle)

vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", ".", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- gen AI
--vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen<CR>')

-- prnter setup
vim.cmd[[nnoremap <leader><leader><leader>pp :r !echo; lpstat -p \| sed 's/printer //g' \| sed 's/is idle.  enabled since.*//g'; echo<cr>]]
vim.cmd[[nnoremap <leader><leader><leader>ph :w<cr>:!lpoptions -d HP_Smart_Tank_7000<cr>:!lp -n 1 -o media=a4 -o sides=two-sided-long-edge %<cr><cr>]]

-- For spelling checking
vim.cmd[[nnoremap <leader>it :setlocal spell spelllang=it <cr>]]
vim.cmd[[nnoremap <leader>en :setlocal spell spelllang=en <cr>]]
