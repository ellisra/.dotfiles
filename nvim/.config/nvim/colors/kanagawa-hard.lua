vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'kanagawa-hard'

local palette = require('palettes.kanagawa-hard')
require('mini.base16').setup({
    palette = {
        base00 = palette.bg0,
        base01 = palette.bg1,
        base02 = palette.bg2,
        base03 = palette.bg3,
        base04 = palette.fg3,
        base05 = palette.fg2,
        base06 = palette.fg1,
        base07 = palette.fg0,
        base08 = palette.red,
        base09 = palette.orange,
        base0A = palette.yellow,
        base0B = palette.green,
        base0C = palette.aqua,
        base0D = palette.blue,
        base0E = palette.purple,
        base0F = palette.error,
    },
})
