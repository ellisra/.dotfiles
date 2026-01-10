vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'dawnfox'

local palette = {
    background = '#faf4ed',
    cursorline = '#fffbf7',
    visual     = '#f2e9de',
    comment    = '#9893a5',
    argument   = '#7b74ab',
    delimeter  = '#575279',
    foreground = '#575279',
    operator   = '#797593',
    keyword    = '#31748f',
    class      = '#b38549',
    func       = '#618774',
    string     = '#56949f',
    number     = '#907aa9',
    error      = '#b4637a',
    warning    = '#b38549',
    hint       = '#31748f',
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
