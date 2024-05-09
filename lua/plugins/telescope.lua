return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case", -- or 'ignore_case' or 'respect_case'
            },
            workspaces = {
                keep_insert = true,
            },

            ["ui-select"] = {},
        },
    },
    config = function()
        require("telescope").load_extension("recent_files")
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("ui-select")
        require("telescope").load_extension("workspaces")

        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-h>"] = "which_key",
                    },
                },
                layout_strategy = "bottom_pane",
                layout_config = {
                    height = 0.95,
                    width = 0.90,
                },
            },
        })

    end,
}
