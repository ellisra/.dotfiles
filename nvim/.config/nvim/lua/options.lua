-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Sets how whitespace charactes are displayed
vim.o.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }
vim.opt.fillchars = { eob = " " }

-- Set default tab size
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.autoindent = true

-- General
vim.o.breakindent = true -- Makes wrapped lines wrap to the same indent level
vim.o.clipboard = "unnamedplus" -- Sync yank register with system clipboard
vim.o.confirm = true -- Ask if you want to save unsaved changes on :q or :e
vim.o.cursorline = true -- Highlight cursor line
vim.o.ignorecase = true -- Ignore case sensitivity in search
vim.o.lazyredraw = true
vim.o.linebreak = true -- Wrap lines on spaces rather than characters
vim.o.mouse = "a" -- Allows mouse mode
vim.o.scrolloff = 10 -- Minimum number of lines above or below the cursor
vim.o.showmode = false -- Display mode visual since I'm using a bar
vim.o.signcolumn = "yes:1" -- Make sign column on by default
vim.o.smartcase = true -- Ignore case sensitivity in search
vim.o.spelllang = "en_gb" -- Sets spelling language to british english
vim.o.splitbelow = true -- Default horizontal split direction
vim.o.splitright = true -- Default vertical split direction
vim.o.timeoutlen = 300 -- Decrease mapped sequence wait time
vim.o.undofile = true -- Save undo history
vim.o.updatetime = 250 -- Decreases update time
