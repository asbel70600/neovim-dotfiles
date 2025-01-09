return {
    {
        lazy = true,
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
    },
    {
        lazy = true,
        "mfussenegger/nvim-dap",
        keys = {
            {
                "<F5>",
                function()
                    require("dap").continue()
                end,
                mode = "n",
            },
            {
                "<F10>",
                function()
                    require("dap").step_over()
                end,
                mode = "n",
            },
            {
                "<F11>",
                function()
                    require("dap").step_into()
                end,
                mode = "n",
            },
            {
                "<F12>",
                function()
                    require("dap").step_out()
                end,
                mode = "n",
            },
            {
                "<Leader>db",
                function()
                    require("dap").toggle_breakpoint()
                end,
                mode = "n",
            },
            {
                "<Leader>dm",
                function()
                    require("dap").set_breakpoint()
                end,
                mode = "n",
            },
            {
                "<Leader>dh",
                function()
                    require("dap.ui.widgets").hover()
                end,
                mode = { "n", "v" },
            },
            {
                "<Leader>dp",
                function()
                    require("dap.ui.widgets").preview()
                end,
                mode = { "n", "v" },
            },
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },
}

-- vim: foldlevel=3
