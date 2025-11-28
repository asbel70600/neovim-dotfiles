local dark_themes = {
    { name = "kanagawa-dragon", setup = "kanagawa" },
    { name = "kanagawa-paper-ink", setup = "kanagawa-paper" },
    { name = "everforest", setup = "everforest" },
    { name = "newpaper", setup = "newpaper" },
    { name = "habamax", setup = "" },
    { name = "slate", setup = "" },
}

local light_themes = {
    { name = "kanagawa-lotus", setup = "kanagawa" },
    { name = "kanagawa-paper-canvas", setup = "kanagawa-paper" },
    { name = "morning", setup = "" },
    { name = "peachpuff", setup = "" },
    { name = "shine", setup = "" },
    { name = "newpaper", setup = "newpaper" },
}

local function random_theme(themes, setup_function)
    math.randomseed(os.time())
    local random_index = math.random(1, #themes)
    local selected_theme = themes[random_index]

    local success, err = pcall(function()
        if setup_function then
            setup_function()
        end

        if selected_theme.setup ~= "" then
            vim.print("Has Setup: " .. selected_theme.setup)
            require(selected_theme.setup).setup()
        else
            vim.print("Does Not Have Setup")
        end

        vim.print("colorscheme: " .. selected_theme.name)
        vim.cmd.colorscheme(selected_theme.name)
    end)

    if not success then
        vim.notify("Failed to set colorscheme: " .. tostring(err), vim.log.levels.ERROR)
    end

    return selected_theme
end

vim.api.nvim_create_user_command("RandomThemeDark", function()
    random_theme(dark_themes, function()
        vim.opt.background = "dark"
    end)
end, {})

vim.api.nvim_create_user_command("RandomThemeLight", function()
    random_theme(light_themes, function()
        vim.opt.background = "light"
    end)
end, {})

local ___current___ = dark_themes

vim.api.nvim_create_autocmd("UIEnter", {
    desc = "Setting a Random Colorscheme",
    callback = function()
        local selected = random_theme(___current___, function()
            local background = "dark"

            if ___current___ == dark_themes then
                background = "dark"
            else
                background = "light"
            end

            vim.opt.background = background
        end)
        vim.print("Selected: " .. selected.name)
    end,
})
