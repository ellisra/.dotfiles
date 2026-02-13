vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'habamax'

local palette = {
    background = '#1c1c1c',
    cursorline = '#303030',
    visual     = '#1a3456',
    comment    = '#767676',
    argument   = '#BED1D0',
    delimeter  = '#c7c7c7',
    foreground = '#c7c7c7',
    operator   = '#d7af87',
    keyword    = '#af87af',
    type       = '#789DC2',
    func       = '#87afaf',
    string     = '#5faf5f',
    number     = '#5faf5f',
    error      = '#af5f5f',
    warning    = '#d7af87',
    hint       = '#87afaf',
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
        base0A = palette.type,
        base0B = palette.func,
        base0C = palette.string,
        base0D = palette.hint,
        base0E = palette.number,
        base0F = palette.error,
    },
})
