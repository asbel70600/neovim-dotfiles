return {
    lazy = true,
    "natecraddock/workspaces.nvim",
    opts = {
        path = vim.fn.stdpath("data") .. "/workspaces", -- ~/.local/share/nvim/workspaces
        cd_type = "tab", -- Global local or tab
    },
    enabled = true,
}
