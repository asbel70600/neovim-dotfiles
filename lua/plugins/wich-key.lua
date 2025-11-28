return {
    "folke/which-key.nvim",
    event = "BufReadPost",
    opts = {
        plugins = {
            marks = true,
            registers = true,
            spelling = false,
            presets = {
                text_objects = true,
                windows = true,
                nav = true,
                z = true,
                g = true,
            },
        },
    },
}
