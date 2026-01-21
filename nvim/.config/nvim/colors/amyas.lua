vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'amyas'

local palette = {
    background = '#1b1818',
    cursorline = '#121010',
    visual     = '#3f2b25',
    comment    = '#6d6769',
    argument   = '#d0bbae',
    delimeter  = '#fce8c7',
    foreground = '#fce8c7',
    operator   = '#d0bbae',
    keyword    = '#e2ae89',
    class      = '#d6bc97',
    func       = '#bb645c',
    string     = '#d5a466',
    number     = '#d5a466',
    error      = '#bb645c',
    warning    = '#d7a373',
    hint       = '#d5a466',
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
