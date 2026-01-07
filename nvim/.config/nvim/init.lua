-- Global variables
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.dark_default = 'alabaster'
vim.g.light_default = 'dawnfox'

local github = require('constants').GITHUB
vim.pack.add({
    { src = github .. 'saghen/blink.cmp', version = 'v1.8.0' },
    { src = github .. 'ibhagwan/fzf-lua' },
    { src = github .. 'A7Lavinraj/fyler.nvim', version = 'stable' },
    { src = github .. 'nvim-mini/mini.nvim' },
    { src = github .. 'shortcuts/no-neck-pain.nvim', version = 'v2.5.2' },
    { src = github .. 'nvim-treesitter/nvim-treesitter' },
})

require('plugins.blink-cmp')
require('plugins.fzf')
require('plugins.fyler')
require('plugins.mini')
require('plugins.no-neck-pain')
require('plugins.treesitter')

require('options')
require('autocommands')
require('user-commands')
require('lsp-config')
require('keymaps')
require('statusline')
require('floating-windows')

if vim.o.background == 'light' then
    vim.cmd.colorscheme(vim.g.light_default)
else
    vim.cmd.colorscheme(vim.g.dark_default)
end
