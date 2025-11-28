local opts = {
    noremap = true, -- non-recursive
    silent = true, -- do not show message
}

-- Misc
vim.keymap.set("n", "<Leader>w", function()
    vim.notify(pleaseStop)
end, opts)
vim.keymap.set("n", "<C-S-r>", ":so ~/.config/nvim/after/plugin/theme.lua<CR>", opts)
vim.keymap.set("n", "$", "g_", opts)
vim.keymap.set("n", "0", "^", opts)
vim.keymap.set("n", "g_", "$", opts)
vim.keymap.set("n", "^", "0", opts)

vim.keymap.set("t", "<C-TAB>", "<C-\\><C-n><C-w>w", opts)

-- Manage Windows
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- CMDLine
vim.api.nvim_set_keymap("c", "<C-a>", "<Home>", {})
vim.api.nvim_set_keymap("c", "<C-e>", "<End>", {})
vim.api.nvim_set_keymap("c", "<C-f>", "<Right>", {})
vim.api.nvim_set_keymap("c", "<C-b>", "<Left>", {})
vim.api.nvim_set_keymap("c", "<A-b>", "<S-Left>", {})
vim.api.nvim_set_keymap("c", "<A-f>", "<S-Right>", {})
vim.api.nvim_set_keymap("c", "<A-d>", "<S-Right><C-w>", {})
vim.api.nvim_set_keymap("c", "<C-d>", "<Del>", {})

-- QuickFixList
vim.keymap.set("n", "]q", "<cmd>cnext<cr>", opts)
vim.keymap.set("n", "[q", "<cmd>cprev<cr>", opts)

vim.keymap.set("n", "\\", function()
    require("telescope.builtin").buffers({
        cwd = "/home/asbel",
        show_all_buffers = true,
        only_cwd = false,
    })
end)

vim.keymap.set("n", "<C-BS>", function()
    local old = vim.api.nvim_win_get_buf(0)
    local cwd = vim.fn.getcwd()
    local current_dir_bufs = {}

    for _, j in pairs(vim.api.nvim_list_bufs()) do
        local name = vim.api.nvim_buf_get_name(j)

        if name == "" then
            goto continue
        end
        if name:match("^" .. cwd) == cwd then
            table.insert(current_dir_bufs, j)
        end
        ::continue::
    end

    if #current_dir_bufs == 0 then
        goto eso
    end

    for _, j in pairs(current_dir_bufs) do
        if vim.api.nvim_buf_get_name(j) ~= "" and j ~= old then
            vim.api.nvim_win_set_buf(0, j)
            vim.api.nvim_buf_delete(old, {})
            return
        else
            vim.api.nvim_buf_delete(old, {})
            return
        end
    end

    ::eso::
    local new = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_win_set_buf(0, new)
    -- vim.api.nvim_buf_delete(old, {})
end, opts)

-- Terminal
vim.keymap.set("n", "<A-t>", function()
    vim.system({ "alacritty", "--working-directory", vim.fn.getcwd(0) }, { detach = true }, function() end)
end)
vim.keymap.set("n", "<A-j>", function()
    vim.system(
        { "hyprctl", "dispatch exec [float] alacritty --working-directory " .. vim.fn.getcwd(0) },
        { detach = true },
        function() end
    )
end)

vim.keymap.set("n", "<leader>o", function()
    os.execute('$BROWSER --new-window "' .. vim.api.nvim_buf_get_name(0) .. '"')
end, opts)

local function rust_keymaps(_, bufnr)
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
    end, { silent = true, buffer = bufnr })

    vim.keymap.set("n", "[d", function()
        vim.cmd.RustLsp({ "renderDiagnostic", "cycle_prev" })
    end, { silent = true, buffer = bufnr })

    vim.keymap.set("n", "<f5>", function()
        vim.cmd.RustLsp("debuggables")
    end, { silent = true, buffer = bufnr })

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
    vim.notify("buffer: " .. bufnr .. " realone: " .. vim.api.nvim_get_current_buf())
end

vim.g.rustaceanvim = {
    server = {
        on_attach = rust_keymaps,
        default_settings = {
            ["rust-analyzer"] = {},
        },
    },
}
