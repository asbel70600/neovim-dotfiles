return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces" } }),
                null_ls.builtins.formatting.black,
            },
        })
    end,
}