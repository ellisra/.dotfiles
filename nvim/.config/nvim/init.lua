-- Global variables
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- Modules
require("options") -- Vim options
require("autocommands") -- General purpose autocommands
require("user-commands") -- User commands
require("lazy-bootstrap") -- Install lazy.nvim
require("lazy-plugins") -- Plugins
require("lsp-config") -- LSP
require("keymaps") -- Keymaps
