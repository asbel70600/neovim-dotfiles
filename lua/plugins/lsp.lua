return {
    "neovim/nvim-lspconfig",
    event = { "User ProjectOpened" },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "williamboman/mason.nvim",
        "j-hui/fidget.nvim",
        "saghen/blink.cmp",
    },

    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        local servers = {
            wgsl_analyzer = {},
            -- glaswog = {},
            dockerls = {},
            biome = {},
            asm_lsp = {},
            clangd = {},
            html = {},
            hyprls = {},
            lua_ls = {},
            markdown_oxide = {},
            pyright = {},
            quick_lint_js = {},
            sqls = {},
            taplo = {},
            ts_ls = {},
            phpactor = {},
            prismals = {},
            tailwindcss = {},
            bashls = {
                filetypes = { "sh", "bash", "zsh" },
            },
            yamlls = {
                settings = {
                    yaml = {
                        keyOrdering = false,
                    },
                },
            },
            -- java_language_server = { cmd = { "java-language-server" } },
            -- intelephense = {},
            -- stimulus_ls = {}
        }

        for name, conf in pairs(servers) do
            conf.capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), capabilities)
            conf = vim.tbl_deep_extend("force", vim.lsp.config[name], conf)
            vim.lsp.config(name, conf)
            vim.lsp.enable(name)
        end

        vim.diagnostic.config({
            severity_sort = true,
            float = { border = "rounded", source = "if_many" },
            underline = { severity = vim.diagnostic.severity.ERROR },
            signs = vim.g.have_nerd_font and {
                text = {
                    [vim.diagnostic.severity.ERROR] = "󰅚 ",
                    [vim.diagnostic.severity.WARN] = "󰀪 ",
                    [vim.diagnostic.severity.INFO] = "󰋽 ",
                    [vim.diagnostic.severity.HINT] = "󰌶 ",
                },
            } or {},
            virtual_text = {
                source = "if_many",
                spacing = 2,
                format = function(diagnostic)
                    local diagnostic_message = {
                        [vim.diagnostic.severity.ERROR] = diagnostic.message,
                        [vim.diagnostic.severity.WARN] = diagnostic.message,
                        [vim.diagnostic.severity.INFO] = diagnostic.message,
                        [vim.diagnostic.severity.HINT] = diagnostic.message,
                    }
                    return diagnostic_message[diagnostic.severity]
                end,
            },
        })
    end,
}

-- vim: foldlevel=2
