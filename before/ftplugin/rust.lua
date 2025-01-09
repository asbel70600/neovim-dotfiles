---@type RustaceanOpts
vim.g.rustaceanvim = {
    ---@type RustaceanToolsOpts
    tools = {
        enable_clippy = true,
        hover_actions = {
            replace_builtin_hover = true,
        },
    },
    ---@type RustaceanLspClientOpts
    server = {
        on_attach = function(client, bufnr)
            -- Set keybindings, etc. here.
        end,
        auto_attach = true,
        settings = {},
        standalone = false,
        default_settings = {
            -- rust-analyzer language server configuration
            ["rust-analyzer"] = {
                ["check"] = {
                    ["command"] = "clippy"
                }
            },
        },
        -- ...
    },
    ---@type RustaceanDapOpts
    dap = {
        autoload_configurations = true,
        -- ...
    },
}
