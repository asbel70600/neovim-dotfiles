if io.open("sqlconfig.lua", "r") == nil then
    local f = assert(io.open("sqlconfig.lua", "w"))
    f:write([[
vim.cmd("LspStop sqls")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

require'lspconfig'.sqls.setup{
    on_attach = function(client, bufnr)
        require('sqls').on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    settings = {
        sqls = {
            connections = {
        {
          driver = 'postgresql',
          dataSourceName = 'host=127.0.0.1 port=5432 user=postgres password=postgres dbname=mpmtest sslmode=disable',
        },
      },
    },
  },
}
]])
    f:close()
    vim.cmd("so sqlconfig.lua")
else
    vim.cmd("so sqlconfig.lua")
end
