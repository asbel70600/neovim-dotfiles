require("mappings")

return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
            modules = {},
            sync_install = false,
            auto_install = false,
            ignore_install = {},
            -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
            highlight = {
                enable = true,
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
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
                        ["]f"] = { query = "@function.outer", desc = "Next Function Start"},
                        ["]s"] = { query = "@scope", desc = "Next scope" },
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
                        ["[f"] = { query = "@function.outer", desc = "Previous function"},
                        ["[s"] = { query = "@scope", desc = "Previous function" },
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
    end,
    enabled = true,
}
