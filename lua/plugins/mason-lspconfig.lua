return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
        enshure_installed = {
            "lua_ls",
            "clangd",
            "bashls",
            "pyright",
            "rust_analyzer",
            "phpactor",
            "java_language_server",
        },
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                })
            end,

            ["kotlin_language_server"] = function()
                require("lspconfig").kotlin_language_server.setup({})
            end,

            ["jdtls"] = function()
                vim.print("jdtls isn't doing anithing")
            end
            -- Next, you can provide a dedicated handler for specific servers.
            -- For example, a handler override for the `rust_analyzer`:
            -- ["rust_analyzer"] = function ()
            --     require("rust-tools").setup {}
            -- end
        })
    end,
    enabled = true,
}

-- local coq = require("coq")
-- require("mason-lspconfig").setup_handlers({
--     function(server_name)
--         require("lspconfig")[server_name].setup( coq.lsp_ensure_capabilities() )
--     end,
