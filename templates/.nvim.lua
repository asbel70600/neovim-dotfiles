-- Run Program
vim.o.makeprg = "cargo"
vim.o.errorformat = ""
local errorfm = table.concat({
	[[%-G%\s%#Some errors have detailed explanations%.%#]],
	[[%-G%\s%#For more information about an error, try%.%#]],
	[[%-G%\s%#Caused by:%.%#]],
	[[%-G%\s%#process didn't exit successfully%.%#]],
	[[%-G%\s%#Building%.%#]],
	[[%-G%\s%#Fresh%.%#]],
	[[%-G]],
}, ",")

vim.cmd([[compiler cargo]])
vim.o.errorformat = vim.o.errorformat .. "," .. errorfm

-- # Keymaps
vim.keymap.set("n", "<Leader>r", function()
	vim.cmd([[make run]])
end)

-- {
--    marker: filesource,
--    marker2: filesource2
-- }
local function updateTemplate(file) end

-- command! -nargs=1 FillResource call FillResourceTemplate(<f-args>)
--
-- function! FillResourceTemplate(resource)
--     " Read template file from disk
--     let template_path = 'template.md'
--     if !filereadable(template_path)
--         echo 'Error: template.md not found'
--         return
--     endif
--
--     let template = join(readfile(template_path), "\n")
--
--     " Read the three source files
--     let schema_path = 'src/schemas/' . a:resource . '.schema.ts'
--     let route_path = 'src/routes/' . a:resource . '.ts'
--     let service_path = 'src/services/crud_' . a:resource . '.service.ts'
--
--     " Function to read file content
--     function! ReadFileContent(path)
--         if filereadable(a:path)
--             return join(readfile(a:path), "\n")
--         else
--             return '// File not found: ' . a:path
--         endif
--     endfunction
--
--     let schema_content = ReadFileContent(schema_path)
--     let route_content = ReadFileContent(route_path)
--     let service_content = ReadFileContent(service_path)
--
--     " Replace markers
--     let result = template
--     let result = substitute(result, '{{{{resource}}}}', a:resource, 'g')
--     let result = substitute(result, '{{{{schema}}}}', schema_content, 'g')
--     let result = substitute(result, '{{{{route}}}}', route_content, 'g')
--     let result = substitute(result, '{{{{service}}}}', service_content, 'g')
--
--     " Create new buffer
--     enew
--     setlocal filetype=markdown
--
--     " Insert content
--     let result_lines = split(result, "\n", 1)
--     call setline(1, result_lines)
--
--     " Save the file
--     let output_file = 'resource_' . a:resource . '.md'
--     execute 'write! ' . output_file
--
--     echo 'Created ' . output_file
-- endfunction
-- [[%-Gerror: aborting %.%#]],
-- [[%-Gerror: Could not compile %.%#]],
-- [[%-G%\s%#Downloading%.%#]],
-- [[%-G%\s%#Checking%.%#]],
-- [[%-G%\s%#Compiling%.%#]],
-- [[%-G%\s%#Finished%.%#]],
-- [[%-G%\s%#error: Could not compile %.%#]],
-- [[%-G%\s%#To learn more\,%.%#]],
-- [[%-G%\s%#For more information about this error\,%.%#]],
-- [[%-Gnote: Run with `RUST_BACKTRACE=%.%#]],
-- [[%-G%\s%#Fresh%.%#]],
-- -- errors
-- [[%Eerror: %m]],
-- [[%Eerror[E%n]: %m]],
-- [[%E%\s%#left:%m,%C right:%m %f:%l:%c,%Z]],
-- [[%C %#--> %f:%l:%c]],
-- -- warnings
-- [[%Wwarning: %m]],
-- [[%Inote: %m]],
-- [[%.%#panicked at '%m', %f:%l:%c]],
