return {
    lazy = true,
    keys = {
        {
            "<A-TAB>",
            function()
                require("luasnip").jump(1)
            end,
            mode = { "i", "s" },
        },
        {
            "<S-A-TAB>",
            function()
                require("luasnip").jump(-1)
            end,
            mode = { "i", "s" },
        },
        {
            "<C-.>",
            function()
                require("luasnip").jump(1)
            end,
            mode = { "i", "s" },
        },
    },
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("config.snippets")
        source_custom_snipptets()
    end,
    enabled = true,
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
}
