return {
    lazy = true,
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = {} })
        require("config.snippets")
        source_custom_snipptets()
    end,
    enabled = true,
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
}
