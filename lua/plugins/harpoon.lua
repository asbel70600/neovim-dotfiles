return {
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({})

        -- stylua: ignore start
        vim.keymap.set("n", "<A-m>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        vim.keymap.set("n", "<A-a>", function() harpoon:list():add() end)

        vim.keymap.set("n", "<leader>hq", function() require("harpoon"):list():replace_at(1) end)
        vim.keymap.set("n", "<leader>hw", function() harpoon:list():replace_at(2) end)
        vim.keymap.set("n", "<leader>he", function() harpoon:list():replace_at(3) end)
        vim.keymap.set("n", "<leader>hr", function() harpoon:list():replace_at(4) end)
        vim.keymap.set("n", "<A-q>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<A-w>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<A-e>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<A-r>", function() harpoon:list():select(4) end)

        vim.keymap.set("n", "<S-A-q>", function() harpoon:list():add({ value = 1 }) end)
        vim.keymap.set("n", "<S-A-w>", function() harpoon:list():add({ value = 2 }) end)
        vim.keymap.set("n", "<S-A-e>", function() harpoon:list():add({ value = 3 }) end)
        vim.keymap.set("n", "<S-A-r>", function() harpoon:list():add({ value = 4 }) end)
        -- stylua: ignore end
    end,
    "ThePrimeagen/harpoon",
    event = "BufReadPost",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    commit = "e76cb03",
}
