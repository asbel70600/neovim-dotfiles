-- maxwidth = function() return math.floor(0.45 * vim.o.columns) end
return {
    "hrsh7th/nvim-cmp",
    opts = {
        sources = {
            {},
        },
    },
    config = function()
        local lspkind = require("lspkind")
        local cmp = require("cmp")
        -- GENERAL SETUP
        cmp.setup({
            ---@diagnostic disable-next-line: missing-fields
            formatting = {
                expandable_indicator = true,
                format = lspkind.cmp_format({
                    mode = "symbol",
                    maxwidth = 50,
                    ellipsis_char = "...",
                    show_labelDetails = true,
                    -- The function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                    --       before = function (entry, vim_item)
                    --         ...
                    --         return vim_item
                    --       end
                }),
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                    -- vim.snippet.expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = {
                { name = "luasnip" },
                { name = "nvim_lsp" },
                { name = "buffer" },
            },
        })

        -- CMDLINE SETUP
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
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

        cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
                { name = "git" },
            }, {
                { name = "buffer" },
            }),
        })

        require("cmp_git").setup()
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
    dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "petertriho/cmp-git",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim",
    },
    enabled = true,
}
