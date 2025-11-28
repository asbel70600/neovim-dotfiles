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
            { "<leader>gs", mode = { "n" }, function() vim.cmd [[Git]] end,           desc = "[Git] status" },
            { "<leader>gd", mode = { "n" }, function() vim.cmd [[Gvdiffsplit]] end,   desc = "[Git] diff" },
            { "<leader>gm", mode = { "n" }, function() vim.cmd [[Gvdiffsplit!]] end,  desc = "[Git] merge (3-way)" },
            { "<leader>gb", mode = { "n" }, function() vim.cmd [[Git checkout ]] end, desc = "[Git] blame" },
            { "<leader>gB", mode = { "n" }, function() vim.cmd [[Git branch ]] end,   desc = "[Git] blame" },
            { "<leader>gc", mode = { "n" }, function() vim.cmd [[Git commit]] end,    desc = "[Git] commit" },
            { "<leader>gS", mode = { "n" }, function() vim.cmd [[Git add %]] end,     desc = "[Git] status" },
        },
        init = function()
            vim.api.nvim_create_user_command("Mergetool", function()
                local conflicts = vim.fn.systemlist('git diff --name-only --diff-filter=U')

                if #conflicts == 0 then
                    print("No conflicts found")
                    return
                end

                local initial_buf = vim.api.nvim_get_current_buf()
                local initial_buf_name = vim.api.nvim_buf_get_name(initial_buf)

                for _, file in ipairs(conflicts) do
                    vim.cmd('tabedit ' .. file)
                    vim.cmd('Gvdiffsplit!')

                    local wins = vim.api.nvim_tabpage_list_wins(0)
                    vim.api.nvim_set_current_win(wins[2])
                    vim.cmd('wincmd J')

                    -- Keymaps and stuff
                    local buffers = {}
                    for _, win in ipairs(wins) do
                        table.insert(buffers, vim.api.nvim_win_get_buf(win))
                    end

                    local working_buf = buffers[2]

                    vim.keymap.set('n', 'gh', function()
                        vim.cmd('diffget ' .. buffers[1])
                    end, { buffer = working_buf })

                    vim.keymap.set('n', 'gl', function()
                        vim.cmd('diffget ' .. buffers[3])
                    end, { buffer = working_buf })
                end

                -- Close the initial buffer only if it's unnamed and empty
                if initial_buf_name == '' and vim.api.nvim_buf_get_option(initial_buf, 'modified') == false then
                    vim.api.nvim_buf_delete(initial_buf, { force = true })
                end
            end, { desc = "Run when need to solve merge conflicts" })
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
