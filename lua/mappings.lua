MY_KEYMAPS = {}

local opts = {
    noremap = true, -- non-recursive
    silent = true, -- do not show message
}

vim.keymap.set("n", "<C-.>", ":bn<cr>", opts)
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
-- vim.keymap.set('v', '<', '<gv', opts)
-- vim.keymap.set('v', '>', '>gv', opts)
-- vim.keymap.set("n", "<C-A>", "<cmd>NvimTreeToggle<cr>", opts)
vim.keymap.set("n", "<C-TAB>", "<cmd>bn<cr>", opts)
vim.keymap.set("t", "<C-O>", "<C-\\><C-N>")
vim.keymap.set("t", "<C-TAB>", "<C-\\><C-N><cmd>bn<cr>")
vim.keymap.set("n", "<C-BS>", "<cmd>bd<cr>", opts)
vim.keymap.set("n", "<F3>", "<cmd>lua require('conform').format({bufnr = vim.fn.bufnr('%')})<cr>", opts)
vim.keymap.set("n", "<Leader>u", "", opts)
vim.keymap.set(
    "n",
    "gx",
    '<cmd>normal k$/ https\\?:\\/\\/\\S\\+<CR>nyW:!hyprctl dispatch exec -- \\[fullscreen] chromium <C-R>" --new-window<CR><CR>:nohl<CR>',
    { silent = true }
)

-- LspAttach
MY_KEYMAPS.OnLSPAttach = function(opts)
    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    -- vim.keymap.set("n", "<Leader>D", vim.lsp.buf.definition, opts)
    -- vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-Space>", vim.lsp.buf.completion, opts)
    vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<Leader>gf", vim.lsp.buf.format, opts)

    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

    vim.keymap.set("n", "<Leader>o", vim.diagnostic.open_float)
    vim.keymap.set("n", "[e", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]e", vim.diagnostic.goto_next)

    vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<Leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
end

MY_KEYMAPS.OnTelescopeReady = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<CR>", builtin.builtin, opts)
    vim.keymap.set("n", "<Leader>ff", builtin.find_files, opts)
    vim.keymap.set("n", "<Leader>fo", builtin.oldfiles, opts)
    vim.keymap.set("n", "<Leader>fw", "<cmd>Telescope workspaces<cr>", opts)
    vim.keymap.set("n", "<Leader>fg", builtin.live_grep, opts)
    vim.keymap.set("n", "<Leader>fa", builtin.current_buffer_fuzzy_find, opts)
    vim.keymap.set("n", "<Leader>fc", builtin.command_history, opts)
    vim.keymap.set("n", "<Leader>fs", builtin.grep_string, opts)
    vim.keymap.set("v", "<Leader>fs", builtin.grep_string, opts)
    vim.keymap.set("n", "<Leader>fd", builtin.diagnostics, opts)

    vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
    vim.keymap.set("n", "gt", builtin.lsp_type_definitions, opts)
    vim.keymap.set("n", "gr", builtin.lsp_references, opts)
    vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)

    -- vim.keymap.set("n", "K", builtin.lsp_document_symbols, opts)
    -- vim.keymap.set("n", "<Leader>fk", builtin.lsp_incoming_calls, opts)
    -- vim.keymap.set("n", "<Leader>fj", builtin.lsp_outgoing_calls, opts)
    -- vim.keymap.set("n", "<Leader>fws", builtin.lsp_workspace_symbols, opts)
    -- vim.keymap.set("n", "<Leader>fdws", builtin.lsp_dynamic_workspace_symbols, opts)
end

vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})

MY_KEYMAPS.OnTelescopeReady()
MY_KEYMAPS.OnLSPAttach(opts)
-- MY_KEYMAPS.onLuasnipReady()
-- vim.keymap.set("n", "<C-A>", "<cmd>Vexplore 20<cr>",opts)
vim.keymap.set("n", "<C-A>", "<cmd>CHADopen<cr>", opts)
