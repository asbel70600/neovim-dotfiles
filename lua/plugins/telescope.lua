return {
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            { "<S-CR>", function() require("telescope.builtin").builtin() end, "n", },
            { "<Leader>ff", function() require("telescope.builtin").find_files() end, "n", },
            { "<Leader>fo", function() require("telescope.builtin").oldfiles() end, "n", },
            { "<Leader>fw", "<cmd>Telescope workspaces<cr>", "n" },
            { "<Leader>fg", function() require("telescope.builtin").live_grep() end, "n", },
            { "<Leader>fa", function() require("telescope.builtin").current_buffer_fuzzy_find() end, "n", },
            { "<Leader>fc", function() require("telescope.builtin").command_history() end, "n", },
            { "<Leader>fs", function() require("telescope.builtin").grep_string() end, "n", },
            { "<Leader>fh", function() require("telescope.builtin").help_tags() end, "n", },
            { "<leader>fd", function() require("telescope").extensions.zoxide.list() end, "n", },
        },
        config = function()
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("workspaces")
            require("telescope").load_extension("zoxide")
            require("telescope").setup({
                defaults = {
                    theme = "ivy",
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
                    old_files = {
                        theme = "dropdown", -- Optional: can be 'dropdown', 'ivy', etc.
                        previewer = true, -- Optional: disables the file preview to save space
                        layout_config = {
                            height = 0.5, -- Adjust height as needed
                            width = 0.75, -- Adjust width as needed
                            preview_cutoff = 120, -- When the preview should be cut off
                            results_height = 30,
                        },
                    },
                },
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
                    zoxide = {
                        prompt_title = "[ Walking on the shoulders of TJ ]",
                    },
                },
            })
        end,
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "jvgrootveld/telescope-zoxide",
        },
        enabled = true,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        dependencies = { "nvim-telescope/telescope.nvim" },
        enabled = true,
        lazy = true,
    },
}

-- Default mappings
-- Action	Description	Command executed
-- <CR>	Change current directory to selection	cd <path>
-- <C-t>	Change current tab's directory to selection	tcd <path>
-- <C-s>	Open selection in a split	split <path>
-- <C-v>	Open selection in a vertical split	vsplit <path>
-- <C-e>	Open selection in current window	edit <path>
-- <C-b>	Open selection in telescope's builtin.file_browser	builtin.file_browser({ cwd = selection.path })
-- <C-f>	Open selection in telescope's builtin.find_files	builtin.find_files({ cwd = selection.path })

-- vim: foldlevel=4
