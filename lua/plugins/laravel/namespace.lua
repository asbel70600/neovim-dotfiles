return {
    ft = { "php" },
    "ccaglak/namespace.nvim",
    keys = {
        { "<leader>lc", '<cmd>lua require("namespace.getClass").get()<cr>',   { desc = "GetClass" } },
        { "<leader>la", '<cmd>lua require("namespace.getClasses").get()<cr>', { desc = "GetClasses" } },
        { "<leader>ls", '<cmd>lua require("namespace.classAs").open()<cr>',   { desc = "ClassAs" } },
        { "<leader>ln", '<cmd>lua require("namespace.namespace").gen()<cr>',  { desc = "Generate Namespace" } },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
    -- vim.keymap.set("n", "<leader>la", "<cmd>GetClasses<cr>")
    -- vim.keymap.set("n", "<leader>lc", "<cmd>GetClass<cr>")
    -- vim.keymap.set("n", "<leader>ls", "<cmd>ClassAs<cr>")
    -- vim.keymap.set("n", "<leader>ln", "<cmd>Namespace<cr>")
