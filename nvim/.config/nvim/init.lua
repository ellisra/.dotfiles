-- Global variables
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.dark_default = 'alabaster'
vim.g.light_default = 'dawnfox'

-- Lazy bootstrap
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    require('plugins.blink-cmp'),
    require('plugins.treesitter'),
    require('plugins.fzf'),
    require('plugins.mini'),
    require('plugins.no-neck-pain'),
    require('plugins.fyler'),
}, {
    ui = {
        border = 'single',
        backdrop = 100,
        icons = vim.g.have_nerd_font and {},
    },
})

-- Modules
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
