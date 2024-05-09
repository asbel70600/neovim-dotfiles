vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return{
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        view = {
            width = 30,
        },
        renderer = {
            full_name = true,
            highlight_git = "icon",
        },
        diagnostics = { enable = true },
        git = { enable = true },
        hijack_cursor = true,
        sync_root_with_cwd = true,
    },
--     opts = {
--         sort = {
--             sorter = "case_sensitive",
--         },
--         view = {
--             width = 30,
--         },
--         renderer = {
--             group_empty = true,
--         },
--         filters = {
--             dotfiles = true,
--         }
--     }
}
