set makeprg=docker\ exec\ backend\ npm\ run\ build
set errorformat=
      \%-G,
      \%-G>%.%#,
      \%-G\\s%#,
      \%f(%l\\,%c):\ error\ %m

noremap <leader>r :make<CR>

command! -nargs=1 -complete=file Resource call OpenResourceFiles(<f-args>)

function! OpenResourceFiles(resource)
    " Define file paths
    let schema = 'src/schemas/' . a:resource . '.schema.ts'
    let routes = 'src/routes/' . a:resource . '.ts'
    let service = 'src/services/crud_' . a:resource . '.service.ts'

    " Open files in three vertical splits
    execute 'edit ' . schema
    execute 'vsplit ' . routes
    execute 'vsplit ' . service

    " Balance the window sizes
    wincmd =

    " Focus on the first window (schema)
    wincmd h
    wincmd h
endfunction

command! -nargs=1 FillResource call FillResourceTemplate(<f-args>)

function! FillResourceTemplate(resource)
    " Read template file from disk
    let template_path = 'template.md'
    if !filereadable(template_path)
        echo 'Error: template.md not found'
        return
    endif
    
    let template = join(readfile(template_path), "\n")
    
    " Read the three source files
    let schema_path = 'src/schemas/' . a:resource . '.schema.ts'
    let route_path = 'src/routes/' . a:resource . '.ts'
    let service_path = 'src/services/crud_' . a:resource . '.service.ts'
    
    " Function to read file content
    function! ReadFileContent(path)
        if filereadable(a:path)
            return join(readfile(a:path), "\n")
        else
            return '// File not found: ' . a:path
        endif
    endfunction
    
    let schema_content = ReadFileContent(schema_path)
    let route_content = ReadFileContent(route_path)
    let service_content = ReadFileContent(service_path)
    
    " Replace markers
    let result = template
    let result = substitute(result, '{{{{resource}}}}', a:resource, 'g')
    let result = substitute(result, '{{{{schema}}}}', schema_content, 'g')
    let result = substitute(result, '{{{{route}}}}', route_content, 'g')
    let result = substitute(result, '{{{{service}}}}', service_content, 'g')
    
    " Create new buffer
    enew
    setlocal filetype=markdown
    
    " Insert content
    let result_lines = split(result, "\n", 1)
    call setline(1, result_lines)
    
    " Save the file
    let output_file = 'resource_' . a:resource . '.md'
    execute 'write! ' . output_file
    
    echo 'Created ' . output_file
endfunction
