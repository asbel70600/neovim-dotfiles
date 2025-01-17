vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins", { change_detection = { enabled = false } })

require("mappings")
require("options")
require("autocmds")
vim.cmd("set nofoldenable")
vim.cmd("set nowrap")
vim.opt.rtp:prepend("/home/asbel/projects/vimP")
vim.keymap.set("n","<C-g>", function ()
    require("vimp").askDevDocs()
end,{})
