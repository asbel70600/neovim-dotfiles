return {
    "adalessa/laravel.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "tpope/vim-dotenv",
        "MunifTanjim/nui.nvim",
        "nvimtools/none-ls.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
        { "<leader>La", ":Laravel artisan<cr>" },
        { "<leader>Lr", ":Laravel routes<cr>" },
        { "<leader>Lm", ":Laravel related<cr>" },
    },
    ft={"php"},
    config = true,
}
