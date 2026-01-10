vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'everforest'

local palette = {
    background = '#1e2326',
    cursorline = '#272e33',
    visual     = '#2e383c',
    comment    = '#7a8478',
    argument   = '#9da9a0',
    delimeter  = '#d3c6aa',
    foreground = '#d3c6aa',
    operator   = '#859289',
    keyword    = '#e67e80',
    class      = '#dbbc7f',
    func       = '#a7c080',
    string     = '#83c092',
    number     = '#d699b6',
    error      = '#e67e80',
    warning    = '#e69875',
    hint       = '#7bbbb3',
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
