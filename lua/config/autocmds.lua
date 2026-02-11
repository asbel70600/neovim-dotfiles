local function is_git_repo()
    return vim.fn.isdirectory('.git') == 1 or
        vim.fn.system('git rev-parse --is-inside-work-tree 2>/dev/null'):match('true') ~= nil
end

vim.api.nvim_create_autocmd("TermEnter", { command = [[set timeoutlen=100]] })
vim.api.nvim_create_autocmd("TermLeave", { command = [[set timeoutlen=800]] })

vim.api.nvim_create_autocmd("CmdlineEnter", { command = [[set hlsearch]] })
vim.api.nvim_create_autocmd("CmdlineLeave", { command = [[set nohlsearch]] })

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "highlight when yanking text",
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- vim.api.nvim_create_autocmd('BufEnter', {
--     desc = "Unflod ufo's shit",
--     callback = function()
--         require('ufo').openFoldsExceptKinds()
--     end,
-- })

vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        vim.defer_fn(function()
            if is_git_repo() then
                vim.api.nvim_exec_autocmds('User', { pattern = 'ProjectOpened' })
            end
        end, 100)
    end
})

vim.api.nvim_create_autocmd('DirChanged', {
    callback = function(ev)
        local cwd = ev.file
        local nvim_config = os.getenv('XDG_CONFIG_HOME') .. '/nvim'
        local nvim_config_other = os.getenv('HOME') .. '/.xdg/config/nvim'
        local nvim_config_fallback = os.getenv('HOME') .. '/.config/nvim'

        if is_git_repo() then
            vim.api.nvim_exec_autocmds('User', { pattern = 'ProjectOpened' })
        end

        if cwd == nvim_config or cwd == nvim_config_other or cwd == nvim_config_fallback then
            vim.notify("Loading Lazydev")
            vim.api.nvim_exec_autocmds('User', { pattern = 'NvimConfigOpened' })
        end
    end
})

vim.api.nvim_create_user_command("LoadMason", function() require("mason").setup({}) end,
    { desc = "[Mason] Load the Mason plugin" })

---Get the config home directory
---@return string | nil config_home
---@return string | nil err
local function getConfigHome()
    local configHome = os.getenv("XDG_CONFIG_HOME") or "~/.config"

    if not vim.loop.fs_stat(configHome) then
        local err = "The template does not exist: " .. configHome
        return nil, err
    end

    return configHome, nil
end


vim.api.nvim_create_user_command("InitrcSetup", function()
        local initRcFilePath, initrc_path_err     = getConfigHome()
        local rootOfTheProject, root_err, errmesg = vim.loop.cwd()

        if not initRcFilePath or not rootOfTheProject then
            vim.notify("Error on the operation:\n" .. initrc_path_err .. "\n" .. root_err)
            return
        else
            initRcFilePath = initRcFilePath .. "/nvim/templates/.nvim.lua"
            rootOfTheProject = rootOfTheProject .. "/.nvim.lua"
        end


        local ok, err = vim.loop.fs_copyfile(initRcFilePath, rootOfTheProject)

        if not ok then
            vim.notify("Copy failed: " .. err, vim.log.levels.ERROR)
        else
            vim.notify("Copied " .. initRcFilePath .. " to " .. rootOfTheProject)
        end
    end,
    { desc = "[Mason] Load the Mason plugin" })

vim.api.nvim_create_user_command("LoadMason", function() require("mason").setup({}) end,
    { desc = "[Mason] Load the Mason plugin" })


-- vim.api.nvim_create_autocmd("UIEnter", {
--     callback = function()
--         require("telescope").extensions.zoxide.list({
--             border = false,
--             layout_config = {
--                 height = 25,
--             },
--             layout_strategy = "bottom_pane",
--             sorting_strategy = "ascending",
--             theme = "ivy",
--         })
--     end,
-- })
