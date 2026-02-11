return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
                modules = {},
                sync_install = false,
                auto_install = false,
                ignore_install = {},
                indent = {
                    enable = true,
                },

                highlight = {
                    enable = true,
                    disable = function(_, buf)
                        local max_filesize = 1024 * 1024
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = false,
                },

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<Leader>ss",
                        node_incremental = "<Leader>si",
                        node_decremental = "<Leader>sd",
                        scope_incremental = false,
                    },
                },

                textobjects = {
                    select = {
                        lookahead = true,
                        enable = true,
                        keymaps = {
                            -- ask gpt for exercises to master this keymaps
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",

                            ["ai"] = "@conditional.outer",
                            ["ii"] = "@conditional.inner",

                            ["al"] = "@loop.outer",
                            ["il"] = "@loop.inner",

                            ["ap"] = "@parameter.outer",
                            ["ip"] = "@parameter.inner",

                            ["ia"] = "@assignment.outer",
                            -- ["ia"] = "@assignment.inner",

                            ["]"] = "@assignment.lhs",
                            ["["] = "@assignment.rhs",

                            ["ir"] = "@return.inner",
                            ["ar"] = "@return.outer",

                            ["ib"] = "@block.inner",
                            ["ab"] = "@block.outer",

                            ["i/"] = "@comment.inner",
                            ["a/"] = "@comment.outer",

                            ["ic"] = "@call.inner",
                            ["ac"] = "@call.outer",

                            ["is"] = "@statement.outer",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]f"] = { query = "@function.outer", desc = "Next Function Start" },
                            ["]p"] = { query = "@parameter.outer", desc = "Next parameter" },
                            ["]a"] = { query = "@assignment.lhs", desc = "Next assignment" },
                            ["]i"] = { query = "@conditional.outer", desc = "Next if" },
                            ["]l"] = { query = "@loop.outer", desc = "Next loop" },
                            ["]b"] = { query = "@block.outer", desc = "Next block" },
                            -- ["]c"] = { query = "@call.outer", desc = "Next call" },
                            ["]/"] = { query = "@comment.outer", desc = "Next comment" },
                            ["]s"] = { query = "@statement.outer", desc = "Next statement" },
                            ["]r"] = { query = "@return.outer", desc = "Next return" },
                        },
                        goto_previous_start = {
                            ["[f"] = { query = "@function.outer", desc = "Previous function" },
                            ["[p"] = { query = "@parameter.outer", desc = "Previous parameter" },
                            ["[a"] = { query = "@assignment.lhs", desc = "Previous assignment" },
                            ["[i"] = { query = "@conditional.outer", desc = "Previous if" },
                            ["[l"] = { query = "@loop.outer", desc = "Previous loop" },
                            ["[b"] = { query = "@block.outer", desc = "Next block" },
                            -- ["[c"] = { query = "@call.outer", desc = "Next call" },
                            ["[/"] = { query = "@comment.outer", desc = "Next comment" },
                            ["[s"] = { query = "@statement.outer", desc = "Next statement" },
                            ["[r"] = { query = "@return.outer", desc = "Next return" },
                        },
                    },
                },
            })

            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.blade = {
                install_info = {
                    url = "https://github.com/EmranMR/tree-sitter-blade",
                    files = { "src/parser.c" },
                    branch = "main",
                },
                filetype = "blade",
            }
        end,
        branch = "master",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-textobjects" },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        lazy = true,
    },
}
