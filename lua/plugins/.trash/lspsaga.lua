return {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = { },
    config = function ()
        require('lspsaga').setup({
            lightbulb = {
                sign = false
            },
            ui ={
                code_action = "󰡏"
            }
        })
    end,
}
