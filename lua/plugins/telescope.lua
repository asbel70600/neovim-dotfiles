return {
    {
        "nvim-telescope/telescope.nvim",
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
                frecency = {
                    auto_validate = false,
                },
            },
        },
        config = function()
            require("telescope").load_extension("recent_files")
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("workspaces")
            require("telescope").setup({
                defaults = {
                    theme = "ivy",
                    mappings = {
                        i = {
                            ["<C-h>"] = "which_key",
                        },
                    },
                    --                 layout_strategy = "bottom_pane",
                    --                 layout_config = {
                    --                     height = 0.95,
                    --                     width = 0.90,
                    --                 },
                },
                pickers = {
                    find_files = {
                        theme = "ivy",
                    },
                    live_grep = {
                        theme = "ivy",
                    },
                    grep_string = {
                        theme = "ivy",
                    },
                },
            })

            require("mappings")
            MY_KEYMAPS.OnTelescopeReady()
        end,
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        enabled = true,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        dependencies = { "nvim-telescope/telescope.nvim" },
        enabled = true,
    },
    {

        "nvim-telescope/telescope-ui-select.nvim",

        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
                },
            })
        end,

        enabled = true,
    },
    {
        "smartpde/telescope-recent-files",
        dependencies = { "nvim-telescope/telescope.nvim" },
        enabled = true,
    },
}
