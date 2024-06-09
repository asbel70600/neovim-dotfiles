return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        enabled = true,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            local null_ls = require("null-ls") -- Require your null-ls config here (example below)
            null_ls.setup()

            require("mason-null-ls").setup({
                ensure_installed = { "stylua", "jq" },
                automatic_installation = false,
                handlers = {
                    stylua = function()
                        null_ls.register(
                            null_ls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces" } })
                        )
                    end,
                },
            })
        end,
        enabled = true,
    },
}
