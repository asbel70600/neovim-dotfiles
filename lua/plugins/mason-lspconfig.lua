return {
    "williamboman/mason-lspconfig.nvim",
    enabled = true,
    dependencies = {"williamboman/mason.nvim"},
    opts = {
        enshure_installed = {"lua_ls","clangd","bashls","pyright","rust_analyzer","phpactor","java_language_server"}
    }

}
