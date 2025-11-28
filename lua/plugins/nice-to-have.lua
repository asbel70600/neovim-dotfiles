return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            disable_filetype = { "TelescopePrompt", "vim" },
        },
    },
    {
        "folke/flash.nvim",
        keys = {
            { "<C-s>", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "[Flash] jump" },
            { "\\",    mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "[Flash] node selection" },
        },
    },
    {
        "folke/todo-comments.nvim",
        event = { "LspAttach" },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            keywords = {
                BUG = { icon = "", color = "error" },
                ERROR = { icon = "🔎", color = "error" },
                WTF = { icon = "🤬", color = "error" },
                TODO = { icon = " ", color = "info" },
                HACK = { icon = " ", color = "warning" },
                WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
                TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
            },
            signs = false,
        },
    },
    {
        "mikavilpas/yazi.nvim",
        keys = {
            { "<leader>;", function() require("yazi").yazi() end,                     desc = "[Yazi] open in file's cwd" },
            { "<leader>:", function() require("yazi").yazi(nil, vim.fn.getcwd()) end, desc = "[Yazi] open in nvim's cwd" },
            { "<C-;>",     function() require("yazi").toggle() end,                   desc = "[Yazi] toggle" },
        },
        opts = { open_for_directories = true },
    },
    {
        "tpope/vim-fugitive",
        dependencies = { "stevearc/dressing.nvim" },
        keys = {
            { "<leader>gs", mode = { "n" }, function() vim.cmd [[Git]] end,         desc = "[Git] status" },
            { "<leader>gd", mode = { "n" }, function() vim.cmd [[Gdiffsplit]] end,  desc = "[Git] diff" },
            { "<leader>gb", mode = { "n" }, function() vim.cmd [[Git blame]] end,   desc = "[Git] blame" },
            { "<leader>gc", mode = { "n" }, function() vim.cmd [[Git commit]] end,  desc = "[Git] commit" },
            { "<leader>gm", mode = { "n" }, function() vim.cmd [[Gdiffsplit!]] end, desc = "[Git] merge (3-way)" },
        },
        init = function()
            vim.api.nvim_create_autocmd("User", {
                pattern = "FugitiveIndex",
                callback = function()
                    vim.keymap.set("n", "gh", ":diffget //2<CR>", { buffer = true })
                    vim.keymap.set("n", "gl", ":diffget //3<CR>", { buffer = true })
                end,
            })
        end,
    },
    {
        "jedrzejboczar/exrc.nvim",
        config = function()
            require("exrc").setup({
                exrc_name = ".nvim.lua",
                on_vim_enter = true,
                on_dir_changed = {
                    enabled = true,
                    use_ui_select = false,
                },
                trust_on_write = true,
                use_telescope = true,
                min_log_level = vim.log.levels.DEBUG,
                lsp = {
                    auto_setup = false,
                },
                commands = {
                    instant_edit_single = true,
                },
            })
        end,
    },
}
