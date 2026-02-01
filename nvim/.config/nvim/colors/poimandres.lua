vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'poimandres'

local palette = {
    background = '#1C1C21',
    cursorline = '#16161A',
    visual     = '#30303D',
    comment    = '#506477',
    argument   = '#E4F0FB',
    delimeter  = '#E4F0FB',
    foreground = '#E4F0FB',
    operator   = '#ADD7FF',
    keyword    = '#91B4D5',
    class      = '#A6ACCD',
    func       = '#5DE4C7',
    string     = '#5FB3A1',
    number     = '#D0679D',
    error      = '#D0679D',
    warning    = '#FFFAC2',
    hint       = '#89DDFF',
}

-- yellow      = '#FFFAC2',
-- teal1       = '#5DE4C7',
-- teal2       = '#5FB3A1',
-- teal3       = '#42675A',
-- blue1       = '#89DDFF',
-- blue2       = '#ADD7FF',
-- blue3       = '#91B4D5',
-- blue4       = '#7390AA',
-- pink1       = '#FAE4FC',
-- pink2       = '#FCC5E9',
-- pink3       = '#D0679D',
-- blueGray1   = '#A6ACCD',
-- blueGray2   = '#767C9D',
-- blueGray3   = '#506477',
-- background1 = '#303340',
-- background2 = '#1B1E28',
-- background3 = '#171922',
-- text        = '#E4F0FB',
-- white       = '#FFFFFF',
-- none        = 'NONE',

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
