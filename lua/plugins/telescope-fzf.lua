return {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    dependencies = { "nvim-telescope/telescope.nvim" },
    -- No opts 'cause it fails
    -- opts = {},
}
