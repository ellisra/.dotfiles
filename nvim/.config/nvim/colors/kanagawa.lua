vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'kanagawa'

local palette = {
    background = '#1f1f28',
    cursorline = '#16161d',
    visual     = '#223249',
    comment    = '#5f5f7c',
    argument   = '#a8a697',
    delimeter  = '#dcd7ba',
    foreground = '#c8c093',
    operator   = '#899696',
    keyword    = '#957fb8',
    class      = '#c0a36e',
    func       = '#76946a',
    string     = '#6a9589',
    number     = '#6a9589',
    error      = '#c34043',
    warning    = '#c0a36e',
    hint       = '#7e9cd8',
}

require('mini.base16').setup({
    palette = {
        base00 = palette.background,
        base01 = palette.cursorline,
        base02 = palette.visual,
        base03 = palette.comment,
        base04 = palette.argument,
        base05 = palette.delimeter,
        base06 = palette.foreground,
        base07 = palette.operator,
        base08 = palette.keyword,
        base09 = palette.warning,
        base0A = palette.class,
        base0B = palette.func,
        base0C = palette.string,
        base0D = palette.hint,
        base0E = palette.number,
        base0F = palette.error,
    },
})
