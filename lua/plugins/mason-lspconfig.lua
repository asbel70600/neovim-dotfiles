return {
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                })
            end,

            ["rust_analyzer"] = function() end,

            ["sqls"] = function()
                require("lspconfig").sqls.setup({
                    on_attach = function(client, bufnr)
                        require("sqls").on_attach(client, bufnr)
                    end,
                    capabilities = capabilities,
                })
            end,
        })
    end,
    enabled = true,
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
}
