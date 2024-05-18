require'soil'.setup{ 
    -- If you want to use Plant UML jar version instead of the install version
    -- puml_jar = "/path/to/plantuml.jar",
    
    -- If you want to customize the image showed when running this plugin
    image = {
        darkmode = false, -- Enable or disable darkmode 
        format = "png", -- Choose between png or svg

        -- Edit the string to use your preferred app to open the image (as if it were a command line)
        -- Some examples:
        -- return "feh " .. img
        -- return "xdg-open " .. img
        execute_to_open = function(img) 
            return "feh -b " .. img -- -b
        end
    }
}
