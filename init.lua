vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.g.netrw_preview = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 30

vim.g.lsp_attached_once = false

vim.g.markdown_fenced_languages = vim.list_extend(
  vim.g.markdown_fenced_languages or {},
  { "ts=typescript" }
)

require("config.options")
require("config.autocmds")
require("config.lazy")
require("config.mappings")
require("config.lsp")
require("config.theme")
