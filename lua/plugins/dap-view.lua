return {
    "igorlfs/nvim-dap-view",
    lazy = true,
    ---@module 'dap-view'
    ---@type dapview.Config
    opts = {
        winbar = {
            show = true,
            sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl" },
            default_section = "scopes",
            controls = {
                enabled = true,
                position = "left",
            },
        },
        windows = {
            height = 0.25,
            position = "below",
            terminal = {
                width = 0.25,
                position = "right",
                hide = {},
                start_hidden = true,
            },
        },
        help = {
            border = nil,
        },
        -- Controls how to jump when selecting a breakpoint or navigating the stack
        -- Comma separated list, like the built-in 'switchbuf'. See :help 'switchbuf'
        -- Only a subset of the options is available: newtab, useopen, usetab and uselast
        -- Can also be a function that takes the current winnr and the bufnr that will jumped to
        -- If a function, should return the winnr of the destination window
        -- switchbuf = "usetab",
        auto_toggle = true,
    },
}
