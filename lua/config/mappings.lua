--
-- Misc
vim.keymap.set("n", "<C-S-r>", ":so ~/.config/nvim/after/plugin/theme.lua<CR>", { desc = "[Theme] reload theme" })
vim.keymap.set("n", "$", "g_", { desc = "goto first char in line" })
vim.keymap.set("n", "0", "^", { desc = "goto last char in line" })
vim.keymap.set("n", "g_", "$", { desc = "goto end of line" })
vim.keymap.set("n", "^", "0", { desc = "goto start of line" })

-- Manage Windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "[Window] move left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "[Window] move down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "[Window] move up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "[Window] move right" })

vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "[Window] increase current vert" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "[Window] decrease current vert" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "[Window] increase current horiz" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "[Window] increase current horiz" })

-- CMDLine
vim.api.nvim_set_keymap("c", "<C-a>", "<Home>", { desc = "[CmdLine] move to start" })
vim.api.nvim_set_keymap("c", "<C-e>", "<End>", { desc = "[CmdLine] move to end" })
vim.api.nvim_set_keymap("c", "<C-f>", "<Right>", { desc = "[CmdLine] move to right" })
vim.api.nvim_set_keymap("c", "<C-b>", "<Left>", { desc = "[CmdLine] move to left" })
vim.api.nvim_set_keymap("c", "<A-b>", "<S-Left>", { desc = "[CmdLine] move word left " })
vim.api.nvim_set_keymap("c", "<A-f>", "<S-Right>", { desc = "[CmdLine] move word right" })
vim.api.nvim_set_keymap("c", "<C-d>", "<Del>", { desc = "[CmdLine] delete forward" })

-- QuickFixList
vim.keymap.set("n", "]q", "<cmd>cnext<cr>", { desc = "[QuickFixList] cnext" })
vim.keymap.set("n", "[q", "<cmd>cprev<cr>", { desc = "[QuickFixList] nprev" })

vim.keymap.set("n", "<leader>\\", function()
    require("telescope.builtin").buffers({
        cwd = "/home/asbel",
        show_all_buffers = true,
        only_cwd = false,
    })
end, { desc = "[Buffers] show ALL open buffers" })

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
end, { desc = "[Buffers] Delete buffer" })

-- Terminal
vim.keymap.set("n", "<A-t>", function()
    vim.system({
        "alacritty",
        "msg",
        "create-window",
        "--working-directory",
        vim.fn.getcwd(0)
    }, { detach = true }, function() end)
end, { desc = "[Terminal] open terminal in non floating window" })

vim.keymap.set("n", "<A-j>", function()
    vim.system(
        { "hyprctl", "dispatch exec [float] alacritty --working-directory " .. vim.fn.getcwd(0) },
        { detach = true },
        function() end
    )
end, { desc = "[Terminal] open terminal in floating window" })

vim.keymap.set("t", "<C-TAB>", "<C-\\><C-n><C-w>w", { desc = "[Terminal] exit" })

vim.keymap.set("n", "<leader>o", function()
    os.execute('$BROWSER --new-window "' .. vim.api.nvim_buf_get_name(0) .. '"')
end, { desc = "[Browser] open buffer in browser" })

local function rust_keymaps(_, bufnr)
    vim.keymap.set("n", "<leader>a", function()
        vim.cmd.RustLsp("codeAction")
    end, { silent = true, buffer = bufnr, desc = "[Rust] code actions" })

    vim.keymap.set({ "n", "v" }, "J", function()
        vim.cmd.RustLsp("joinLines")
    end, { silent = true, buffer = bufnr, desc = "[Rust] join lines" })

    vim.keymap.set("n", "K", function()
        vim.cmd.RustLsp({ "hover", "actions" })
    end, { silent = true, buffer = bufnr, desc = "[Rust] hover actions" })

    vim.keymap.set("v", "K", function()
        vim.cmd.RustLsp({ "hover", "range" })
    end, { silent = true, buffer = bufnr, desc = "[Rust] hover range" })

    vim.keymap.set("n", "]d", function()
        vim.cmd.RustLsp({ "renderDiagnostic", "cycle" })
    end, { silent = true, buffer = bufnr, desc = "[Rust] next diagnostic" })

    vim.keymap.set("n", "[d", function()
        vim.cmd.RustLsp({ "renderDiagnostic", "cycle_prev" })
    end, { silent = true, buffer = bufnr, desc = "[Rust] previous diagnostic" })

    vim.keymap.set("n", "<f5>", function()
        vim.cmd.RustLsp("debuggables")
    end, { silent = true, buffer = bufnr, desc = "[Rust] debuggables" })

    vim.keymap.set("n", "<f1>", function()
        vim.cmd.RustLsp({ "explainError", "cycle" })
    end, { silent = true, buffer = bufnr, desc = "[Rust] explain error" })

    vim.keymap.set("n", "<f2>", function()
        vim.cmd.RustLsp("syntaxTree")
    end, { silent = true, buffer = bufnr, desc = "[Rust] syntax tree" })

    vim.keymap.set("n", "<f4>", function()
        vim.cmd.RustLsp({ "view", "hir" })
    end, { silent = true, buffer = bufnr, desc = "[Rust] view HIR" })

    vim.keymap.set("n", "<f3>", function()
        vim.cmd.RustLsp({ "view", "mir" })
    end, { silent = true, buffer = bufnr, desc = "[Rust] view MIR" })
end

vim.g.rustaceanvim = {
    server = {
        on_attach = rust_keymaps,
        default_settings = {
            ["rust-analyzer"] = {
                checkOnSave = true,
                -- completion = {
                --     snippets = {
                --         custom = {
                --             -- ['thread spawn'] = {
                --             --     prefix = { "spawn", "tspawn" },
                --             --     body = {
                --             --         "thread::spawn(move || {",
                --             --         "\t$0",
                --             --         "});"
                --             --     },
                --             --     description = "Insert a thread::spawn call",
                --             --     requires = "std::thread",
                --             --     scope = "expr"
                --             -- },
                --             -- yay = {
                --             --     postfix = "yay",
                --             --     body = "Ok(${receiver})",
                --             --     description = "Wrap the expression in a `Result::Ok`",
                --             --     scope = "expr"
                --             -- },
                --         },
                --     },
                -- },
                --
                -- {
                --     "ErrorEnum": {
                --         "prefix": "enumErr",
                --         "body": [
                --             "#[derive(std::fmt::Debug)]",
                --             "enum ${1:Type}Error {",
                --             "\t${2:VarOne}${3:(Content)},",
                --             "\t${4:VarTwo}${5:(Content)},",
                --             "}",
                --             "impl std::fmt::Display for ${1:Type}Error {",
                --             "\tfn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {",
                --             "\t\twrite!(f, \"{self:#?}\")",
                --             "\t}",
                --             "}"
                --         ]
                --     }
                -- }

            },
        },
    },
}
