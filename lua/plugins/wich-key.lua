return {
    "folke/which-key.nvim",
    opts = {
        plugins = {
            marks = true,
            registers = true,
            spelling = false,
            presets = {
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true,      -- default bindings on 
                nav = true,          -- misc bindings to work with windows
                z = true,            -- bindings for folds, spelling and others prefixed with z
                g = true,            -- bindings for prefixed with g
            },
        },
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜", -- symbol used between a key and it's label
            group = "+", -- symbol prepended to a group
        },
        layout = {
            height = { min = 4, max = 25 },                                               -- min and max height of the columns
            width = { min = 20, max = 50 },                                               -- min and max width of the columns
            spacing = 3,                                                                  -- spacing between columns
            align = "left",                                                               -- align columns left, center or right
        },
        show_help = true,                                                                 -- show a help message in the command line for using WhichKey
        show_keys = true,                                                                 -- show the currently pressed key and its label as a message in the command line
        triggers = {

        },                                                                -- automatically setup triggers
        -- triggers = {"<leader>"} -- or specifiy a list manually
        -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
        -- disable the WhichKey popup for certain buf types and file types.
        -- Disabled by default for Telescope
        disable = {
            buftypes = {},
            filetypes = {},
        },
    },
}
