return {
    "hrsh7th/nvim-cmp",
    config = function()
        local luasnip = require("luasnip")
        local cmp = require("cmp")
        cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())

        -- {
        --     name = "lazydev",
        --     group_index = 0
        -- },

        cmp.setup({
            sources = {
                { name = "codeium" },
                { name = "luasnip" },
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
                { name = "cmdline" },
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        if luasnip.expandable() then
                            luasnip.expand()
                        else
                            cmp.confirm({
                                select = true,
                            })
                        end
                    else
                        fallback()
                    end
                end),

                ["<C-N>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<C-P>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
        })

        -- CMDLINE SETUP
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline({
                ["<C-y>"] = {
                    c = cmp.mapping.confirm({ select = false }),
                },
                ["<Tab>"] = {
                    c = function()
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            cmp.complete()
                        end
                    end,
                },
                ["<S-Tab>"] = {
                    c = function()
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            cmp.complete()
                        end
                    end,
                },
                ["<C-n>"] = {
                    c = function(fallback)
                        fallback()
                    end,
                },
                ["<C-p>"] = {
                    c = function(fallback)
                        fallback()
                    end,
                },
            }),

            matching = {
                disallow_symbol_nonprefix_matching = false,
                disallow_fuzzy_matching = false,
                disallow_partial_fuzzy_matching = false,
                disallow_fullfuzzy_matching = false,
                disallow_partial_matching = false,
                disallow_prefix_unmatching = false,
            },
        })
    end,

    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim",
        "rcarriga/cmp-dap",
        "ray-x/lsp_signature.nvim",
    },
    lazy = true,
    event = {
        "LspAttach",
        "CmdlineEnter",
    },
    {
        "onsails/lspkind.nvim",
        config = function()
            require("lspkind").init({
                symbol_map = {
                    Supermaven = "",
                },
            })
            vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", { fg = "#6CC644" })
        end,
    }
}
