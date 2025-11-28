local bufnr = vim.api.nvim_get_current_buf()

-- vim.keymap.del("n", "]d", { buffer = bufnr })
-- vim.keymap.del("n", "[d", { buffer = bufnr })
-- vim.keymap.del("n", "<leader>a", { buffer = bufnr })
-- vim.keymap.del("n", "J", { buffer = bufnr })
-- vim.keymap.del("v", "J", { buffer = bufnr })
-- vim.keymap.del("n", "K", { buffer = bufnr })
-- vim.keymap.del("v", "K", { buffer = bufnr })
--
vim.keymap.set("n", "<leader>a", function()
    vim.cmd.RustLsp("codeAction")
end, { silent = true, buffer = bufnr })

vim.keymap.set({ "n", "v" }, "J", function()
    vim.cmd.RustLsp("joinLines")
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "K", function()
    vim.cmd.RustLsp({ "hover", "actions" })
end, { silent = true, buffer = bufnr })

vim.keymap.set("v", "K", function()
    vim.cmd.RustLsp({ "hover", "range" })
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "]d", function()
    vim.cmd.RustLsp({ "renderDiagnostic", "cycle" })
end)

vim.keymap.set("n", "[d", function()
    vim.cmd.RustLsp({ "renderDiagnostic", "cycle_prev" })
end)

vim.keymap.set("n", "<f5>", function()
    vim.cmd.RustLsp("debuggables")
end)

vim.keymap.set("n", "<f1>", function()
    vim.cmd.RustLsp({ "explainError", "cycle" })
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<f2>", function()
    vim.cmd.RustLsp("syntaxTree")
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<f4>", function()
    vim.cmd.RustLsp({ "view", "hir" })
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<f3>", function()
    vim.cmd.RustLsp({ "view", "mir" })
end, { silent = true, buffer = bufnr })

-- vim.api.nvim_create_autocmd("InsertLeave", {
--     callback = function()
--         vim.cmd.write({})
--     end,
-- })

vim.notify("Keyboard setted up")
vim.notify("TO THE SIDES I'M RUSTING")

-- vim.g.rustaceanvim = {
--     tools = {},
--     server = {
--         default_settings = {
--             ["rust-analyzer"] = {
--                 cargo = { allFeatures = true },
--                 completion = {
--                     snippets = {
--                         custom = snippets,
--                     },
--                 },
--                 checkOnSave = { command = "clippy" },
--                 inlayHints = {
--                     implicitDrops = {
--                         enable = true,
--                     },
--                     genericParameterHints = {
--                         lifetime = {
--                             enable = true,
--                         },
--                     },
--                 },
--                 semanticHighlighting = {
--                     operator = { specialization = { enable = true } },
--                     punctuation = { enable = true, separateMacroBang = { enable = true } },
--                 },
--                 assist = {
--                     importEnforceGranularity = true,
--                     importPrefix = "crate",
--                 },
--                 diagnostics = {
--                     enable = true,
--                     styleLints = {
--                         enable = true,
--                     },
--                     experimental = {
--                         enable = true,
--                     },
--                 },
--             },
--         },
--     },
--     dap = {},
-- }
-- local snippets ={
--   "Ok": {
--     "postfix": "ok",
--     "body": "Ok(${receiver})",
--     "description": "Wrap the expression in a `Result::Ok`",
--     "scope": "expr"
--   },
--   "Box::pin": {
--     "postfix": "pinbox",
--     "body": "Box::pin(${receiver})",
--     "requires": "std::boxed::Box",
--     "description": "Put the expression into a pinned `Box`",
--     "scope": "expr"
--   },
--   "Arc::new": {
--     "postfix": "arc",
--     "body": "Arc::new(${receiver})",
--     "requires": "std::sync::Arc",
--     "description": "Put the expression into an `Arc`",
--     "scope": "expr"
--   },
--   "Some": {
--     "postfix": "some",
--     "body": "Some(${receiver})",
--     "description": "Wrap the expression in an `Option::Some`",
--     "scope": "expr"
--   },
--   "Err": {
--     "postfix": "err",
--     "body": "Err(${receiver})",
--     "description": "Wrap the expression in a `Result::Err`",
--     "scope": "expr"
--   },
--   "Rc::new": {
--     "postfix": "rc",
--     "body": "Rc::new(${receiver})",
--     "requires": "std::rc::Rc",
--     "description": "Put the expression into an `Rc`",
--     "scope": "expr"
--   }
-- }
-- local snippets = {
--     -- ["Rcnew"] = {
--     --     prefix = "rc",
--     --     body = { "Rc::new(${receiver})" },
--     --     requires = { "std::rc::Rc" },
--     --     scope = "expr",
--     -- },
--     -- {
--     --     prefix = { "spawn", "tspawn" },
--     --     body = {
--     --         "thread::spawn(move || {",
--     --         "\t$0",
--     --         "});",
--     --     },
--     --     description = "Insert a thread::spawn call",
--     --     requires = "std::thread",
--     --     scope = "expr",
--     -- },
-- }
---
---
