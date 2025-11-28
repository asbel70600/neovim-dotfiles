return {
    event = "VeryLazy",
    "mikavilpas/yazi.nvim",
    keys = {
        {
            "<leader>;",
            function()
                require("yazi").yazi()
            end,
            desc = "Open the file manager",
        },
    },
    ---@type YaziConfig
    opts = {
        open_for_directories = true,
    },
}
