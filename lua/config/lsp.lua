vim.api.nvim_create_autocmd({ "LspAttach" }, {
    pattern = "*",
    callback = function()
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

        -- Telesope deppendent keymaps, they all are in:
        -- $XDG_CONFIG_HOME/nvim/lua/plugins/mappings/telescope.lua:60
        if not TELESCOPE_PLUGGED then
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "go to [d]efinition" })
            vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "show [r]eferences" })
            vim.keymap.set("n", "Q", vim.lsp.buf.document_symbol, { desc = "search document symbols" })
        else
            vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { desc = "list [d]efinitions" })
            vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "list [r]eferences" })
            vim.keymap.set("n", "Q", require("telescope.builtin").lsp_document_symbols, { desc = "find [Q]symbols" })
        end
        vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"
    end,
})
