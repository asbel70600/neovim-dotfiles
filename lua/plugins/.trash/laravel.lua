return {
  "adalessa/laravel.nvim",
  dependencies = {
    "tpope/vim-dotenv",
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    "kevinhwang91/promise-async",
  },
  cmd = { "Laravel" },
  keys = {
    { "<leader>aa", ":Laravel artisan<cr>" },
    { "<leader>ar", ":Laravel routes<cr>" },
    { "<leader>am", ":Laravel related<cr>" },
  },
  event = { "VeryLazy" },
  opts = {},
  config = true,
}
