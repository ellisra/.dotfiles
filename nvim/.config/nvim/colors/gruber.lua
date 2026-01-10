vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'gruber'

local palette = {
    background = '#181818',
    cursorline = '#282828',
    visual     = '#453d41',
    comment    = '#565f73',
    argument   = '#b0b0b0',
    delimeter  = '#e4e4e4',
    foreground = '#e4e4e4',
    operator   = '#969696',
    keyword    = '#ffdd33',
    class      = '#95a99f',
    func       = '#96a6c8',
    string     = '#73d936',
    number     = '#9e95c7',
    error      = '#f43841',
    warning    = '#ffdd33',
    hint       = '#96a6c8',
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
