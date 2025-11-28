return {
    {
        "thesimonho/kanagawa-paper.nvim",
        lazy = true,
    },
    {
        "yorik1984/newpaper.nvim",
        lazy = true,
        opts = { style = "dark" },
    },
    {
        "neanias/everforest-nvim",
        lazy = true,
        version = false,
        opts = {
            background = "soft",
            italics = true,
        },
        config = function() end,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
        opts = {
            comile = true,
            theme = "dragon",
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = {},
            typeStyle = { bold = true },
            background = {
                dark = "dragon",
                light = "lotus",
            },
        },
    },
}
