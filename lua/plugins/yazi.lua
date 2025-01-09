---@type LazySpec
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
        {
            "<leader>:",
            function()
                require("yazi").yazi(nil, vim.fn.getcwd())
            end,
            desc = "Open the file manager in nvim's working directory",
        },
    },
    ---@type YaziConfig
    opts = {
        -- if you want to open yazi instead of netrw, see below for more info
        open_for_directories = true,
    },
}
