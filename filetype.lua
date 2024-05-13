-- vim.filetype.add({
--     extension = {
--         foo = "fooscript",
--     },
-- })
vim.filetype.add({
    extension = {
        h = function(path, bufnr)
            projectDirs = {
                "/home/asbel/Documents/sources/linux-6.8.2/.*.h",
                "/home/home/Documents/sources/linux-6.8.2/.*.h",
            }
            dir = string.match("/home/asbel/Documents/sources/linux-6.8.2/.*.h$", path)
            if dir then
                return "c"
            end
            dir = string.match("/home/asbel/Documents/sources/linux-6.8.2/.*.h$", path)
            if dir then
            return "c"
            end
            --       local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, true);
            --       if first_line:match('<iostream>') then
            --         return "cpp"
            --       end
            --       return "c"
            return "c"
        end,
    },
})
