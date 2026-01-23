vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'orbital'

local palette = {
    background = '#0d1017',
    cursorline = '#000000',
    visual     = '#25282e',
    comment    = '#56585d',
    argument   = '#babab8',
    delimeter  = '#e0e3e8',
    foreground = '#e0e3e8',
    operator   = '#9aa5cd',
    keyword    = '#c7693e',
    class      = '#88bab9',
    func       = '#7aaafa',
    string     = '#f4e9bb',
    number     = '#f4e9bb',
    error      = '#d55a38',
    warning    = '#E5A27A',
    hint       = '#88bab9',
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
