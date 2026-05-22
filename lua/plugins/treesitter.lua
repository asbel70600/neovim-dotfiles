return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "BufReadPost",
    config = function()
        require("nvim-treesitter-textobjects").setup({
            select = { lookahead = true },
            move = { set_jumps = true },
        })

        local select = require("nvim-treesitter-textobjects.select")
        local move = require("nvim-treesitter-textobjects.move")
        local so = { "x", "o" }
        local nxo = { "n", "x", "o" }

        -- Select textobjects
        local sel = {
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
        for _, v in ipairs(sel) do
            vim.keymap.set(so, v[1], function()
                select.select_textobject(v[2], "textobjects")
            end)
        end

        -- Move: next start
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
        for _, v in ipairs(next_start) do
            vim.keymap.set(nxo, v[1], function()
                move.goto_next_start(v[2])
            end, { desc = v[3] })
        end

        -- Move: previous start
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
        for _, v in ipairs(prev_start) do
            vim.keymap.set(nxo, v[1], function()
                move.goto_previous_start(v[2])
            end, { desc = v[3] })
        end
    end,
}
