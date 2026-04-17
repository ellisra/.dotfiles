vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.dark_default = 'gruber'
vim.g.light_default = 'dayfox'

require('options')

local gh = 'https://github.com/'
local cb = 'https://codeberg.org/'
vim.pack.add({
    { src = gh .. 'nvim-mini/mini.nvim' },
    { src = gh .. 'ibhagwan/fzf-lua' },
    { src = gh .. 'nvim-treesitter/nvim-treesitter' },
    { src = gh .. 'saghen/blink.cmp', version = vim.version.range('*') },
    { src = gh .. 'A7Lavinraj/fyler.nvim', version = 'stable' },
    { src = gh .. 'shortcuts/no-neck-pain.nvim' },
    -- TODO: switch back to main once this is merged
    { src = gh .. 'ellisra/nvim-dap-view', version = 'configure-virtual-text' },
    { src = cb .. 'mfussenegger/nvim-dap' },
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
require('lspconfig')
require('keymaps')
require('statusline')
require('floating-windows')

require('highlights').set_colorscheme_on_bg()
