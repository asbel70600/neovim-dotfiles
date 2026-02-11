vim.api.nvim_create_autocmd('LspAttach', {
    pattern = "*",
    callback = function()
        if not vim.g.lsp_attached_once then
            vim.keymap.del("n", "gra", {})
            vim.keymap.del("x", "gra", {})
            vim.keymap.del("n", "gri", {})
            vim.keymap.del("n", "grn", {})
            vim.keymap.del("n", "grt", {})
            vim.keymap.del("n", "grr", {})
            vim.g.lsp_attached_once = true
        end

        vim.keymap.set({ "n", "v" }, "<S-K>", vim.lsp.buf.hover, { desc = "Show [K]hover info" })
        vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, { desc = "code [a]ctions" })
        vim.keymap.set("n", "gR", vim.lsp.buf.rename, { desc = "[R]ename symbol" })
        vim.keymap.set("n", "<leader>h", vim.lsp.buf.document_highlight, { desc = "[h]ighlight ocurences" })
        vim.keymap.set("n", "<leader>H", vim.lsp.buf.clear_references, { desc = "clear [H]ighlight" })
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, { desc = "hover information" })
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, { desc = "hover information" })
        vim.keymap.set("n", "<leader>i", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
        end)
        vim.keymap.set("n", "<leader>d", function()
            local status = not vim.diagnostic.config().virtual_lines
            vim.diagnostic.config({ virtual_lines = status })
            vim.diagnostic.config({ virtual_text = not status })
        end)

        vim.keymap.set({ "n", "v" }, "gd", require("telescope.builtin").lsp_definitions, { desc = "list [d]efinitions" })
        vim.keymap.set({ "n", "v" }, "gi", require("telescope.builtin").lsp_implementations,
            { desc = "list [d]efinitions" })
        vim.keymap.set({ "n", "v" }, "gr", require("telescope.builtin").lsp_references, { desc = "list [r]eferences" })
        vim.keymap.set({ "n", "v" }, "gtd", require("telescope.builtin").lsp_type_definitions,
            { desc = "find Type Definition" })
        vim.keymap.set({ "n", "v" }, "<leader>fs", require("telescope.builtin").lsp_document_symbols,
            { desc = "find [Q]symbols" })
        vim.keymap.set({ "n", "v" }, "<leader>fw", require("telescope.builtin").lsp_workspace_symbols,
            { desc = "find Type Definition" })

        -- end
        vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"
    end,
})
