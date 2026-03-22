vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'alabaster'

local palette = {
    background = '#0e1415',
    cursorline = '#182325',
    visual     = '#293334',
    dimmed     = '#696969',
    comment    = '#dfdf8e',
    argument   = '#ADADAD',
    foreground = '#cecece',
    operator   = '#F0BD89',
    keyword    = '#e0e0e0',
    class      = '#95a99f',
    func       = '#71ade7',
    string     = '#95cb82',
    number     = '#95cb82',
    error      = '#d13e23',
    warning    = '#f4b371',
    hint       = '#8ebeec',
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
