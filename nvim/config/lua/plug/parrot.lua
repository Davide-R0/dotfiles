
require("parrot").setup {
    -- The provider definitions include endpoints, API keys, default parameters,
    -- and topic model arguments for chat summarization. You can use any name
    -- for your providers and configure them with custom functions.
    providers = {
        ollama = {
            name = "ollama",
            endpoint = "http://localhost:11434/api/chat",
            api_key = "", -- not required for local Ollama
            params = {
                chat = { temperature = 1.5, top_p = 1, num_ctx = 8192, min_p = 0.05 },
                command = { temperature = 1.5, top_p = 1, num_ctx = 8192, min_p = 0.05 },
            },
            topic_prompt = [[
            Summarize the chat above and only provide a short headline of 2 to 3
            words without any opening phrase like "Sure, here is the summary",
            "Sure! Here's a shortheadline summarizing the chat" or anything similar.
            ]],
            topic = {
                model = "llama3.1", --"llama3.2",
                --params = { max_tokens = 32 },
            },
            headers = {
                ["Content-Type"] = "application/json",
            },
            models = {
                "qwen2.5-coder:latest",
                "qwen2-math:latest",
                "mistral:latest",
                "llama3.1:latest",
                "gemma3:12b",
                "phi4-reasoning:latest",
                "minicpm-v:latest",
                "deepseek-r1:latest",
                "DeepSeek-Prover-V2-7B-Q4:latest",
                "DeepSeek-Prover-V2-7B-Q8",
                --"nomic-embed-text:latest",
                --"embeddinggemma:latest",
                "deepseek-r1:14b",
            },
            resolve_api_key = function()
                return true
            end,
            process_stdout = function(response)
                if response:match "message" and response:match "content" then
                    local ok, data = pcall(vim.json.decode, response)
                    if ok and data.message and data.message.content then
                        return data.message.content
                    end
                end
            end,
            get_available_models = function(self)
                local url = self.endpoint:gsub("chat", "")
                local logger = require "parrot.logger"
                local job = Job:new({
                    command = "curl",
                    args = { "-H", "Content-Type: application/json", url .. "tags" },
                }):sync()
                local parsed_response = require("parrot.utils").parse_raw_response(job)
                self:process_onexit(parsed_response)
                if parsed_response == "" then
                    logger.debug("Ollama server not running on " .. endpoint_api)
                    return {}
                end

                local success, parsed_data = pcall(vim.json.decode, parsed_response)
                if not success then
                    logger.error("Ollama - Error parsing JSON: " .. vim.inspect(parsed_data))
                    return {}
                end

                if not parsed_data.models then
                    logger.error "Ollama - No models found. Please use 'ollama pull' to download one."
                    return {}
                end

                local names = {}
                for _, model in ipairs(parsed_data.models) do
                    table.insert(names, model.name)
                end

                return names
            end,
        },
        --[[
        gemini = {
            name = "gemini",
            endpoint = function(self)
                return "https://generativelanguage.googleapis.com/v1beta/models/"
                .. self._model
                .. ":streamGenerateContent?alt=sse"
            end,
            model_endpoint = function(self)
                return { "https://generativelanguage.googleapis.com/v1beta/models?key=" .. self.api_key }
            end,

            --api_key = os.getenv "GEMINI_API_KEY",
            -- OPTIONAL: Alternative methods to retrieve API key
            -- Using GPG for decryption:
            api_key = { "gpg", "--decrypt", vim.fn.expand("$HOME") .. "/gpg/gemini_api_key.txt.gpg" },

            params = {
                chat = { temperature = 1.1, topP = 1, topK = 10, maxOutputTokens = 8192 },
                command = { temperature = 0.8, topP = 1, topK = 10, maxOutputTokens = 8192 },
            },
            topic = {
                model = "gemini-2.5-flash",
                params = { maxOutputTokens = 64 },
            },
            headers = function(self)
                return {
                    ["Content-Type"] = "application/json",
                    ["x-goog-api-key"] = self.api_key,
                }
            end,
            models = {
                --"gemini-2.5-flash-preview-05-20",
                --"gemini-2.5-pro-preview-05-06",
                "gemini-1.5-pro-latest",
                "gemini-1.5-flash-latest",
                --"gemini-2.5-pro-exp-03-25",
                --"gemini-2.0-flash-lite",
                --"gemini-2.0-flash-thinking-exp",
                --"gemma-3-27b-it",
            },
            preprocess_payload = function(payload)
                local contents = {}
                local system_instruction = nil
                for _, message in ipairs(payload.messages) do
                    if message.role == "system" then
                        system_instruction = { parts = { { text = message.content } } }
                    else
                        local role = message.role == "assistant" and "model" or "user"
                        table.insert(
                            contents,
                            { role = role, parts = { { text = message.content:gsub("^%s*(.-)%s*$", "%1") } } }
                        )
                    end
                end
                local gemini_payload = {
                    contents = contents,
                    generationConfig = {
                        temperature = payload.temperature,
                        topP = payload.topP or payload.top_p,
                        maxOutputTokens = payload.max_tokens or payload.maxOutputTokens,
                    },
                }
                if system_instruction then
                    gemini_payload.systemInstruction = system_instruction
                end
                return gemini_payload
            end,
            process_stdout = function(response)
                if not response or response == "" then
                    return nil
                end
                local success, decoded = pcall(vim.json.decode, response)
                if
                    success
                    and decoded.candidates
                    and decoded.candidates[1]
                    and decoded.candidates[1].content
                    and decoded.candidates[1].content.parts
                    and decoded.candidates[1].content.parts[1]
                    then
                        return decoded.candidates[1].content.parts[1].text
                    end
                    return nil
                end,

            },
            ]]--
            --[[
            openai = {
                name = "openai",
                endpoint = "https://api.openai.com/v1/chat/completions",
                -- endpoint to query the available models online
                model_endpoint = "https://api.openai.com/v1/models",
                api_key = os.getenv("OPENAI_API_KEY"),
                -- OPTIONAL: Alternative methods to retrieve API key
                -- Using GPG for decryption:
                -- api_key = { "gpg", "--decrypt", vim.fn.expand("$HOME") .. "/my_api_key.txt.gpg" },
                -- Using macOS Keychain:
                -- api_key = { "/usr/bin/security", "find-generic-password", "-s my-api-key", "-w" },
                --- default model parameters used for chat and interactive commands
                params = {
                    chat = { temperature = 1.1, top_p = 1 },
                    command = { temperature = 1.1, top_p = 1 },
                },
                -- topic model parameters to summarize chats
                topic = {
                    model = "gpt-4.1-nano",
                    params = { max_completion_tokens = 64 },
                },
                --  a selection of models that parrot can remember across sessions
                --  NOTE: This will be handled more intelligently in a future version
                models = {
                    "gpt-4.1",
                    "o4-mini",
                    "gpt-4.1-mini",
                    "gpt-4.1-nano",
                },
            },
            ...]]--
        },

        --[[ default system prompts used for the chat sessions and the command routines
        system_prompt = {
            chat = ...,
            command = ...
        },]]--

        -- the prefix used for all commands
        cmd_prefix = "Ai",

        -- optional parameters for curl
        curl_params = {},

        -- The directory to store persisted state information like the
        -- current provider and the selected models
        state_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/parrot/persisted",

        -- The directory to store the chats (searched with PrtChatFinder)
        chat_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/parrot/chats",

        -- Chat user prompt prefix
        chat_user_prefix = "🗨:",

        -- llm prompt prefix
        llm_prefix = "🦜:",

        -- Explicitly confirm deletion of a chat file
        chat_confirm_delete = true,

        -- When available, call API for model selection
        online_model_selection = false, -- NEW

        -- Local chat buffer shortcuts
        chat_shortcut_respond = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g><C-g>" },
        chat_shortcut_delete = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>d" },
        chat_shortcut_stop = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>s" },
        chat_shortcut_new = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>c" },

        -- Option to move the cursor to the end of the file after finished respond
        chat_free_cursor = false,


        -- use prompt buftype for chats (:h prompt-buffer)
        chat_prompt_buf_type = false,  -- NEW

        -- Default target for  PrtChatToggle, PrtChatNew, PrtContext and the chats opened from the ChatFinder
        -- values: popup / split / vsplit / tabnew
        toggle_target = "tabnew",

        -- The interactive user input appearing when can be "native" for
        -- vim.ui.input or "buffer" to query the input within a native nvim buffer
        -- (see video demonstrations below)
        user_input_ui = "native",

        -- Popup window layout
        -- border: "single", "double", "rounded", "solid", "shadow", "none"
        style_popup_border = "single",

        -- margins are number of characters or lines
        style_popup_margin_bottom = 8,
        style_popup_margin_left = 1,
        style_popup_margin_right = 2,
        style_popup_margin_top = 2,
        style_popup_max_width = 160,


        -- Prompt used for interactive LLM calls like PrtRewrite where {{llm}} is
        -- a placeholder for the llm name
        command_prompt_prefix_template = "🤖 {{llm}} ~ ",

        -- auto select command response (easier chaining of commands)
        -- if false it also frees up the buffer cursor for further editing elsewhere
        command_auto_select_response = true,

        -- Time in hours until the model cache is refreshed
        -- Set to 0 to deactive model caching
        model_cache_expiry_hours = 48,

        -- fzf_lua options for PrtModel and PrtChatFinder when plugin is installed
        fzf_lua_opts = {
            ["--ansi"] = true,
            ["--sort"] = "",
            ["--info"] = "inline",
            ["--layout"] = "reverse",
            ["--preview-window"] = "nohidden:right:75%",
        },

        -- Enables the query spinner animation 
        enable_spinner = true,
        -- Type of spinner animation to display while loading
        -- Available options: "dots", "line", "star", "bouncing_bar", "bouncing_ball"
        spinner_type = "star",
        -- Show hints for context added through completion with @file, @buffer or @directory
        show_context_hints = true,

        -- Show diff preview before applying changes from rewrite/append/prepend
        enable_preview_mode = true,
        preview_auto_apply = false, -- If true, applies changes automatically after preview timeout
        preview_timeout = 10000, -- Time in ms before auto-apply (if enabled)
        preview_border = "rounded",
        preview_max_width = 120,
        preview_max_height = 30,

        hooks = {
            Complete = function(prt, params)
                local template = [[
                I have the following code from {{filename}}:

                ```{{filetype}}
                {{selection}}
                ```

                Please finish the code above carefully and logically.
                Respond just with the snippet of code that should be inserted."
                ]]
                local model_obj = prt.get_model "command"
                prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
            end,
            CompleteFullContext = function(prt, params)
                local template = [[
                I have the following code from {{filename}}:

                ```{{filetype}}
                {{filecontent}}
                ```

                Please look at the following section specifically:
                ```{{filetype}}
                {{selection}}
                ```

                Please finish the code above carefully and logically.
                Respond just with the snippet of code that should be inserted.
                ]]
                local model_obj = prt.get_model "command"
                prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
            end,
            CompleteMultiContext = function(prt, params)
                local template = [[
                I have the following code from {{filename}} and other realted files:

                ```{{filetype}}
                {{multifilecontent}}
                ```

                Please look at the following section specifically:
                ```{{filetype}}
                {{selection}}
                ```

                Please finish the code above carefully and logically.
                Respond just with the snippet of code that should be inserted.
                ]]
                local model_obj = prt.get_model "command"
                prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
            end,
            Explain = function(prt, params)
                local template = [[
                Your task is to take the code snippet from {{filename}} and explain it with gradually increasing complexity.
                Break down the code's functionality, purpose, and key components.
                The goal is to help the reader understand what the code does and how it works.

                ```{{filetype}}
                {{selection}}
                ```

                Use the markdown format with codeblocks and inline code.
                Explanation of the code above:
                ]]
                local model = prt.get_model "command"
                prt.logger.info("Explaining selection with model: " .. model.name)
                prt.Prompt(params, prt.ui.Target.new, model, nil, template)
            end,
            FixBugs = function(prt, params)
                local template = [[
                You are an expert in {{filetype}}.
                Fix bugs in the below code from {{filename}} carefully and logically:
                Your task is to analyze the provided {{filetype}} code snippet, identify
                any bugs or errors present, and provide a corrected version of the code
                that resolves these issues. Explain the problems you found in the
                original code and how your fixes address them. The corrected code should
                be functional, efficient, and adhere to best practices in
                {{filetype}} programming.

                ```{{filetype}}
                {{selection}}
                ```

                Fixed code:
                ]]
                local model_obj = prt.get_model "command"
                prt.logger.info("Fixing bugs in selection with model: " .. model_obj.name)
                prt.Prompt(params, prt.ui.Target.new, model_obj, nil, template)
            end,
            Optimize = function(prt, params)
                local template = [[
                You are an expert in {{filetype}}.
                Your task is to analyze the provided {{filetype}} code snippet and
                suggest improvements to optimize its performance. Identify areas
                where the code can be made more efficient, faster, or less
                resource-intensive. Provide specific suggestions for optimization,
                along with explanations of how these changes can enhance the code's
                performance. The optimized code should maintain the same functionality
                as the original code while demonstrating improved efficiency.

                ```{{filetype}}
                {{selection}}
                ```

                Optimized code:
                ]]
                local model_obj = prt.get_model "command"
                prt.logger.info("Optimizing selection with model: " .. model_obj.name)
                prt.Prompt(params, prt.ui.Target.new, model_obj, nil, template)
            end,
            UnitTests = function(prt, params)
                local template = [[
                I have the following code from {{filename}}:

                ```{{filetype}}
                {{selection}}
                ```

                Please respond by writing table driven unit tests for the code above.
                ]]
                local model_obj = prt.get_model "command"
                prt.logger.info("Creating unit tests for selection with model: " .. model_obj.name)
                prt.Prompt(params, prt.ui.Target.enew, model_obj, nil, template)
            end,
            Debug = function(prt, params)
                local template = [[
                I want you to act as {{filetype}} expert.
                Review the following code, carefully examine it, and report potential
                bugs and edge cases alongside solutions to resolve them.
                Keep your explanation short and to the point:

                ```{{filetype}}
                {{selection}}
                ```
                ]]
                local model_obj = prt.get_model "command"
                prt.logger.info("Debugging selection with model: " .. model_obj.name)
                prt.Prompt(params, prt.ui.Target.enew, model_obj, nil, template)
            end,
            CommitMsg = function(prt, params)
                local futils = require "parrot.file_utils"
                if futils.find_git_root() == "" then
                    prt.logger.warning "Not in a git repository"
                    return
                else
                    local template = [[
                    I want you to act as a commit message generator. I will provide you
                    with information about the task and the prefix for the task code, and
                    I would like you to generate an appropriate commit message using the
                    conventional commit format. Do not write any explanations or other
                    words, just reply with the commit message.
                    Start with a short headline as summary but then list the individual
                    changes in more detail.

                    Here are the changes that should be considered by this message:
                    ]] .. vim.fn.system "git diff --no-color --no-ext-diff --staged"
                    local model_obj = prt.get_model "command"
                    prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
                end
            end,
            SpellCheck = function(prt, params)
                local chat_prompt = [[
                Your task is to take the text provided and rewrite it into a clear,
                grammatically correct version while preserving the original meaning
                as closely as possible. Correct any spelling mistakes, punctuation
                errors, verb tense issues, word choice problems, and other
                grammatical mistakes.
                ]]
                prt.ChatNew(params, chat_prompt)
            end,
            CodeConsultant = function(prt, params)
                local chat_prompt = [[
                Your task is to analyze the provided {{filetype}} code and suggest
                improvements to optimize its performance. Identify areas where the
                code can be made more efficient, faster, or less resource-intensive.
                Provide specific suggestions for optimization, along with explanations
                of how these changes can enhance the code's performance. The optimized
                code should maintain the same functionality as the original code while
                demonstrating improved efficiency.

                Here is the code
                ```{{filetype}}
                {{filecontent}}
                ```
                ]]
                prt.ChatNew(params, chat_prompt)
            end,
            ProofReader = function(prt, params)
                local chat_prompt = [[
                I want you to act as a proofreader. I will provide you with texts and
                I would like you to review them for any spelling, grammar, or
                punctuation errors. Once you have finished reviewing the text,
                provide me with any necessary corrections or suggestions to improve the
                text. Highlight the corrected fragments (if any) using markdown backticks.

                When you have done that subsequently provide me with a slightly better
                version of the text, but keep close to the original text.

                Finally provide me with an ideal version of the text.

                Whenever I provide you with text, you reply in this format directly:

                ## Corrected text:

                {corrected text, or say "NO_CORRECTIONS_NEEDED" instead if there are no corrections made}

                ## Slightly better text

                {slightly better text}

                ## Ideal text

                {ideal text}
                ]]
                prt.ChatNew(params, chat_prompt)
            end,
        },
        keys = {
            { "<C-g>c", "<cmd>PrtChatNew<cr>", mode = { "n", "i" }, desc = "New Chat" },
            { "<C-g>c", ":<C-u>'<,'>PrtChatNew<cr>", mode = { "v" }, desc = "Visual Chat New" },
            { "<C-g>t", "<cmd>PrtChatToggle<cr>", mode = { "n", "i" }, desc = "Toggle Popup Chat" },
            { "<C-g>f", "<cmd>PrtChatFinder<cr>", mode = { "n", "i" }, desc = "Chat Finder" },
            { "<C-g>r", "<cmd>PrtRewrite<cr>", mode = { "n", "i" }, desc = "Inline Rewrite" },
            { "<C-g>r", ":<C-u>'<,'>PrtRewrite<cr>", mode = { "v" }, desc = "Visual Rewrite" },
            {
                "<C-g>j",
                "<cmd>PrtRetry<cr>",
                mode = { "n" },
                desc = "Retry rewrite/append/prepend command",
            },
            { "<C-g>a", "<cmd>PrtAppend<cr>", mode = { "n", "i" }, desc = "Append" },
            { "<C-g>a", ":<C-u>'<,'>PrtAppend<cr>", mode = { "v" }, desc = "Visual Append" },
            { "<C-g>o", "<cmd>PrtPrepend<cr>", mode = { "n", "i" }, desc = "Prepend" },
            { "<C-g>o", ":<C-u>'<,'>PrtPrepend<cr>", mode = { "v" }, desc = "Visual Prepend" },
            { "<C-g>e", ":<C-u>'<,'>PrtEnew<cr>", mode = { "v" }, desc = "Visual Enew" },
            { "<C-g>s", "<cmd>PrtStop<cr>", mode = { "n", "i", "v", "x" }, desc = "Stop" },
            {
                "<C-g>i",
                ":<C-u>'<,'>PrtComplete<cr>",
                mode = { "n", "i", "v", "x" },
                desc = "Complete visual selection",
            },
            { "<C-g>x", "<cmd>PrtContext<cr>", mode = { "n" }, desc = "Open context file" },
            { "<C-g>n", "<cmd>PrtModel<cr>", mode = { "n" }, desc = "Select model" },
            { "<C-g>p", "<cmd>PrtProvider<cr>", mode = { "n" }, desc = "Select provider" },
            { "<C-g>q", "<cmd>PrtAsk<cr>", mode = { "n" }, desc = "Ask a question" },
        },

    }


