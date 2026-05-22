-- misc
vim.o.encoding = "utf8"
vim.o.fileformat = "unix"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.o.timeout = true
vim.o.timeoutlen = 800
vim.o.inccommand = "nosplit"
vim.o.hidden = true
vim.o.list = true
vim.o.matchtime = 1
vim.o.showmatch = true
vim.o.spelllang = "en_us"
vim.o.spell = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false

-- Exrc
vim.o.exrc = true
vim.opt.secure = false

vim.opt.shada = "!,%,<30,'30,/50,:30,s10,r/tmp,r/mnt,r/media,r/efi,r/opt,r/doc,r/usr/share/,n/home/asbel/.xdg/shada"
vim.opt.shadafile = "/home/asbel/.xdg/shada"

vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)

-- -- Visual
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10
vim.o.number = true
vim.o.relativenumber = true
vim.o.cmdheight = 1
vim.o.termguicolors = true
vim.o.showmode = false
vim.o.listchars = "tab:<->,trail:."
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.wrapmargin = 2
vim.o.signcolumn = "number"
vim.o.numberwidth = 1
vim.o.laststatus = 0
-- vim.o.cmdheight = 0

-- Behavior
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.wrap = true
vim.o.magic = true
vim.o.belloff = "all"
vim.o.undofile = true
vim.o.undodir = "/home/asbel/.xdg/local/share/nvim/undo"
vim.o.confirm = true

-- Wildmenu
vim.o.wildmenu = true
vim.o.wildmode = "lastused:list,full:list"
vim.o.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"

-- Tabs
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.breakindent = true

-- Misc
vim.opt.title = true
vim.opt.path = "**"
vim.opt.background = "dark"
vim.opt.history = 100
--
-- Backup
vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.backupdir = "/home/asbel/.local/state/nvim/backup"
vim.opt.backspace = "indent,eol,start"

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Neovide
if vim.g.neovide then
    vim.opt.guifont = "Monaspace Xenon:h18:#e-subpixelantialias:#h-none"
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_fullscreen = false
    vim.g.neovide_cursor_animate_command_line = false
    vim.g.neovide_theme = "auto"
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_refresh_rate_idle = 1
    vim.g.neovide_no_idle = false
    vim.g.neovide_profiler = false
    vim.g.neovide_scale_factor = 1.0
    vim.g.neovide_text_gamma = 0.8
    vim.g.neovide_text_contrast = 0.1
    -- vim.g.neovide_cursor_trail_size = 1.8
end

vim.filetype.add({
    pattern = {
        [".*%.blade%.php"] = "blade",
    },
})

vim.filetype.add({
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

-- vim.opt.foldmethod = "manual" -- Set fast default
-- vim.api.nvim_create_autocmd("BufReadPost", {
--     callback = function()
--         -- Folding
--         function MyFoldText()
--             local linestart = vim.fn.getline(vim.v.foldstart)
--             local linend = vim.fn.getline(vim.v.foldend)
--             linend = string.match(linend, "^%s*(.*)")
--
--             local finalline = linestart .. " ... " .. linend
--             local triling = string.rep(" ", vim.fn.winwidth(0) - string.len(finalline))
--             return finalline .. triling
--         end
--
--         vim.opt.foldcolumn = "0"
--         vim.opt.foldlevel = 1
--         vim.opt.foldlevelstart = 99
--         vim.opt.foldenable = true
--         vim.opt.foldmethod = "expr"
--         vim.opt.foldtext = "v:lua.MyFoldText()"
--     end,
-- })
