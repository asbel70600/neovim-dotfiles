vim.api.nvim_create_autocmd("TermEnter", { command = [[set timeoutlen=100]] })
vim.api.nvim_create_autocmd("TermLeave", { command = [[set timeoutlen=800]] })

vim.api.nvim_create_autocmd("CmdlineEnter", { command = [[set hlsearch]] })
vim.api.nvim_create_autocmd("CmdlineLeave", { command = [[set nohlsearch]] })

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "highlight when yanking text",
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- vim.api.nvim_create_autocmd("UIEnter", {
--     callback = function()
--         require("telescope").extensions.zoxide.list({
--             border = false,
--             layout_config = {
--                 height = 25,
--             },
--             layout_strategy = "bottom_pane",
--             sorting_strategy = "ascending",
--             theme = "ivy",
--         })
--     end,
-- })
