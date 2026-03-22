vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'modus'

local palette = {
    background = '#000000',
    cursorline = '#282828',
    visual     = '#7030af',
    dimmed     = '#989898',
    comment    = '#989898',
    argument   = '#ffffff',
    foreground = '#ffffff',
    operator   = '#feacd0',
    keyword    = '#b6a0ff',
    class      = '#00d3d0',
    func       = '#79a8ff',
    string     = '#6ae4b9',
    number     = '#6ae4b9',
    error      = '#ff7f9f',
    warning    = '#dfaf7a',
    hint       = '#00bcff',
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
