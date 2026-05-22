return {
    {
        "RaafatTurki/hex.nvim",
        event = "BufReadPost *.bin,*.hex,*.o,*.out,*.elf,*.img,[^.]*",
    },
    {
        "elkowar/yuck.vim",
        ft = { "yuck" },
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
