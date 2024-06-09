return {
    "folke/neodev.nvim",
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
    opts = {
        library = {
            enabled = true,
            runtime = true,
            types = true,
            plugins = {
                "nvim-dap-ui",
                types = true,
            },
        },
        setup_jsonls = true,
        lspconfig = true,
        pathStrict = true,
        -- to add a new directory where neodev will run
        --         override = function(root_dir, library)
        --             if root_dir:find("directory_to_run_neodev", 1, true) == 1 then
        --                 library.enabled = true
        --                 library.plugins = true
        --             end
        --         end,
    },
    enabled = true,
    event = "VeryLazy",
}
