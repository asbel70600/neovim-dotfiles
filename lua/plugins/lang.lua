return {
    {
        "RaafatTurki/hex.nvim",
        event = { "BufReadPost *.bin,*.hex,*.o,*.out,*.elf,*.img,[^.]*" },
    },
    {
        "elkowar/yuck.vim",
        ft = { "yuck" },
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = {
            "markdown",
        },
        ---@module 'render-markdown'
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
            latex = { enabled = true },
            sign = { enabled = false },
        },
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    },
}

-- {
--     "ray-x/lsp_signature.nvim",
--     event = "LspAttach",
--     opts = {
--         bind = true,
--         handler_opts = {
--             border = "rounded",
--         },
--     },
--     config = function(_, opts)
--         require("lsp_signature").setup(opts)
--     end,
-- },
-- {
--     "nanotee/sqls.nvim",
--     event = { "BufReadPost *.sql,*.psql" },
-- },
