return {
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            { "<leader>fd", function() require("telescope").extensions.zoxide.list() end, desc = "[Telescope] open zoxide list" },
            { "<leader>fo", require("telescope.builtin").oldfiles,                        desc = "[Telescope] open oldfiles" },
            { "<leader>ff", require("telescope.builtin").find_files,                      desc = "[Telescope] open oldfiles" },
        },

        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
            "nvim-telescope/telescope.nvim",
            "jvgrootveld/telescope-zoxide",
        },
        lazy = true,
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            local go_and_update = function(selection)
                os.execute("zoxide add " .. selection.path)
                vim.cmd("tcd " .. selection.path)
            end

            local after_action = function(selection)
                vim.cmd("Telescope find_files")
                vim.notify("Directory changed to " .. selection.path)
            end
            telescope.setup({
                extensions = {
                    zoxide = {
                        mappings = {
                            ["C-t"] = {
                                action = function(selection)
                                    go_and_update()
                                end,
                                after_action = after_action,
                            },
                            default = {
                                action = function(selection)
                                    if not vim.g.zoxide_used then
                                        go_and_update(selection)
                                        vim.g.zoxide_used = true
                                    else
                                        vim.cmd.tabnew()
                                        go_and_update(selection)
                                        vim.g.zoxide_used = true
                                    end
                                end,
                                after_action = after_action,
                            },
                        },
                    },
                    fzf = {
                        case_mode = "smart_case",
                    },
                },
                pickers = {
                    find_files = {
                        theme = "ivy",
                    },
                    commands = {
                        theme = "ivy",
                    },
                },
                defaults = {
                    mappings = {
                        i = {
                            ["<C-s>"] = actions.select_horizontal,
                            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                            ["<C-S-q>"] = actions.send_selected_to_loclist + actions.open_qflist,

                            ["<C-h>"] = actions.preview_scrolling_left,
                            ["<C-l>"] = actions.preview_scrolling_right,

                            ["<C-S-h>"] = actions.results_scrolling_left,
                            ["<C-S-l>"] = actions.results_scrolling_right,

                            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        },
                    },
                },
            })

            require("telescope").load_extension("fzf")
            require("telescope").load_extension("zoxide")
            require("telescope").load_extension("todo-comments")
            require("plugins.mappings.telescope")

            TELESCOPE_PLUGGED = true
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        lazy = true,
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
}
