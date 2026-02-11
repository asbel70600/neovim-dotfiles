return {
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        config = function()
            require("crates").setup({})
        end,
    },
    {
        enabled = false,
        "mrcjkb/rustaceanvim",
        dependencies = { "j-hui/fidget.nvim" },
        version = "^6",
        ft = { "rust" },
        event = { "Bufread Cargo.toml" }
    },
    {
        enabled = false,
        "cordx56/rustowl",
        version = "*", -- Latest stable version
        ft = { "rust" },
        opts = {},
    },
}
