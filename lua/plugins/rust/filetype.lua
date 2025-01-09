local bufnr = vim.api.nvim_get_current_buf()


vim.keymap.set("n", "<leader>ca", function()
    vim.cmd.RustLsp("codeAction")
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "K", function()
    vim.cmd.RustLsp("hover","range")
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "F5", function()
    vim.cmd.RustLsp('run')
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader>ds", function()
    vim.cmd.RustLsp("debuggables")
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd.RustLsp("explainError")
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader>dr", function()
    vim.cmd.RustLsp("renderDiagnostic")
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader>K", function()
    vim.cmd.RustLsp('openDocs')
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "J", function()
    vim.cmd.RustLsp('joinLines')
end, { silent = true, buffer = bufnr })

vim.opt.makeprg = "cargo run"

-- vim.keymap.set("n", "<leader>fo", function()
--     vim.cmd.RustLsp('workspaceSymbol')
-- end, { silent = true, buffer = bufnr })
-- 
-- vim.keymap.set("n", "<leader>", function()
-- 
-- end, { silent = true, buffer = bufnr })
-- 
-- vim.keymap.set("n", "<leader>", function()
-- 
-- end, { silent = true, buffer = bufnr })
-- vim.keymap.set("n", "<leader>", function()
-- 
-- end, { silent = true, buffer = bufnr })
-- vim.keymap.set("n", "<leader>", function()
-- 
-- end, { silent = true, buffer = bufnr })
