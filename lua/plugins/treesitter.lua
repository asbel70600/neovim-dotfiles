return {
    {
        "romus204/tree-sitter-manager.nvim",
        cmd = { "TSManager" },
        config = function()
            require("tree-sitter-manager").setup({
                -- Default Options
                -- ensure_installed = {}, -- list of parsers to install at the start of a neovim session
                -- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
                -- auto_install = false, -- if enabled, install missing parsers when editing a new file
                -- highlight = true, -- treesitter highlighting is enabled by default
                -- languages = {}, -- override or add new parser sources
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        init = function()
            vim.g.no_plugin_maps = true
        end,

        config = function()
            require("nvim-treesitter-textobjects").setup {
                select = {
                    include_surrounding_whitespace = false,
                    lookahead = true,
                    selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'V',  -- linewise
                        ['@function.inner'] = 'V',  -- linewise
                        -- ['@class.outer'] = '<c-v>', -- blockwise
                    },
                },
                move = { set_jumps = true }
            }

            local select_textobject = require("nvim-treesitter-textobjects.select").select_textobject
            local goto_next_start = require("nvim-treesitter-textobjects.move").goto_next_start
            local goto_prev_start = require("nvim-treesitter-textobjects.move").goto_prev_start
            local so = { "x", "o" }
            local nxo = { "n", "x", "o" }

            local objects = {
                { "af", "@function.outer" },
                { "if", "@function.inner" },
                { "ai", "@conditional.outer" },
                { "ii", "@conditional.inner" },
                { "al", "@loop.outer" },
                { "il", "@loop.inner" },
                { "ap", "@parameter.outer" },
                { "ip", "@parameter.inner" },
                { "ia", "@assignment.outer" },
                { "]",  "@assignment.lhs" },
                { "[",  "@assignment.rhs" },
                { "ir", "@return.inner" },
                { "ar", "@return.outer" },
                { "ib", "@block.inner" },
                { "ab", "@block.outer" },
                { "i/", "@comment.inner" },
                { "a/", "@comment.outer" },
                { "ic", "@call.inner" },
                { "ac", "@call.outer" },
                { "is", "@statement.outer" },
            }

            local next_start = {
                { "]f", "@function.outer",    "Next function start" },
                { "]p", "@parameter.outer",   "Next parameter" },
                { "]a", "@assignment.lhs",    "Next assignment" },
                { "]i", "@conditional.outer", "Next if" },
                { "]l", "@loop.outer",        "Next loop" },
                { "]b", "@block.outer",       "Next block" },
                { "]c", "@call.outer",        "Next call" },
                { "]/", "@comment.outer",     "Next comment" },
                { "]s", "@statement.outer",   "Next statement" },
                { "]r", "@return.outer",      "Next return" },
            }

            local prev_start = {
                { "[f", "@function.outer",    "Previous function" },
                { "[p", "@parameter.outer",   "Previous parameter" },
                { "[a", "@assignment.lhs",    "Previous assignment" },
                { "[i", "@conditional.outer", "Previous if" },
                { "[l", "@loop.outer",        "Previous loop" },
                { "[b", "@block.outer",       "Previous block" },
                { "[c", "@call.outer",        "Previous call" },
                { "[/", "@comment.outer",     "Previous comment" },
                { "[s", "@statement.outer",   "Previous statement" },
                { "[r", "@return.outer",      "Previous return" },
            }

            for _, v in ipairs(objects) do
                vim.keymap.set(so, v[1], function()
                    select_textobject(v[2], "textobjects")
                end)
            end

            for _, v in ipairs(next_start) do
                vim.keymap.set(nxo, v[1], function()
                    goto_next_start(v[2], "textobjects")
                end, { desc = v[3] })
            end

            for _, v in ipairs(prev_start) do
                vim.keymap.set(nxo, v[1], function()
                    goto_prev_start(v[2], "textobjects")
                end, { desc = v[3] })
            end
        end,
    }
}

-- {
--     "nvim-treesitter/nvim-treesitter-textobjects",
--     branch = "main",
--     event = "BufReadPost",
--     config = function()
--         require("nvim-treesitter-textobjects").setup({
--             select = { lookahead = true },
--             move = { set_jumps = true },
--         })
--
--         local select_textobject = require("nvim-treesitter-textobjects.select").select_textobject
--         local move = require("nvim-treesitter-textobjects.move")
--         local so = { "x", "o" }
--         local nxo = { "n", "x", "o" }
--
--         -- Select textobjects
--         local sel = {
--             { "af", "@function.outer" },
--             { "if", "@function.inner" },
--             { "ai", "@conditional.outer" },
--             { "ii", "@conditional.inner" },
--             { "al", "@loop.outer" },
--             { "il", "@loop.inner" },
--             { "ap", "@parameter.outer" },
--             { "ip", "@parameter.inner" },
--             { "ia", "@assignment.outer" },
--             { "]",  "@assignment.lhs" },
--             { "[",  "@assignment.rhs" },
--             { "ir", "@return.inner" },
--             { "ar", "@return.outer" },
--             { "ib", "@block.inner" },
--             { "ab", "@block.outer" },
--             { "i/", "@comment.inner" },
--             { "a/", "@comment.outer" },
--             { "ic", "@call.inner" },
--             { "ac", "@call.outer" },
--             { "is", "@statement.outer" },
--         }
--         for _, v in ipairs(sel) do
--             vim.keymap.set(so, v[1], function()
--                 select_textobject(v[2], "textobjects")
--             end)
--         end
--
--
--         -- Move: next start
--         local next_start = {
--             { "]f", "@function.outer",    "Next function start" },
--             { "]p", "@parameter.outer",   "Next parameter" },
--             { "]a", "@assignment.lhs",    "Next assignment" },
--             { "]i", "@conditional.outer", "Next if" },
--             { "]l", "@loop.outer",        "Next loop" },
--             { "]b", "@block.outer",       "Next block" },
--             { "]c", "@call.outer",        "Next call" },
--             { "]/", "@comment.outer",     "Next comment" },
--             { "]s", "@statement.outer",   "Next statement" },
--             { "]r", "@return.outer",      "Next return" },
--         }
--         for _, v in ipairs(next_start) do
--             vim.keymap.set(nxo, v[1], function()
--                 move.goto_next_start(v[2])
--             end, { desc = v[3] })
--         end
--
--         -- Move: previous start
--         local prev_start = {
--             { "[f", "@function.outer",    "Previous function" },
--             { "[p", "@parameter.outer",   "Previous parameter" },
--             { "[a", "@assignment.lhs",    "Previous assignment" },
--             { "[i", "@conditional.outer", "Previous if" },
--             { "[l", "@loop.outer",        "Previous loop" },
--             { "[b", "@block.outer",       "Previous block" },
--             { "[c", "@call.outer",        "Previous call" },
--             { "[/", "@comment.outer",     "Previous comment" },
--             { "[s", "@statement.outer",   "Previous statement" },
--             { "[r", "@return.outer",      "Previous return" },
--         }
--         for _, v in ipairs(prev_start) do
--             vim.keymap.set(nxo, v[1], function()
--                 move.goto_previous_start(v[2])
--             end, { desc = v[3] })
--         end
--     end,
-- }
