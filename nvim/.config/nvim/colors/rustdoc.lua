vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'rustdoc'

local palette = {
    background = '#1d1f21',
    cursorline = '#2A2A2A',
    visual     = '#505050',
    comment    = '#8d8d8b',
    argument   = '#b0b0b0',
    delimeter  = '#c5c8c6',
    foreground = '#c5c8c6',
    operator   = '#769acb',
    keyword    = '#b294bb',
    type       = '#dc935f',
    func       = '#86bdb7',
    string     = '#b4b964',
    number     = '#b4b964',
    error      = '#ee6868',
    warning    = '#fdbf35',
    hint       = '#769acb',
}

-- local bg = "#2A2A2A"
-- local fg = "#dddddd"
-- local fg_muted = "#b0b0b0"
-- local bg_alt = "#353535"
-- local bg_visual = "#505050"
-- local bg_search = "#7a7a20"
-- local bg_search_current = "#9e9e2a"
-- local border = "#999999"
-- local comment = "#8d8d8b"
-- local doc_comment = "#8ca375"
--
-- -- Syntax colors
-- local keyword = "#ab8ac1"
-- local keyword2 = "#769acb"
-- local lifetime = "#d97f26"
-- local number = "#83a300"
-- local string = "#83a300"
-- local literal = "#ee6868"
-- local attribute = "#ee6868"
-- local self_kw = "#ee6868"
-- local macro = "#3e999f"
-- local question = "#ff9011"
--
-- -- Semantic colors
-- local type_color = "#2dbfb8"
-- local func = "#2bab63"
-- local link = "#d2991d"
-- local sidebar_link = "#fdbf35"
--
-- -- UI colors
-- local error = "#ff5555"
-- local warning = "#ff8e00"
-- local info = "#769acb"
-- local hint = "#83a300"
--
-- -- Diff colors
-- local diff_add_bg = "#314559"
-- local diff_change_bg = "#494a3d"
-- local diff_delete_bg = "#59313e"

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
        base0A = palette.type,
        base0B = palette.func,
        base0C = palette.string,
        base0D = palette.hint,
        base0E = palette.number,
        base0F = palette.error,
    },
})
