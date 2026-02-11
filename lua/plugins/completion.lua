---@diagnostic disable: unused-local

local minuet_provider = {
    name = "minuet",
    module = "minuet.blink",
    async = true,
    timeout_ms = 3000,
    score_offset = 50, -- Gives minuet higher priority among suggestions
}

local spell_provider = {
    enabled = false,
    name = "Spell",
    module = "blink-cmp-spell",
    score_offset = -1000,
}

local git_provider = {
    module = "blink-cmp-git",
    name = "Git",
    enabled = function()
        return vim.tbl_contains({ "octo", "gitcommit", "markdown" }, vim.bo.filetype)
    end,
}

local env_provier = {
    name = "Env",
    module = "blink-cmp-env",
    score_offset = -100,
    opts = {
        -- item_kind = require("blink.cmp.types").CompletionItemKind.Variable,
        show_braces = false,
        show_documentation_window = true,
    },
}

local path_provider = {
    opts = {
        get_cwd = function()
            return vim.fn.getcwd()
        end,
    },
}

local lazydev_provider = {
    name = "LazyDev",
    module = "lazydev.integrations.blink",
    score_offset = 100,
}

local fuzzy = {
    implementation = "rust",
    max_typos = function(keyword)
        return math.floor(#keyword / 4)
    end,

    frecency = { enabled = true },
    use_proximity = true,
    sorts = { "exact", "score", "sort_text" },
}

-- TODO:
--  - config colorfull-menu
--  - config fuzzy sorting
local cmdline = {
    enabled = true,
    sources = { "buffer", "cmdline" },
    completion = {
        trigger = {
            show_on_blocked_trigger_characters = {},
            show_on_x_blocked_trigger_characters = {},
        },
        list = {
            selection = {
                preselect = true,
                auto_insert = true,
            },
        },
        menu = { auto_show = true },
        ghost_text = { enabled = false },
    },
}

return {
    -- {
    --     "saghen/blink.compat",
    --     -- use v2.* for blink.cmp v1.*
    --     version = "2.*",
    --     -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    --     lazy = true,
    --     -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    --     opts = {},
    -- },
    -- {
    --     "Exafunction/windsurf.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --     },
    --     config = function()
    --         require("codeium").setup({})
    --     end,
    -- },
    {
        "saghen/blink.cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            "ribru17/blink-cmp-spell",
            "Exafunction/windsurf.nvim",
            -- { "milanglacier/minuet-ai.nvim" },
            -- { "Kaiser-Yang/blink-cmp-git" },
            -- { "bydlw98/blink-cmp-env" },
        },
        build = "cargo build --release",
        version = "1.*",
        event = { "InsertEnter", "CmdLineEnter" },
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap

            keymap = {
                preset = "default",
                ["<C-d>"] = { "scroll_documentation_down" },
                ["<C-u>"] = { "scroll_documentation_up" },
                ["<C-Space>"] = { "show_and_insert", "show_documentation", "hide_documentation" },
                ["<C-p>"] = { "select_prev", "fallback", },
                ["<C-n>"] = { "select_next", "fallback", },
                -- ["<C-y>"] = {
                --     function(cmp)
                --         cmp.accept()
                --     end,
                --     function(cmp)
                --         local coor = vim.api.nvim_win_get_cursor(0)
                --         vim.print(coor);
                --         vim.api.nvim_win_set_cursor(0, { 1, 1 })
                --     end
                -- }
                -- ["<A-y>"] = require("minuet").make_blink_map(),
            },

            appearance = { nerd_font_variant = "mono" },

            completion = {
                trigger = {
                    show_on_insert = true,
                    show_on_backspace = true,
                    show_on_backspace_in_keyword = true,
                    show_on_backspace_after_accept = true,
                },

                accept = {
                    dot_repeat = true,
                    resolve_timeout_ms = 10000,
                    auto_brackets = { blocked_filetypes = { "kotlin" } }
                },
                menu = { draw = { treesitter = { "lsp" } }, border = "single" },
                documentation = {
                    window = { border = "single" },
                    auto_show = true,
                    auto_show_delay_ms = 1,
                    treesitter_highlighting = true,
                },

                ghost_text = { enabled = true },
            },

            signature = {
                enabled = true,
                trigger = { show_on_keyword = true, show_on_accept = true, show_on_insert = true },
                window = { show_documentation = true, border = "single" },
            },

            sources = {
                default = {
                    "lsp",
                    "path",
                    "snippets",
                    "buffer",
                    "lazydev",
                    -- "codeium",
                    -- "env",
                    -- "git",
                    -- "spell",
                    -- "minuet",
                },
                providers = {
                    -- minuet = minuet_provider,
                    -- spell = spell_provider,
                    -- env = env_provier,
                    -- git = git_provider,
                    lazydev = lazydev_provider,
                    path = path_provider,
                },
            },

            snippets = { preset = "luasnip" },

            cmdline = cmdline,

            fuzzy = fuzzy,
        },
        opts_extend = { "sources.default" },
    },
}

-- local completion_trigger = {
-- prefetch_on_insert = true,
-- show_on_backspace_after_accept = true,
-- show_on_backspace_after_insert_enter = true,
-- show_on_keyword = true,
-- show_on_trigger_character = true,
-- show_on_blocked_trigger_characters = function(ctx)
--   if vim.bo.filetype == 'markdown' then return { ' ', '\n', '\t', '.', '/', '(', '[' } end
--   return { ' ', '\n', '\t' }
-- end,
-- show_on_accept_on_trigger_character = true,
-- show_on_insert_on_trigger_character = true,
-- show_on_x_blocked_trigger_characters = function() return { "'", '"', '(' }end,
--     show_on_backspace_in_keyword = true,
--     show_on_backspace = true,
--     show_on_insert = true,
-- }
