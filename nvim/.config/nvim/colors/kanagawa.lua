vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'kanagawa'

local palette = require('palettes.kanagawa')
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

-- require('base16-colorscheme').setup({
--     base00 = '#1f1f28', -- bg0
--     base01 = '#16161d', -- bg1
--     base02 = '#223249', -- bg2
--     base03 = '#5f5f7c', -- bg3
--     base04 = '#727169', -- fg3
--     base05 = '#dcd7ba', -- fg2
--     base06 = '#c8c093', -- fg1
--     base07 = '#717c7c', -- fg0
--     base08 = '#c34043', -- red
--     base09 = '#ffa066', -- orange
--     base0A = '#c0a36e', -- yellow
--     base0B = '#76946a', -- green
--     base0C = '#6a9589', -- aqua
--     base0D = '#7e9cd8', -- blue
--     base0E = '#957fb8', -- purple
--     base0F = '#d27e99', -- bonus
-- })
