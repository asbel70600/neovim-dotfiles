return {
    "folke/neodev.nvim",
    enabled = true,
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
    opts = {
        library = {
            enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
            -- these settings will be used for your Neovim config directory
            runtime = true, -- runtime path
            types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
            plugins = true, -- installed opt or start plugins in packpath
            -- you can also specify the list of plugins to make available as a workspace library
            -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
        },
        setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
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
}
