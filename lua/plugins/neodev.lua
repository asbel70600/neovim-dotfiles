return {
    "folke/lazydev.nvim",
    event = { "User NvimConfigOpened" },
    opts = {
        library = {
            "LazyVim",
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            { path = "LazyVim",            words = { "LazyVim" } },
            -- Load the wezterm types when the `wezterm` module is required
            -- Needs `justinsgithub/wezterm-types` to be installed
            -- { path = "wezterm-types", mods = { "wezterm" } },
            -- Load the xmake types when opening file named `xmake.lua`
            -- Needs `LelouchHe/xmake-luals-addon` to be installed
            -- { path = "xmake-luals-addon/library", files = { "xmake.lua" } },
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
    },
}
