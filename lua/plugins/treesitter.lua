MY_PLUGINS_KEYMAPS = {}

MY_PLUGINS_KEYMAPS.treesitterSelectionKeymaps = {
    init_selection = "<Leader>ss",
    node_incremental = "<Leader>si",
    scope_incremental = "<Leader>so",
    node_decremental = "<Leader>sd",
}

MY_PLUGINS_KEYMAPS.treesitterTextObjectKeymaps = {

    ["af"] = "@function.outer",
    ["if"] = "@function.inner",

    ["ii"] = "@conditional.inner",

    ["al"] = "@loop.outer",
    ["il"] = "@loop.inner",

    ["ap"] = "@parameter.outer",
    ["ip"] = "@parameter.inner",

    ["ir"] = "@return.inner",

    ["ac"] = "@call.outer",
    ["ic"] = "@call.inner",
}

return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "luadoc", "cpp"},
        sync_install = true,
        auto_install = true,
        indent = {
            enable = true,
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
            enable = true,
            keymaps = MY_PLUGINS_KEYMAPS.treesitterSelectionKeymaps,
        },
        -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
        textobjects = {
            select = {
                keymaps = MY_PLUGINS_KEYMAPS.treesitterTextObjectKeymaps,
            },
            move = MY_PLUGINS_KEYMAPS.textobjectMoves,
        },
    },
}
