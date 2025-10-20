require("codecompanion").setup({
  -- Configure the 'ollama' adapter
  http = {
    ollama = function()
      return require("codecompanion.adapters").extend("ollama", {
        -- Set the name of the model you pulled with Ollama
        -- Replace 'codellama' with the model you want to use
        name = "qwen2.5-coder",
        
        -- You can also specify the base URL, though it defaults to localhost
        -- base_url = "http://localhost:11434",
        
        -- Override model parameters if needed
        schema = {
          model = {
            default = "qwen2.5-coder",
          },
        },
      })
    end,
  },
  
  -- Define the strategies for using the AI
  strategies = {
    -- Use the ollama adapter for chat and inline strategies
    chat = {
      adapter = "ollama",
    },
    inline = {
      adapter = "ollama",
    },
    agent = {
      adapter = "ollama",
    },
  },
  
  -- Set up keymaps
  keymaps = {
    -- Chat with the AI
    chat = "<leader>cc", 
    
    -- Request inline code completion
    inline = "<leader>ci", 
  },
})
