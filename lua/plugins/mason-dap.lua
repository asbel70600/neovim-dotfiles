return {
    lazy = true,
    config = function()
        require("mason").setup()
        require("mason-nvim-dap").setup({
            automatic_installation = false,
            ensure_installed = {},
            handlers = {
                function(config)
                    require("mason-nvim-dap").default_setup(config)
                end,

                python = function(config)
                    config.adapters = {
                        type = "executable",
                        command = "/usr/bin/python3",
                        args = {
                            "-m",
                            "debugpy.adapter",
                        },
                    }
                    require("mason-nvim-dap").default_setup(config)
                end,
            },
        })
    end,
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
    },
}
