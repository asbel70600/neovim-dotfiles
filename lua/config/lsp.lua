local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

local function previousDiagnostics()
    vim.diagnostic.goto_prev({
        severity = {
            min = vim.diagnostic.severity.INFO,
        },
    })
end

local function nextDiagnostics()
    vim.diagnostic.goto_next({
        severity = {
            min = vim.diagnostic.severity.INFO,
        },
    })
end

local function listWorkspaceFolders()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        -- vim.keymap.set("n", "<Leader>ld", "<cmd>Lspsaga finder def<CR>", { desc = "definition" })
        vim.keymap.set("n", "<Leader>lr", "<cmd>Lspsaga finder ref<CR>", { desc = "references" })

        vim.keymap.set("n", "<Leader>lD", "<cmd>Lspsaga<CR>", { desc = "declaration" })
        vim.keymap.set("n", "<Leader>ld", "<cmd>Lspsaga goto_definition<CR>", { desc = "definition" })
        vim.keymap.set("n", "<Leader>lt", "<cmd>Lspsaga goto_type_definition<CR>", { desc = "type definition" })

        vim.keymap.set("n", "<Leader>lpD", "<cmd>Lspsaga<CR>", { desc = "declaration" })
        vim.keymap.set("n", "<Leader>lpd", "<cmd>Lspsaga peek_definition<CR>", { desc = "definition" })
        vim.keymap.set("n", "<Leader>lpt", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "type definition" })

        vim.keymap.set("n", "<Leader>lci", "<cmd>Lspsaga incoming_calls<CR>", { desc = "incoming calls" })
        vim.keymap.set("n", "<Leader>lco", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "outgoing calls" })

        vim.keymap.set("n", "<Leader>la", "<cmd>Lspsaga code_action<CR>", { desc = "code actions" })
        vim.keymap.set("v", "<Leader>la", "<cmd>Lspsaga code_action<CR>", { desc = "code actions" })

        vim.keymap.set("n", "<Leader>li", "<cmd>Lspsaga finder imp<CR>", { desc = "implementations" })
        vim.keymap.set("n", "<Leader>lo", "<cmd>Lspsaga outline<CR>", { desc = "implementations" })

        vim.keymap.set("n", "<Leader>lsw", vim.lsp.buf.workspace_symbol, { desc = "workspace symbol" })
        vim.keymap.set("n", "<Leader>lsd", vim.lsp.buf.document_symbol, { desc = "document symbol" })

        vim.keymap.set("n", "<C-Space>", vim.lsp.buf.completion, { desc = "completion" })
        vim.keymap.set("n", "<Leader>lf", vim.lsp.buf.format, { desc = "Format" })
        vim.keymap.set("n", "<Leader>lR", "<cmd>Lspsaga rename<CR>", { desc = "Rename symbol" })

        vim.keymap.set("n", "<Leader>lh", vim.lsp.buf.document_highlight, { desc = "Highlight references" })
        vim.keymap.set("n", "<Leader>lH", vim.lsp.buf.clear_references, { desc = "Clear highlight" })

        vim.keymap.set("n", "<A-H>", vim.lsp.buf.signature_help, { desc = "signature help" })
        vim.keymap.set("v", "<A-H>", vim.lsp.buf.signature_help, { desc = "signature help" })
        vim.keymap.set("n", "<A-h>", "<cmd>Lspsaga hover_doc<CR>", { desc = "hover information" })
        vim.keymap.set("v", "<A-h>", "<cmd>Lspsaga hover_doc<CR>", { desc = "hover information" })
        vim.keymap.set("n", "<A-t>", "<cmd>Lspsaga term_toggle<CR>", { desc = "Toggle terminal" })
        vim.keymap.set("t", "<A-t>", "<cmd>Lspsaga term_toggle<CR>", { desc = "Toggle terminal" })

        vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "hover information" })
        vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "hover information" })

        vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"
    end,
})

-- Unused
-- vim.lsp.buf.execute_command()

-- vim.lsp.buf.completion()
-- vim.lsp.buf.code_action()
-- vim.lsp.buf.execute_command()
-- vim.lsp.buf.rename()
-- vim.lsp.buf.format()
-- vim.lsp.buf.hover()

-- vim.lsp.buf.add_workspace_folder()
-- vim.lsp.buf.workspace_symbol()
-- vim.lsp.buf.list_workspace_folders()
-- vim.lsp.buf.remove_workspace_folder()

-- vim.lsp.buf.clear_references()

-- vim.lsp.buf.type_definition()
-- vim.lsp.buf.definition()
-- vim.lsp.buf.declaration()
-- vim.lsp.buf.implementation()
-- vim.lsp.buf.references()
-- vim.lsp.buf.signature_help()
--
-- vim.lsp.buf.document_highlight()
-- vim.lsp.buf.document_symbol()
--
-- vim.lsp.buf.incoming_calls()
-- vim.lsp.buf.outgoing_calls()
--
-- vim.lsp.buf.server_ready()
--
-- callHierarchy/incomingCalls
-- callHierarchy/outgoingCalls
-- textDocument/codeAction
-- textDocument/completion
-- textDocument/definition
-- textDocument/documentHighlight
-- textDocument/documentSymbol
-- textDocument/formatting
-- textDocument/hover
-- textDocument/publishDiagnostics
-- textDocument/rangeFormatting
-- textDocument/references
-- textDocument/rename
-- textDocument/signatureHelp

-- window/logMessage
-- window/showMessage
-- window/showDocument
-- window/showMessageRequest

-- workspace/applyEdit
-- workspace/symbol

-- textDocument/typeDefinition*
-- textDocument/implementation*
-- textDocument/declaration*
