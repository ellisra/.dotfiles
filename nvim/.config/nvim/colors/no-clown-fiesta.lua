vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'no-clown-fiesta'

local palette = {
    background = '#151515',
    cursorline = '#202020',
    visual     = '#373737',
    comment    = '#727272',
    argument   = '#E1E1E1',
    delimeter  = '#E1E1E1',
    foreground = '#E1E1E1',
    operator   = '#E1E1E1',
    keyword    = '#7E97AB',
    class      = '#BAD7FF',
    func       = '#88afa2',
    string     = '#A2B5C1',
    number     = '#b46958',
    error      = '#984936',
    warning    = '#ab8550',
    hint       = '#576f82',
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
