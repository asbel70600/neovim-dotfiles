return {
    "hrsh7th/nvim-cmp",
    event = {
        "LspAttach",
        "CmdlineEnter",
    },
    config = function()
        local lspkind = require("lspkind")
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        require("cmp_git").setup()
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

        cmp.setup({
            ---@diagnostic disable-next-line: missing-fields
            formatting = {
                expandable_indicator = true,
                format = lspkind.cmp_format({
                    mode = "symbol",
                    maxwidth = 50,
                    ellipsis_char = "...",
                    show_labelDetails = true,
                    menu = {
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[Snippet]",
                        nvim_lua = "[Lua]",
                        latex_symbols = "[Latex]",
                    },
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
            sources = {
                { name = "codeium" },
                { name = "luasnip" },
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "nvim_lsp_signature_help" },
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
                        local cmp = require("cmp")
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

        -- require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        --     sources = {
        --         { name = "dap" },
        --     },
        -- })


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
        "rcarriga/cmp-dap",
        "hrsh7th/cmp-nvim-lsp-signature-help",
    },
}

--                ["<C-e>"] = cmp.mapping.abort(),
--                ["<CR>"] = cmp.mapping.confirm({}),
--                ["<Tab>"] = cmp.mapping.select_next_item({}),
--                ["<S-Tab>"] = cmp.mapping.select_prev_item({}),
--                ["<C-N>"] = cmp.mapping(function(fallback)
--                    fallback()
--                end),
--                ["<C-P>"] = cmp.mapping(function(fallback)
--                    fallback()
--                end),
