vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.dark_default = 'gruber'
vim.g.light_default = 'dayfox'

require('options')

local github = 'https://github.com/'
local codeberg = 'https://codeberg.org/'
vim.pack.add({
    { src = github .. 'nvim-mini/mini.nvim' },
    { src = github .. 'ibhagwan/fzf-lua' },
    { src = github .. 'nvim-treesitter/nvim-treesitter' },
    { src = github .. 'saghen/blink.cmp', version = vim.version.range('*') },
    { src = github .. 'A7Lavinraj/fyler.nvim', version = 'stable' },
    { src = github .. 'shortcuts/no-neck-pain.nvim', version = vim.version.range('v2.5.2') },
    { src = github .. 'igorlfs/nvim-dap-view' },
    { src = github .. 'theHamsta/nvim-dap-virtual-text' },
    { src = codeberg .. 'mfussenegger/nvim-dap-python' },
    { src = codeberg .. 'mfussenegger/nvim-dap' },
})

require('plugins.mini')
require('plugins.fzf')
require('plugins.treesitter')
require('plugins.blink-cmp')
require('plugins.fyler')
require('plugins.no-neck-pain')
require('plugins.dap')

require('autocommands')
require('user-commands')
require('lsp-config')
require('keymaps')
require('statusline')
require('floating-windows')

require('utils').set_colorscheme_on_bg()
