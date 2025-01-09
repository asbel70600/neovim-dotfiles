-- local function foldtxt()
--     local startLine = vim.v.foldstart
--     local endLine = vim.v.foldend
-- 
--     local startText = vim.fn.getline(startLine)
--     local endText = vim.fn.getline(endLine)
-- 
--     return "This is a fold"
-- end
-- 
-- -- Define a custom foldtext function
-- function custom_foldtext()
--     local fold_start_line = vim.fn.getline(vim.v.foldstart)
--     local cleaned_line = fold_start_line:gsub("/%*", ""):gsub("%*/", ""):gsub("{{{%d*", "")
--     return "clase cosa esta"
-- end
-- 
-- -- Set the foldtext option to use the custom function
-- vim.opt.foldtext = 'v:lua.custom_foldtext()'

function custom_foldtext()
    return vim.v.folddashes .. "bullshio"
end

-- Set the foldtext option to use the custom function
vim.opt.foldtext = 'v:lua.custom_foldtext()'
