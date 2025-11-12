-- Global variables
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

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
    require('plugins.render-markdown'),
    require('plugins.flash'),
    require('plugins.fzf'),
    require('plugins.mini.mini-nvim'),
    require('plugins.no-neck-pain'),
    require('plugins.fyler'),
    require('plugins.colorschemes.jellybeans'),
}, {
    ui = {
        border = 'single',
        backdrop = 100,
        icons = vim.g.have_nerd_font and {},
    },
})

-- Modules
require('options') -- Vim options
require('autocommands') -- General purpose autocommands
require('user-commands') -- User commands
require('lsp-config') -- LSP
require('keymaps') -- Keymaps

vim.cmd.colorscheme('gruvbox')
