return {
    {
        "neovim/nvim-lspconfig",
        event = { "User ProjectOpened" },
        ft = {
            -- Shell scripts
            "sh", "bash", "zsh", "fish",
            -- Config files
            "conf", "config", "cfg", "ini", "toml", "yaml", "yml", "json", "proto", "graphql",
            -- System/dotfiles
            "dosini", "systemd", "crontab",
            -- Window manager configs
            "hypr", "i3config", "swayconfig",
            -- Low-level
            "asm", "nasm",
            -- Scripts
            "python", "lua", "perl", "ruby", "awk", "sed",
            -- Text/markup (optional, if you edit these standalone)
            "markdown", "text", "rst",
            -- Other common standalone files
            "dockerfile", "make", "cmake", "sql", "proto"
        },

        dependencies = {
            "j-hui/fidget.nvim",
            -- "nvim-tree/nvim-web-devicons",
            -- "saghen/blink.cmp",
        },

        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            local servers = {
                dockerls = {},
                buf_ls = {},
                clangd = {},
                lua_ls = {},
                markdown_oxide = {},
                denols = {},
                biome = {},
                graphql = {},
                taplo = {},
                ts_ls = {},
                phpactor = {},
                rust_analyzer = {
                    flags = { debounce_text_changes = 150 },
                    settings = {
                        ["rust-analyzer"] = {
                            diagnostics = {
                                enable = true,
                                experimental = { enable = true },
                            },
                        },
                    },
                },
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
                ty = {},
            }

            for name, conf in pairs(servers) do
                conf.capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(),
                    capabilities)
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
    },
    {
        "williamboman/mason.nvim",
        cmd = { "Mason" },

        config = function()
            require("mason").setup()
        end,
    },
}
