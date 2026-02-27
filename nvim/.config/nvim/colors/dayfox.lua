vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'dayfox'

local palette = {
    background = '#ededed',
    cursorline = '#d8d8d8',
    visual     = '#c9c9c9',
    comment    = '#a3a8af',
    argument   = '#4f6d8b',
    delimeter  = '#34383c',
    foreground = '#34383c',
    operator   = '#a275aa',
    keyword    = '#b0516e',
    class      = '#9e6736',
    func       = '#526b80',
    string     = '#20704b',
    number     = '#20704b',
    error      = '#b0516e',
    warning    = '#9e6736',
    hint       = '#4f6d8b',
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
        base0D = palette.number,
        base0E = palette.hint,
        base0F = palette.error,
    },
})
