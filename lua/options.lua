vim.opt.encoding = "utf8"
vim.opt.fileformat = "unix"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.clipboard = "unnamedplus"

vim.cmd.colorscheme("kanagawa-wave")

-- Questions
vim.opt.inccommand = "split"
vim.opt.hidden = true
vim.opt.ttyfast = true
vim.opt.list = true
vim.opt.matchtime = 1

-- Visual
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.syntax = "enable"
vim.opt.termguicolors = true
vim.opt.laststatus = 10
vim.opt.showmode = true
vim.opt.listchars = "tab:<->,trail:."
vim.opt.wrap = false
vim.opt.wrapmargin = 2

-- Behavior
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = true
vim.opt.virtualedit = "block"
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
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Neovide
if vim.g.neovide then
    vim.opt.guifont = "JetBrainsMonoNL NFM SemiBold:h18"
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_fullscreen = true
    vim.g.neovide_cursor_animate_command_line = false
    vim.g.neovide_theme = "dark"
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_refresh_rate_idle = 1
    vim.g.neovide_no_idle = true
    vim.g.neovide_fullscreen = true
    vim.g.neovide_profiler = false
end
-- vim.g.neovide_cursor_trail_size = 1.8

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
-- Folding with treesitter
-- vim.opt.foldmethod = 'expr'
-- vim.opt.Folding = false
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- let g:netrw_winsize=25
-- let g:netrw_preview=1
--
--  autochdir
--  autowrite
--  autowriteall
--  set spell
-- set undofile
-- vim.opt.go+='!'
-- vim.opt.nowrap = true
-- " TERMINAL
-- set t_vb=
-- set tm=500
-- set t_Co=256
-- set clipboard=unnamedplus
-- set clipboard+=unnamed
-- vim.opt.wildchar = "<Tab>"
-- vim.opt.nohlsearch = true
-- vim.opt.noshowmatch = true
-- vim.opt.filetype = true
-- vim.opt.filetype_plugin = true
-- vim.opt.filetype_indent = true
-- vim.opt.syntax = true
-- vim.opt.fixdel = true
-- vim.opt.nocompatible = true
-- vim.opt.novisualbell = true
-- vim.opt.noerrorbells = true
-- let &t_ut=''
-- vim.opt.lazyredraw = true
