return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = { "stevearc/dressing.nvim", "nvim-tree/nvim-web-devicons" },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({})
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
    opts = {
        rules = {
            { plugin = "flash.nvim", icon = "⚡ ", color = "yellow" },
            { pattern = "[Git]", icon = " ", color = "red" },
            { pattern = "[Terminal]", icon = "", color = "gray" },
            { pattern = "[Buffer]", icon = "󰈔", color = "gray" },
            { pattern = "[Yazi]", icon = "󰇥", color = "gray" },
            { pattern = "[DAP]", icon = "󰃤 ", color = "blue" },
            { pattern = "[a]ction", icon = "󱖫", color = "green" },
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)

        wk.add({
            { "<leader>d", group = "Debug", icon = "🐛 " },
            { "<leader>f", group = "Find", icon = "🔍 " },
            { "<leader>g", group = "Git" },
            { "<leader>h", group = "Harpoon", icon = "🎯 " },
        })
    end,
}
