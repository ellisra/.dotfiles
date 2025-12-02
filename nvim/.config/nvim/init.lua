-- Global variables
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

local github = require('constants').GITHUB
vim.pack.add({
    { src = github .. 'saghen/blink.cmp', version = 'v1.8.0' },
    { src = github .. 'ibhagwan/fzf-lua' },
    { src = github .. 'A7Lavinraj/fyler.nvim', version = 'stable' },
    { src = github .. 'nvim-mini/mini.nvim' },
    { src = github .. 'shortcuts/no-neck-pain.nvim' },
    { src = github .. 'nvim-treesitter/nvim-treesitter', version = 'main' },
})

require('plugins.blink-cmp')
require('plugins.fzf')
require('plugins.fyler')
require('plugins.mini.mini-nvim')
require('plugins.no-neck-pain')
require('plugins.treesitter')

require('options')
require('autocommands')
require('user-commands')
require('lsp-config')
require('keymaps')

if vim.o.background == 'light' then
    vim.cmd.colorscheme('dawnfox')
else
    vim.cmd.colorscheme('gruvbox')
end
