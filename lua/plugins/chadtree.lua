local chadtree_settings = {
    ["view.width"] = 30,
}
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

return {
    "ms-jpq/chadtree",
    branch = "chad",
    build = "python3 -m chadtree deps",
}
