-- vim.lsp.set_log_level("debug")
return {
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    config = function()
        require("neodev").setup({})

        local lspconfig = require("lspconfig")
        local configs = require("lspconfig.configs")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        configs.blade = {
            default_config = {
                cmd = { "laravel-dev-tools", "lsp" },
                filetypes = { "blade" },
                root_dir = function(fname)
                    return lspconfig.util.find_git_ancestor(fname)
                end,
                settings = {},
            },
        }

        lspconfig.blade.setup({
            capabilities = capabilities,
        })

    end,
    enabled = true,
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
}

-- lspconf.harper_ls.setup({
--     settings = {
--         ["harper-ls"] = {
--             linters = {
--                 spell_check = true,
--                 spelled_numbers = false,
--                 an_a = true,
--                 sentence_capitalization = true,
--                 unclosed_quotes = true,
--                 wrong_quotes = false,
--                 long_sentences = true,
--                 repeated_words = true,
--                 spaces = true,
--                 matcher = true,
--                 diagnosticSeverity = "hint", -- Can also be "information", "warning", or "error"
--             },
--         },
--     },
-- })

-- vim: foldlevel=3
