vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'hybrid'

local palette = {
    background = '#161718',
    cursorline = '#1e1f22',
    visual     = '#2a2e33',
    comment    = '#474a52',
    argument   = '#b7bcb9',
    delimeter  = '#b7bcb9',
    foreground = '#b7bcb9',
    operator   = '#757F8A',
    keyword    = '#6d90b0',
    class      = '#b3be5a',
    func       = '#b3be5a',
    string     = '#7fbeb3',
    number     = '#7fbeb3',
    error      = '#b74d50',
    warning    = '#e3b55e',
    hint       = '#7fbeb3',
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
