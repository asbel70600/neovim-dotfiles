return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = { "Telescope", "TelescopeDiag", "TelescopePluginFiles", "TelescopePluginSpecs" },
        keys = {
            { "<C-P>",      function() require("telescope.builtin").commands() end,                  desc = "[Telescope] commands" },
            { "<C-S-P>",    function() require("telescope.builtin").builtin() end,                   desc = "[Telescope] find all commands" },
            { "<leader>fd", function() require("telescope").extensions.zoxide.list() end,            desc = "[Telescope] open zoxide list" },
            { "<leader>fo", function() require("telescope.builtin").oldfiles() end,                  desc = "[Telescope] open oldfiles" },
            { "<leader>ff", function() require("telescope.builtin").find_files() end,                desc = "[Telescope] open oldfiles" },
            { "<Leader>fg", function() require("telescope.builtin").live_grep() end,                 desc = "[Telescope] live grep" },
            { "<Leader>fa", function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "[Telescope] fuzzy find" },
            { "<Leader>fh", function() require("telescope.builtin").help_tags() end,                 desc = "[Telescope] help" },
            {
                "<leader><leader>",
                function()
                    require("telescope.builtin").buffers({
                        only_cwd = true,
                        ignore_current_buffer = true,
                        sort_mru = true,
                    })
                end,
                desc = "[Telescope] buffers"
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
            "nvim-telescope/telescope.nvim",
            "jvgrootveld/telescope-zoxide",
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")
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
                    fd = {
                        theme = "ivy",
                    },
                    commands = {
                        theme = "dropdown",
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
            require("telescope").load_extension("fidget")

            local function find_plugin_file()
                builtin.find_files({
                    cwd = require("lazy.core.config").options.root,
                })
            end

            local function find_plugin_spec()
                local files = {} ---@type table<string, string>
                for _, plugin in pairs(require("lazy.core.config").plugins) do
                    repeat
                        if plugin._.module then
                            local info = vim.loader.find(plugin._.module)[1]
                            if info then
                                files[info.modpath] = info.modpath
                            end
                        end
                        plugin = plugin._.super
                    until not plugin
                end
                builtin.live_grep({
                    default_text = "/",
                    search_dirs = vim.tbl_values(files),
                })
            end

            vim.api.nvim_create_user_command("TelescopePluginFiles", find_plugin_file,
                { desc = "[Telescope] find plugin files" })
            vim.api.nvim_create_user_command("TelescopePluginSpecs", find_plugin_spec,
                { desc = "[Telescope] find plugin declarations" })
            vim.api.nvim_create_user_command("TelescopeDiag", builtin.diagnostics,
                { desc = "[Telescope] open buitins from telescope" })
            vim.api.nvim_create_user_command("TelescopeMan", builtin.man_pages,
                { desc = "[Telescope] find man pages" })
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        lazy = true,
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
}
