return {
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({})
        vim.keymap.set("n", "<A-m>",
            function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "[Harpoon] Toggle quick menu" })
        vim.keymap.set("n", "<A-a>",
            function() harpoon:list():add() end, { desc = "[Harpoon] Add file to list" })
        vim.keymap.set("n", "<leader>hq",
            function() harpoon:list():replace_at(1) end, { desc = "[Harpoon] Replace slot 1" })
        vim.keymap.set("n", "<leader>hw",
            function() harpoon:list():replace_at(2) end, { desc = "[Harpoon] Replace slot 2" })
        vim.keymap.set("n", "<leader>he",
            function() harpoon:list():replace_at(3) end, { desc = "[Harpoon] Replace slot 3" })
        vim.keymap.set("n", "<leader>hr",
            function() harpoon:list():replace_at(4) end, { desc = "[Harpoon] Replace slot 4" })
        vim.keymap.set("n", "<A-q>", function() harpoon:list():select(1) end, { desc = "[Harpoon] Select slot 1" })
        vim.keymap.set("n", "<A-w>", function() harpoon:list():select(2) end, { desc = "[Harpoon] Select slot 2" })
        vim.keymap.set("n", "<A-e>", function() harpoon:list():select(3) end, { desc = "[Harpoon] Select slot 3" })
        vim.keymap.set("n", "<A-r>", function() harpoon:list():select(4) end, { desc = "[Harpoon] Select slot 4" })
    end,
    "ThePrimeagen/harpoon",
    event = "User ProjectOpened",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    commit = "e76cb03",
}
