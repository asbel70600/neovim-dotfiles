local builtin = require("telescope.builtin")

local function find_plugin_file()
    builtin.find_files({
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
    builtin.live_grep({
        default_text = "/",
        search_dirs = vim.tbl_values(files),
    })
end


vim.keymap.set("n", "<Leader>fg", builtin.live_grep, { desc = "live grep" })
vim.keymap.set("n", "<Leader>fa", builtin.current_buffer_fuzzy_find, { desc = "fuzzy find" })
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, { desc = "help" })
vim.keymap.set("n", "<Leader>m", builtin.commands, { desc = "find all commands" })
vim.keymap.set("n", "<leader><leader>", function()
    builtin.buffers({ only_cwd = true, ignore_current_buffer = true, sort_mru = true, })
end, { desc = "buffers" })

vim.api.nvim_create_user_command("PluginFiles", find_plugin_file, { desc = "[Telescope] find plugin files" })
vim.api.nvim_create_user_command("PluginSpecs", find_plugin_spec, { desc = "[Telescope] find plugin declarations" })
vim.api.nvim_create_user_command("TelescopeBuiltin", builtin.builtin,
    { desc = "[Telescope] open buitins from telescope" })
vim.api.nvim_create_user_command("Diag", builtin.diagnostics, { desc = "[Telescope] open buitins from telescope" })
vim.api.nvim_create_user_command("Man", builtin.man_pages, { desc = "[Telescope] find man pages" })
