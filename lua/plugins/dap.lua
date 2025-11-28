return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
            "igorlfs/nvim-dap-view",
        },
        keys = {
            { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "[DAP] toggle breakpoint" },
            { "<leader>dc", function() require("dap").continue() end,          desc = "[DAP] continue or run", },
        },
        config = function()
            local dap, _ = require("dap"), require("dap-view")

            local adapters = {
                php_dbg = {
                    type = "executable",
                    command = "/home/asbel/.xdg/local/share/nvim/mason/bin/php-debug-adapter",
                },
                codelldb = {
                    type = "executable",
                    command = "/usr/bin/lldb-dap",
                    args = { "-p", "9000" },
                },
            }

            local configurations = {
                php = {
                    {
                        type = "php",
                        request = "launch",
                        name = "Basic Debug",
                        port = 9003,
                    },
                    {
                        type = "php",
                        request = "launch",
                        name = "Debug Laravel",
                        program = "${workspaceFolder}/artisan",
                        args = { "serve" },
                        port = 9003,
                    },
                },
                rust = {
                    {
                        type = "rust_debugger",
                        request = "launch",
                        name = "Basic Debug",
                        port = 9003,
                        program = "cargo",
                        args = { "run" },
                    },
                },
            }

            for name, adapter in ipairs(adapters) do
                dap.adapters[name] = adapter
            end

            for lang, config in ipairs(configurations) do
                dap.configurations[lang] = config
            end

            require("plugins.mappings.dap")
        end,
    },
}
