local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

-- vim.keymap.del("n","<C-]>",opts);

-- Misc
vim.keymap.set("n", "<C-.>", "@:", opts)
vim.keymap.set("n", "<Leader>z", "<cmd>q<cr>", opts)
vim.keymap.set("n", "<Leader>w", "<cmd>w<cr>", opts)
vim.keymap.set("n", "<C-S-r>", ":so /home/asbel/.xdg/config/nvim/lua/config/theme.lua<CR>", opts)

-- CMDLine history and suggestions
vim.api.nvim_set_keymap("c", "<C-S-P>", "<Up>", opts)
vim.api.nvim_set_keymap("c", "<C-S-N>", "<Down>", opts)

-- QuickFixList
vim.keymap.set("n", "]q", "<cmd>cnext<cr>", opts)
vim.keymap.set("n", "[q", "<cmd>cprev<cr>", opts)

-- Move around panes
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize Panes
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move around Tabs
vim.keymap.set("n", "<C-TAB>", "<cmd>tabn<cr>", opts)
vim.keymap.set("n", "<C-BS>", "<cmd>bd<cr>", opts)

-- Floatin Terminal
vim.keymap.set("n", "<A-j>", function()
    vim.fn.system(
        'hyprctl dispatch exec "[ floating; size 800 400 ] kitty -d '
        .. vim.fn.getcwd()
        .. '"'
    )
end)

-- Better CMDLine
vim.api.nvim_set_keymap("c", "<C-a>", "<Home>", {})
vim.api.nvim_set_keymap("c", "<C-e>", "<End>", {})

vim.api.nvim_set_keymap("c", "<C-f>", "<Right>", {})
vim.api.nvim_set_keymap("c", "<C-b>", "<Left>", {})

vim.api.nvim_set_keymap("c", "<A-b>", "<S-Left>", {})
vim.api.nvim_set_keymap("c", "<A-f>", "<S-Right>", {})

vim.api.nvim_set_keymap("c", "<A-d>", "<S-Right><C-w>", {})
vim.api.nvim_set_keymap("c", "<C-d>", "<Del>", {})


vim.keymap.set("n", "<leader>n", function()
    local ts_utils = require("nvim-treesitter.ts_utils")
    local node = ts_utils.get_node_at_cursor()

    if node == nil then
        vim.print("node null a")
        return
    end

    while node do
        -- print(node:type())
        if node:type() == "class_definition" then
            print(vim.inspect(ts_utils.get_node_text(node,0)[1]))
            print(vim.inspect(ts_utils.get_root_for_node(node)))
            print(vim.inspect(ts_utils.get_named_children(0)[1]))
            -- print(vim.inspect())
            -- print(vim.inspect())
            -- print(vim.inspect())
            -- print(vim.inspect())
        end
        node = node:parent()
    end
end, { silent = true })


-- MY_KEYMAPS.OnLuasnipAttach(opts)
-- MY_KEYMAPS.OnDapAdapterReady(opts)
-- vim.keymap.set("n", "<S-Enter>", "<cmd>Vexplore 30<cr>",opts)
-- vim.keymap.set("n", "<leader>p", function()
--     local row, col = 0, 0
--     local node = vim.treesitter.get_node()
--     if node == nil then
--         vim.print("node null a")
--         return
--     end
--
--     while true do
--         if node:start() == vim.treesitter.get_node():start() then
--             node = node:parent()
--             if node == nil then
--                 vim.print("node null 2")
--                 return
--             end
--         else
--             row, col, _ = node:start()
--             vim.fn.cursor({ row + 1, col + 1 })
--             break
--         end
--     end
-- end, { silent = true })
--
-- vim.keymap.set("n", "<leader>n", function()
--     local node = vim.treesitter.get_node()
--     if node == nil then
--         vim.print("node null a")
--         return
--     end
--     while true do
--         if node:start() == vim.treesitter.get_node():start() then
--             if node:next_sibling() ~= nil then
--                 node = node:next_sibling()
--             else
--                 while node:next_sibling() == nil do
--                     if node:parent() ~= nil then
--                         node = node:parent()
--                     else
--                         vim.print("node null")
--                         return
--                     end
--                 end
--             end
--         else
--             local row, col, _ = node:start()
--             row = row + 1
--             col = col + 1
--
--             local cursorr = vim.fn.line(".")
--             local cursorc = vim.fn.col(".")
--
--             if cursorr > row or (cursorr == row and cursorc > col) then
--                 vim.print("out of place")
--                 while node:parent():next_sibling() == nil and node:parent() ~= nil do
--                     node = node:parent()
--                 end
--                 if node:parent() == nil or node:parent():next_sibling() == nil then
--                     return
--                 end
--                 node = node:parent():next_sibling()
--                 row, col, _ = node:start()
--                 row = row + 1
--                 col = col + 1
--                 vim.fn.cursor({ row, col })
--             else
--                 vim.print("cr " .. cursorr .. " cc " .. cursorc .. " nr " .. row .. " nc " .. col)
--                 vim.fn.cursor({ row, col })
--             end
--             break
--         end
--     end
-- end, { silent = true })
--
-- vim.keymap.set("n", "<leader>N", function()
--     local row, col = 0, 0
--
--     local node = vim.treesitter.get_node()
--     if node == nil then
--         vim.print("node null a")
--         return
--     end
--
--     while true do
--         if node:start() == vim.treesitter.get_node():start() then
--             if node:prev_sibling() ~= nil then
--                 node = node:prev_sibling()
--             else
--                 while node:prev_sibling() == nil do
--                     if node:parent() ~= nil then
--                         node = node:parent()
--                     else
--                         vim.print("node null")
--                         return
--                     end
--                 end
--             end
--         else
--             row, col, _ = node:start()
--             vim.fn.cursor({ row + 1, col + 1 })
--             break
--         end
--     end
-- end, { silent = true })
--
--
-- vim.keymap.set("n", "<A-j>", function()
--     for _, value in pairs(vim.api.nvim_list_bufs()) do
--         local buffername = vim.api.nvim_buf_get_name(value)
--         local name = string.match(buffername, "term:///")
--         if name then
--             vim.cmd("buffer " .. value)
--             return 0
--         end
--     end
--     vim.cmd("terminal")
--     vim.cmd("normal i")
-- end, opts)
