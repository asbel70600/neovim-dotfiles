return {
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        config = function()
            require("crates").setup({})
        end,
    },
    { "j-hui/fidget.nvim", event = { "LspAttach", "BufReadPre" }, opts = {} },
    {
        "mrcjkb/rustaceanvim",
        dependencies = { "j-hui/fidget.nvim" },
        version = "^6",
        ft = { "rust" },
    },
    {
        "cordx56/rustowl",
        version = "*", -- Latest stable version
        ft = { "rust" },
        opts = {},
        enabled = false,
    },
}
