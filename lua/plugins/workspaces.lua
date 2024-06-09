-- https://github.com/natecraddock/workspaces.nvim
return {
    "natecraddock/workspaces.nvim",
    opts = {
        path = vim.fn.stdpath("data") .. "/workspaces", -- ~/.local/share/nvim/workspaces
        cd_type = "global", -- Global local or tab
        sort = true,
        -- Sort by recent use rather than by name. Requires sort to be true
        mru_sort = true,
        auto_open = true,
        notify_info = true,
        hooks = {
            add = {},
            remove = {},
            rename = {},
            open_pre = {},
            open = {},
        },
    },
    enabled = true,
    event = "VeryLazy",
}
