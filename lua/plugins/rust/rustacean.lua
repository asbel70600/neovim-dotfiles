return {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false,   -- This plugin is already lazy
    config = function()
        -- local server_config = require("rustaceanvim.config.server")
        -- local capabilities = server_config.create_client_capabilities()
        -- local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
        -- cmp_capabilities.textDocument.foldingRange = {
        --     dynamicRegistration = false,
        --     lineFoldingOnly = true,
        -- }
        --
        -- for k, v in pairs(capabilities) do
        --     cmp_capabilities[k] = v
        -- end
        --
        -- require("rustaceanvim").server = {
        --     capabilities = cmp_capabilities,
        -- }
        --
        -- -- .setup({
        -- --
        -- --     server = {
        -- --         capabilities =  cmp_capabilities,
        -- --     },
        -- -- })
    end,
}
