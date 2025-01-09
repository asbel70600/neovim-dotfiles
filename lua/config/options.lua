vim.opt.encoding = "utf8"
vim.opt.fileformat = "unix"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.clipboard = "unnamedplus"

vim.o.timeout = true
vim.o.timeoutlen = 800

-- :h 'shada'
vim.opt.shada = "!,%,<10000,'500,/50,:100,s100000,r/tmp,r/mnt,r/media,r/efi,r/opt,r/doc,r/home/asbel/apps/nvim/share/nvim,r/home/asbel/.xdg/local/share/nvim,r/usr/share/,n/home/asbel/.xdg/shada"

-- Questions
vim.opt.inccommand = "split"
-- vim.opt.hidden = true
vim.opt.ttyfast = true
vim.opt.list = true
vim.opt.matchtime = 1

-- Visual
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 5
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 1
vim.opt.syntax = "on"
vim.opt.filetype = "on"
vim.opt.termguicolors = true
vim.opt.showmode = true
vim.opt.laststatus = 3
vim.opt.listchars = "tab:<->,trail:."
vim.opt.wrapmargin = 2

-- Behavior
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = true
vim.opt.magic = true
vim.opt.belloff = "all"
vim.opt.undofile = true
vim.opt.undodir = "/home/asbel/.xdg/local/share/nvim/undo"

-- Wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = "lastused:list,full:list"
vim.opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"

-- Tabs
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Misc
vim.opt.title = true
vim.opt.path = "**"
vim.opt.background = "dark"
vim.opt.history = 100

-- Backup
vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.backupdir = "/tmp"
vim.opt.backspace = "indent,eol,start"

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Folding with treesitter
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 1
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.MyFoldText()"

-- Neovide
if vim.g.neovide then
    vim.opt.guifont = "MonaspiceXe Nerd Font:h18:#e-subpixelantialias:#h-none"
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_fullscreen = true
    vim.g.neovide_cursor_animate_command_line = false
    vim.g.neovide_theme = "dark"
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_refresh_rate_idle = 1
    vim.g.neovide_no_idle = false
    vim.g.neovide_fullscreen = true
    vim.g.neovide_profiler = false
    vim.g.neovide_scale_factor = 1.0
    vim.g.neovide_text_gamma = 0.8
    vim.g.neovide_text_contrast = 0.1
    -- vim.g.neovide_cursor_trail_size = 1.8
end

vim.g.netrw_preview = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 30

vim.filetype.add({
    pattern = {
        [".*%.blade%.php"] = "blade",
    },
})

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

-- try
--     set undofile
-- catch
-- endtry
-- set timeout
-- set timeoutlen=150
-- set ttimeoutlen=0
-- let g:tagbar_phpctags_memory_limit = '512M'
-- let g:airline_theme='ayu_mirage'
-- set termguicolors
-- let ayucolor="dark"
-- colorscheme ayu
-- vim.opt.omnifunc = "syntaxcomplete#Complete"
--echo nvim_treesitter#statusline(90)  " 90 can be any length
--module->expression_statement->call->identifier
--  autochdir
--  autowrite
--  autowriteall
--  set spell
-- set undofile
-- vim.opt.go+='!'
-- " TERMINAL
-- set t_vb=
-- set tm=500
-- set t_Co=256
-- set clipboard=unnamedplus
-- set clipboard+=unnamed
-- vim.opt.wildchar = "<Tab>"
-- vim.opt.nohlsearch = true
-- vim.opt.noshowmatch = true
-- vim.opt.filetype_indent = true
-- vim.opt.syntax = true
-- vim.opt.fixdel = true
-- vim.opt.nocompatible = true
-- vim.opt.novisualbell = true
-- vim.opt.noerrorbells = true
-- let &t_ut=''
-- vim.opt.lazyredraw = true
