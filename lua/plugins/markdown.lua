return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = {
        "markdown",
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        preset = "obsidian",
        code = {
            position = "left",
            width = "full",
            right_pad = 10,
        },
        heading = {
            sign = false,
            width = "full",
            border = true,
            border_virtual = true,
        },
        indent = { enabled = true },
        latex = { enabled = false },
        sign = { enabled = false },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    enabled = true,
}
