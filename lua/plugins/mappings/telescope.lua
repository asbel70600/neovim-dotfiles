local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" })
vim.keymap.set("n", "<Leader>fg", builtin.live_grep, { desc = "live grep" })
vim.keymap.set("n", "<Leader>fo", builtin.oldfiles, { desc = "open old files" })
vim.keymap.set("n", "<Leader>fa", builtin.current_buffer_fuzzy_find, { desc = "fuzzy find" })
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, { desc = "help" })
vim.keymap.set("n", "<Leader>m", builtin.commands, { desc = "find all commands" })
vim.keymap.set("n", "<leader>fd", function()
    require("telescope").extensions.zoxide.list({
        border = false,
        layout_config = {
            height = 25,
        },
        layout_strategy = "bottom_pane",
        sorting_strategy = "ascending",
        theme = "ivy",
    })
end, { desc = "zoxide" })

vim.keymap.set("n", "<leader><leader>", function()
    require("telescope.builtin").buffers({
        only_cwd = true,
        ignore_current_buffer = true,
        sort_mru = true,
    })
end, { desc = "buffers" })

local function find_plugin_file()
    require("telescope.builtin").find_files({
        cwd = require("lazy.core.config").options.root,
    })
end

local function find_plugin_spec()
    local files = {} ---@type table<string, string>
    for _, plugin in pairs(require("lazy.core.config").plugins) do
        repeat
            if plugin._.module then
                local info = vim.loader.find(plugin._.module)[1]
                if info then
                    files[info.modpath] = info.modpath
                end
            end
            plugin = plugin._.super
        until not plugin
    end
    require("telescope.builtin").live_grep({
        default_text = "/",
        search_dirs = vim.tbl_values(files),
    })
end

vim.api.nvim_create_user_command("PluginFiles", find_plugin_file, { desc = "find plugin files" })
vim.api.nvim_create_user_command("PluginSpecs", find_plugin_spec, { desc = "find plugin declarations" })
vim.api.nvim_create_user_command("TelescopeBuiltin", builtin.builtin, { desc = "open buitins from telescope" })
vim.api.nvim_create_user_command("Diag", builtin.diagnostics, { desc = "open buitins from telescope" })
vim.api.nvim_create_user_command("Man", builtin.man_pages, { desc = "Find man pages" })
