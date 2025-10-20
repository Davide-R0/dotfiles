local cmp_ai = require('cmp_ai.config')

cmp_ai:setup({
    max_lines = 100,
    provider = 'Ollama',
    provider_options = {
        model = 'qwen2.5-coder:latest',
        -- This function tells the AI how to format the input
        prompt = function(lines_before, lines_after)
            return "<|fim_prefix|>" .. lines_before .. "<|fim_suffix|>" .. lines_after .. "<|fim_middle|>"
        end,
        
        -- This NEW function tells the plugin how to clean up the AI's output
        post_process = function(str)
            -- Find the position of the middle token
            local fim_middle_pos = str:find("<|fim_middle|>", 1, true)
            if fim_middle_pos then
                -- If found, return only the text *after* the token
                return str:sub(fim_middle_pos + #("<|fim_middle|>"))
            end
            -- If the token isn't found for some reason, return the original string
            return str
        end,
        auto_unload = true, -- Set to true to automatically unload the model when
        -- exiting nvim.
    },
    notify = true,
    notify_callback = function(msg)
        vim.notify(msg)
    end,
    run_on_every_keystroke = false,
    ignored_file_types = {
        -- default is not to ignore
        -- uncomment to ignore in lua:
        -- lua = true
        lean = true
    },
})
