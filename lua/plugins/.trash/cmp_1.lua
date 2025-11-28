return {
    "saghen/blink.cmp",
    version = "0.11.0",
    keymap = {
        preset = "default",
        ["<A-1>"] = {
            function(cmp)
                cmp.accept({ index = 1 })
            end,
        },
        ["<A-2>"] = {
            function(cmp)
                cmp.accept({ index = 2 })
            end,
        },
        ["<A-3>"] = {
            function(cmp)
                cmp.accept({ index = 3 })
            end,
        },
        ["<A-4>"] = {
            function(cmp)
                cmp.accept({ index = 4 })
            end,
        },
        ["<A-5>"] = {
            function(cmp)
                cmp.accept({ index = 5 })
            end,
        },
        ["<A-6>"] = {
            function(cmp)
                cmp.accept({ index = 6 })
            end,
        },
        ["<A-7>"] = {
            function(cmp)
                cmp.accept({ index = 7 })
            end,
        },
        ["<A-8>"] = {
            function(cmp)
                cmp.accept({ index = 8 })
            end,
        },
        ["<A-9>"] = {
            function(cmp)
                cmp.accept({ index = 9 })
            end,
        },
        ["<A-0>"] = {
            function(cmp)
                cmp.accept({ index = 10 })
            end,
        },
        -- vim.keymap.set("n","<Tab>",function()
        -- end)
    },

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        snippets = {
            preset = "luasnip",
        },
        keymap = {
            preset = "none",
            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<C-e>"] = { "hide", "fallback" },

            ["<Tab>"] = {
                function(cmp)
                    if cmp.snippet_active() then
                        return cmp.accept()
                    else
                        return cmp.select_and_accept()
                    end
                end,
                "snippet_forward",
                "fallback",
            },
            ["<S-Tab>"] = { "snippet_backward", "fallback" },

            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },

            ["<C-u>"] = { "scroll_documentation_up", "fallback" },
            ["<C-d>"] = { "scroll_documentation_down", "fallback" },

            ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
            cmdline = {
                ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<Tab>"] = { "select_and_accept", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback" },
                ["<C-n>"] = { "select_next", "fallback" },
            },
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer", "markdown" },
            providers = {
                markdown = {
                    name = "RenderMarkdown",
                    module = "render-markdown.integ.blink",
                    fallbacks = { "lsp" },
                },
            },
        },
        completion = {
            list = {
                selection = {
                    auto_insert = true,
                    preselect = true,
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0,
                window = { border = "single" },
            },
            menu = {
                border = "single",
            },
            ghost_text = {
                enabled = true,
                show_with_selection = true,
                show_without_selection = true,
            },
        },
        signature = {
            enabled = true,
            trigger = {
                enabled = true,
                show_on_keyword = true,
                -- blocked_trigger_characters = {},
                -- blocked_retrigger_characters = {},
                show_on_trigger_character = true,
                show_on_insert = true,
                show_on_insert_on_trigger_character = true,
            },
            window = {
                scrollbar = false,
                treesitter_highlighting = true,
                show_documentation = true,
            },
        },
    },
    opts_extend = { "sources.default" },
    dependencies = { "L3MON4D3/LuaSnip" },
}
