-- Plugin to shou plantum uml diagrams preview in markdown 

require("diagram").setup({
    integrations = {
        require("diagram.integrations.markdown"),
        require("diagram.integrations.neorg"),
    },
    renderer_options = {
        mermaid = {
            background = nil, -- nil | "transparent" | "white" | "#hex"
            theme = dark, -- nil | "default" | "dark" | "forest" | "neutral"
            scale = 2, -- nil | 1 (default) | 2  | 3 | ...
            width = nil, -- nil | 800 | 400 | ...
            height = nil, -- nil | 600 | 300 | ...
            cli_args = { "--no-sandbox" },
        },
        plantuml = {
            cmd = 'java -jar /usr/share/plantuml/lib/plantuml.jar', -- 
            theme = "dark",
            charset = "utf-8",
            cli_args = { "-Djava.awt.headless=true" },
            scale = 2,
        },

        gnuplot = {
            --size = nil, -- nil | "800,600" | ...
            font = nil, -- nil | "Arial,12" | ...
            cli_args = nil, -- nil | { "-p" } | { "-c", "config.plt" } | ...
            --theme = "dark",
            scale = 4,
        },

    },
})

