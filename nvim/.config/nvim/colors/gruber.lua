vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'gruber'

local palette = {
    background = '#181818',
    cursorline = '#282828',
    visual     = '#453d41',
    dimmed     = '#6E7991',
    argument   = '#b0b0b0',
    foreground = '#e4e4e4',
    -- comment    = '#cc8c3c',
    comment    = '#6E7991',
    operator   = '#969696',
    keyword    = '#ffdd33',
    class      = '#95a99f',
    func       = '#96a6c8',
    string     = '#73d936',
    number     = '#73d936',
    error      = '#f43841',
    warning    = '#ffdd33',
    hint       = '#96a6c8',
}

require('mini.base16').setup({
    palette = {
        base00 = palette.background,
        base01 = palette.cursorline,
        base02 = palette.visual,
        base03 = palette.dimmed,
        base04 = palette.argument,
        base05 = palette.foreground,
        base06 = palette.comment,
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
