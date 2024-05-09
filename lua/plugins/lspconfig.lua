-- vim.lsp.set_log_level("debug")
return {
    "neovim/nvim-lspconfig",
    opts = {},
    enabled = true,
    config = function()
        require("neodev").setup({})
        local lspconf = require("lspconfig")
        lspconf.lua_ls.setup({})
        lspconf.harper_ls.setup({
            settings = {
                ["harper-ls"] = {
                    linters = {
                        spell_check = true,
                        spelled_numbers = false,
                        an_a = true,
                        sentence_capitalization = true,
                        unclosed_quotes = true,
                        wrong_quotes = false,
                        long_sentences = true,
                        repeated_words = true,
                        spaces = true,
                        matcher = true,
                        diagnosticSeverity = "hint" -- Can also be "information", "warning", or "error"
                    },
                },
            },
        })
        lspconf.luau_lsp.setup({})

        --             settings = {
        --                 Lua = {
        --                   completion = {
        --                     callSnippet = "Replace"
        --                   }
        --                 }
        --             }
        --         })
        --         lspconf.clangd.setup({})
        --         lspconf.bashls.setup({})
        --         lspconf.pyright.setup({})
        --         --
        --         lspconf.rust_analyzer.setup({})
        --         lspconf.phpactor.setup({
        --         cmd = { "phpactor", "language-server" },
        --         })
        --         lspconf.java_language_server.setup({
        --         cmd = { "java-language-server" },
        --         })
    end,
}
