vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'gruvbox'

local palette = {
    background = '#1d2021',
    cursorline = '#141617',
    visual     = '#504945',
    comment    = '#665c54',
    argument   = '#bdae93',
    delimeter  = '#ebdbb2',
    foreground = '#fbf1c7',
    operator   = '#a89984',
    keyword    = '#fb4934',
    class      = '#fabd2f',
    func       = '#b8bb26',
    string     = '#8ec07c',
    number     = '#d3869b',
    error      = '#fb4934',
    warning    = '#fabd2f',
    hint       = '#83a598',
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
