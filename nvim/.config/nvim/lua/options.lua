-- Line numbers
vim.o.number = true

-- Sets how whitespace charactes are displayed
vim.o.list = true
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }
vim.opt.fillchars = { eob = ' ' }

-- Set default tab size
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4

-- Completion
vim.o.completeopt = 'menuone,noselect,fuzzy'
vim.o.pumheight = 10

-- General
vim.o.breakindent = true
vim.o.clipboard = 'unnamedplus'
vim.o.confirm = true
vim.o.cursorline = true
vim.o.exrc = true
vim.o.ignorecase = true
vim.o.lazyredraw = true
vim.o.linebreak = true
vim.o.mouse = 'a'
vim.o.scrolloff = 10
vim.o.showmode = false
vim.o.signcolumn = 'yes:1'
vim.o.smartcase = true
vim.o.spelllang = 'en_gb'
vim.o.spellcapcheck = ''
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.undofile = true
vim.o.undolevels = 1000
vim.o.updatetime = 250
vim.o.wrap = false
