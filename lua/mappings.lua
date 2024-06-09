MY_KEYMAPS = {}

local opts = {
    noremap = true, -- non-recursive
    silent = true, -- do not show message
}

vim.keymap.set(
    "n",
    "gx",
    '<cmd>normal k$/https\\?:\\/\\/\\S\\+<CR>nyW:!hyprctl dispatch exec -- \\[fullscreen] chromium <C-R>" --new-window<CR><CR>:nohl<CR>',
    { silent = true }
)
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "]q", "<cmd>cnext<cr>", opts)
vim.keymap.set("n", "[q", "<cmd>cprev<cr>", opts)
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<C-TAB>", "<cmd>bn<cr>", opts)
vim.keymap.set("n", "<C-.>", "<cmd>bn<cr>", opts)
-- vim.keymap.set("n", "<C-.>", "<cmd>bn<cr>", opts)
vim.keymap.set("n", "<C-BS>", "<cmd>bd<cr>", opts)
vim.keymap.set("n", "<F3>", "<cmd>lua require('conform').format({bufnr = vim.fn.bufnr('%')})<cr>", opts)
vim.keymap.set("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})
vim.keymap.set("n", "<C-A>", "<cmd>CHADopen<cr>", opts)
vim.keymap.set("n", "<C-;>", ":!",{})

vim.keymap.set("t", "<C-O>", "<C-\\><C-N><C-O>",opts)
vim.keymap.set("t", "<C-A>", "<cmd>CHADopen<cr>", opts)
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>",opts)
vim.keymap.set("t", "<A-j>", "<C-\\><C-N><C-O>",opts)
vim.keymap.set("n", "<A-j>",
    function()
        for _,value in pairs(vim.api.nvim_list_bufs()) do
            local buffername = vim.api.nvim_buf_get_name(value)
            local name = string.match(buffername,"term:///")
            if name then
                vim.cmd("buffer " .. value)
                return 0
            end
        end
        vim.cmd("terminal")
        vim.cmd("normal i")
    end
    ,opts)
vim.keymap.set("t", "<C-TAB>", "<C-\\><C-N><cmd>bn<cr>",opts)

-- On LSP attach
MY_KEYMAPS.OnLSPAttach = function(opts)
    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    -- vim.keymap.set("n", "<Leader>D", vim.lsp.buf.definition, opts)
    -- vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-Space>", vim.lsp.buf.completion, opts)
    vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<Leader>gf", vim.lsp.buf.format, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<Leader>o", vim.diagnostic.open_float)
    vim.keymap.set("n", "[e", function()
        vim.diagnostic.goto_prev({
            severity = {
                min = vim.diagnostic.severity.INFO,
            },
        })
    end, opts)
    vim.keymap.set("n", "]e", function()
        vim.diagnostic.goto_next({
            severity = {
                min = vim.diagnostic.severity.INFO,
            },
        })
    end, opts)

    vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<Leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
end

MY_KEYMAPS.OnLuasnipAttach = function(opts)
    local ls = require("luasnip")
    vim.keymap.set({ "i", "s" }, "<A-TAB>", function()
        ls.jump(1)
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<S-A-TAB>", function()
        ls.jump(-1)
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-.>", function()
        if ls.choice_active() then
            ls.change_choice(1)
        end
    end, { silent = true })
end

MY_KEYMAPS.OnTelescopeReady = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<S-CR>", builtin.builtin, opts)
    vim.keymap.set("n", "<Leader>ff", builtin.find_files, opts)
    vim.keymap.set("n", "<Leader>fo", builtin.oldfiles, opts)
    vim.keymap.set("n", "<Leader>fw", "<cmd>Telescope workspaces<cr>", opts)
    vim.keymap.set("n", "<Leader>fg", builtin.live_grep, opts)
    vim.keymap.set("n", "<Leader>fa", builtin.current_buffer_fuzzy_find, opts)
    vim.keymap.set("n", "<Leader>fc", builtin.command_history, opts)
    vim.keymap.set("n", "<Leader>fs", builtin.grep_string, opts)
    vim.keymap.set("v", "<Leader>fs", builtin.grep_string, opts)
    vim.keymap.set("n", "<Leader>fd", builtin.diagnostics, opts)

    vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
    vim.keymap.set("n", "gt", builtin.lsp_type_definitions, opts)
    vim.keymap.set("n", "gr", builtin.lsp_references, opts)
    vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)

    -- vim.keymap.set("n", "K", builtin.lsp_document_symbols, opts)
    -- vim.keymap.set("n", "<Leader>fk", builtin.lsp_incoming_calls, opts)
    -- vim.keymap.set("n", "<Leader>fj", builtin.lsp_outgoing_calls, opts)
    -- vim.keymap.set("n", "<Leader>fws", builtin.lsp_workspace_symbols, opts)
    -- vim.keymap.set("n", "<Leader>fdws", builtin.lsp_dynamic_workspace_symbols, opts)
end

MY_KEYMAPS.treesitterSelectionKeymaps = {
    init_selection = "<Leader>ss",
    node_incremental = "<Leader>si",
    node_decremental = "<Leader>sd",
    scope_incremental = "<Leader>so",
}

MY_KEYMAPS.treesitterTextObjectKeymaps = {

    ["af"] = "@function.outer",
    ["if"] = "@function.inner",

    ["ii"] = "@conditional.inner",

    ["al"] = "@loop.outer",
    ["il"] = "@loop.inner",

    ["ap"] = "@parameter.outer",
    ["ip"] = "@parameter.inner",

    ["ir"] = "@return.inner",

    ["ac"] = "@call.outer",
    ["ic"] = "@call.inner",
}

MY_KEYMAPS.OnDapAdapterReady = function ()
    -- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end,opts)
    -- vim.keymap.set('n', '<Leader>dd', function() require('dap').set_breakpoint() end,opts)
    vim.keymap.set('n', '<F5>', function() require('dap').continue() end,opts)
    vim.keymap.set('n', '<F10>', function() require('dap').step_over() end,opts)
    vim.keymap.set('n', '<F11>', function() require('dap').step_into() end,opts)
    vim.keymap.set('n', '<F12>', function() require('dap').step_out() end,opts)
    vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end,opts)
    vim.keymap.set('n', '<Leader>dm', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,opts)
    vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end,opts)
    vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
    end,opts)
    vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
      require('dap.ui.widgets').preview()
    end,opts)
    vim.keymap.set('n', '<Leader>df', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end,opts)
    vim.keymap.set('n', '<Leader>ds', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end,opts)
end

-- MY_KEYMAPS.OnTelescopeReady()
MY_KEYMAPS.OnLSPAttach(opts)
MY_KEYMAPS.OnLuasnipAttach(opts)
-- MY_KEYMAPS.OnDapAdapterReady(opts)
-- vim.keymap.set("n", "<S-Enter>", "<cmd>Vexplore 30<cr>",opts)
