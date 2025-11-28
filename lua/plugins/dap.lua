return {
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        dependencies = {
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
            "igorlfs/nvim-dap-view",
        },
        keys = {
            {
                "<leader>db",
                function()
                    require("dap").toggle_breakpoint()
                end,
            },

            {
                "<leader>dc",
                function()
                    require("dap").continue()
                end,
                desc = "Continue",
            },
        },
        config = function()
            local dap, dv = require("dap"), require("dap-view")

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

            -- dap.listeners.before.attach["dap-view-config"] = function()
            --     dv.open()
            -- end
            -- dap.listeners.before.launch["dap-view-config"] = function()
            --     dv.open()
            -- end
            -- dap.listeners.before.event_terminated["dap-view-config"] = function()
            --     dv.close()
            -- end
            -- dap.listeners.before.event_exited["dap-view-config"] = function()
            --     dv.close()
            -- end

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
