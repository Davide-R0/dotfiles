## Telescope funzioni:
  - quano si digita nei comandi se si preme <Tab> si vedono i possibili comandi
  - per aprirlo:
    `:Tel[escope] [commandi]`
  - vari tipologie di ricerca:
    - `find_files [file]`: cerca file in ttto il sistema
    - `live_grep [parole]`: cerca le parole inqualsiasi file del computer
    - ...
  - Per file git:
    - `git_branches`:
  - Per veder immagini:  image_files
  - `:Telescope planets`

## Mappings and Action:

| Mappings       | Action                                                    |
|----------------|-----------------------------------------------------------|
| `<C-n>/<Down>` | Next item                                                 |
| `<C-p>/<Up>`   | Previous item                                             |
| `j/k`          | Next/previous (in normal mode)                            |
| `H/M/L`        | Select High/Middle/Low (in normal mode)                   |
| `gg/G`         | Select the first/last item (in normal mode)               |
| `<CR>`         | Confirm selection                                         |
| `<C-x>`        | Go to file selection as a split                           |
| `<C-v>`        | Go to file selection as a vsplit                          |
| `<C-t>`        | Go to a file in a new tab                                 |
| `<C-u>`        | Scroll up in preview window                               |
| `<C-d>`        | Scroll down in preview window                             |
| `<C-f>`        | Scroll left in preview window                             |
| `<C-k>`        | Scroll right in preview window                            |
| `<M-f>`        | Scroll left in results window                             |
| `<M-k>`        | Scroll right in results window                            |
| `<C-/>`        | Show mappings for picker actions (insert mode)            |
| `?`            | Show mappings for picker actions (normal mode)            |
| `<C-c>`        | Close telescope (insert mode)                             |
| `<Esc>`        | Close telescope (in normal mode)                          |
| `<Tab>`        | Toggle selection and move to next selection               |
| `<S-Tab>`      | Toggle selection and move to prev selection               |
| `<C-q>`        | Send all items not filtered to quickfixlist (qflist)      |
| `<M-q>`        | Send all selected items to qflist                         |
| `<C-r><C-w>`   | Insert cword in original window into prompt (insert mode) |

Opening telescope keymappings:
```lua
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ld', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fm', ':Telescope media_files<CR>', {})
```

