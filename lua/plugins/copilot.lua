return {
    {
        "milanglacier/minuet-ai.nvim",
        lazy = true,
        config = function()
            require("minuet").setup({
                config = { notify = debug },
                virtualtext = {
                    auto_trigger_ft = {},
                    keymap = {
                        accept = "<C-]>",
                        accept_line = "<A-l>",
                        accept_n_lines = "<A-z>",
                        prev = "<A-[>",
                        next = "<A-]>",
                        dismiss = "<A-e>",
                    },
                },
                context_ratio = 0.75,
                throttle = 100, -- only send the request every x milliseconds, use 0 to disable throttle.
                debounce = 70,
                provider = "openai_fim_compatible",
                n_completions = 1,
                context_window = 2000,
                provider_options = {
                    openai_fim_compatible = {
                        api_key = "TERM",
                        name = "Llama.cpp",
                        end_point = "http://localhost:8012/v1/completions",
                        model = "PLACEHOLDER",
                        optional = {
                            max_tokens = 200,
                            top_p = 0.9,
                        },
                        -- Llama.cpp does not support the `suffix` option in FIM completion.
                        -- Therefore, we must disable it and manually populate the special
                        -- tokens required for FIM completion.
                        template = {
                            prompt = function(context_before_cursor, context_after_cursor, _)
                                return "<|fim_prefix|>"
                                    .. context_before_cursor
                                    .. "<|fim_suffix|>"
                                    .. context_after_cursor
                                    .. "<|fim_middle|>"
                            end,
                            suffix = false,
                        },
                    },
                },
            })
        end,
    },
}
