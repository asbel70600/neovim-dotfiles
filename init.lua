vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 then
            local oldfiles = vim.fn.get(vim.v, "oldfiles", {})
            if not vim.tbl_isempty(oldfiles) then
                local last_file = vim.fn.expand(oldfiles[1])
                if vim.fn.filereadable(last_file) == 1 then
                    vim.cmd("silent! edit " .. vim.fn.fnameescape(last_file))
                end
            end
        end
    end,
})

-- Text shown in folds
function MyFoldText()
    local linestart = vim.fn.getline(vim.v.foldstart)
    local linend = vim.fn.getline(vim.v.foldend)
    linend = string.match(linend, "^%s*(.*)")

    local finalline = linestart .. " ... " .. linend
    local triling = string.rep(" ", vim.fn.winwidth(0) - string.len(finalline))
    return finalline .. triling
end

vim.g.mapleader = " "
require("config.lazy")
require("config.mappings")
require("config.autocmds")
require("config.options")
require("config.lsp")
require("config.theme")

-- if os.getenv("THEME") == "light" then
--     vim.cmd.colorscheme("rose-pine-dawn")
-- else
--     vim.cmd.colorscheme("rose-pine-moon")
-- end
--
-- vim.opt.rtp:prepend("/home/asbel/projects/vimP")
-- vim.keymap.set("n","<C-g>", function ()
--     require("vimp").askDevDocs()
-- end,{})
