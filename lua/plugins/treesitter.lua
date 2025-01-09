local MY_KEYMAPS = {}

MY_KEYMAPS.treesitterSelectionKeymaps = {
    init_selection = "<Leader>ss",
    node_incremental = "<Leader>si",
    node_decremental = "<Leader>sd",
    scope_incremental = "<Leader>so",
}

MY_KEYMAPS.treesitterTextObjectKeymaps = {

    ["af"] = "@function.outer",
    ["if"] = "@function.inner",

    ["ai"] = "@conditional.outer",
    ["ii"] = "@conditional.inner",

    ["al"] = "@loop.outer",
    ["il"] = "@loop.inner",

    ["ap"] = "@parameter.outer",
    ["ip"] = "@parameter.inner",

    ["ar"] = "@return.outer",
    ["ir"] = "@return.inner",

    ["aa"] = "@assignment.outer",
    ["iah"] = "@assignment.lhs",
    ["ial"] = "@assignment.rhs",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
                modules = {},
                sync_install = false,
                auto_install = false,
                ignore_install = {},
                highlight = {
                    enable = true,
                    -- disable = function(lang, buf)
                    --     local max_filesize = 100 * 1024 -- 100 KB
                    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    --     if ok and stats and stats.size > max_filesize then
                    --         return true
                    --     end
                    -- end,
                    -- -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = MY_KEYMAPS.treesitterSelectionKeymaps,
                },
                indent = {
                    enable = true,
                },
                textobjects = {
                    select = {
                        lookahead = true,
                        enable = true,
                        keymaps = MY_KEYMAPS.treesitterTextObjectKeymaps,
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
                            ["]r"] = { query = "@return.outer", desc = "Next return" },
                            -- ["]o"] = "@loop.*",
                            -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
                            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                        },
                        goto_next_end = {
                            -- ["]M"] = "@function.outer",
                            -- ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[f"] = { query = "@function.outer", desc = "Previous function" },
                            ["[p"] = { query = "@parameter.outer", desc = "Previous parameter" },
                            ["[a"] = { query = "@assignment.lhs", desc = "Previous assignment" },
                            ["[i"] = { query = "@conditional.outer", desc = "Previous if" },
                            ["[l"] = { query = "@loop.outer", desc = "Previous loop" },
                            ["[r"] = { query = "@return.outer", desc = "Previous return" },
                        },
                        goto_previous_end = {
                            -- ["[M"] = "@function.outer",
                            -- ["[]"] = "@class.outer",
                        },
                        -- Below will go to either the start or the end, whichever is closer.
                        -- Use if you want more granular movements
                        -- Make it even more gradual by adding multiple queries and regex.
                        goto_next = {
                            -- ["]d"] = "@conditional.outer",
                        },
                        goto_previous = {
                            -- ["[d"] = "@conditional.outer",
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
        enabled = true,
    },
    {
        event = "VeryLazy",
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        enabled = true,
    },
}

-- vim: foldlevel=4
