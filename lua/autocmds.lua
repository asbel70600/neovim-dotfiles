require("mappings")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		local opts = { buffer = ev.buf }
		MY_KEYMAPS.OnLSPAttach(opts)
	end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", { command = [[set hlsearch]] })
vim.api.nvim_create_autocmd("CmdlineLeave", { command = [[set nohlsearch]] })

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "e dummie"
    end
  end
})

-- vim.api.nvim_create_autocmd("WinEnter",{
--     callback = function (ev)
-- --        print(vim.inspect(ev))
--         local name = string.match(ev.file,"__Mundo_")
--
--         if name then
--             local buffer = ev.buf
--             vim.bo[buffer].guifont = "Hack:h12"
--             print("this is mundo in buffer " .. ev.buf)
--         else
--             print("this isn't mundo")
--         end
--     end
-- })

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*",
-- 	callback = function(args)
-- 		require("conform").format({ bufnr = args.buf })
-- 	end,
-- })

