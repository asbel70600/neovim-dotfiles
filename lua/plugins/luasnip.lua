return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()

        require("mappings")
        MY_KEYMAPS.OnLuasnipAttach()

        require("snippets")
        source_custom_snipptets()
    end,
    enabled = true,
}
