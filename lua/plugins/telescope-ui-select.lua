return {
    "nvim-telescope/telescope-ui-select.nvim",
    enabled = true,
    config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
            },
        })
    end,
}
