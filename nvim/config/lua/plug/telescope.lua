-- Telescope congiguration
-- https://github.com/nvim-telescope/telescope.nvim
-- IMPORTANTE for media_files mettere find_cmd='fdfind'

require('telescope').setup{
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        
        layout_config = {
            --width = 0.8,
            --vertical = { width = 0.5 }
            -- other layout configuration here
        },

        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                --["<C-h>"] = "which_key"
            }
        }
    },

    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },

    extensions = {
        -- ui-select
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }
            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
        },

        -- media_files 
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = {"png", "pdf", "mp4", "jpg", "svg", "jpeg"},
            -- find command (defaults to `fd`)
            find_cmd = "fd" --"fdfind"
        }

        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    }
}

-- media_files
require('telescope').load_extension('media_files');

-- ui-select 
require('telescope').load_extension('ui-select');

-- Basic keymap
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ld', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fm', ':Telescope media_files<CR>', {})

