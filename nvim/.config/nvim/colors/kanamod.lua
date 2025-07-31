vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.g.colors_name = "kanamod"

require("base16-colorscheme").setup({
    base00 = "#1d2021", -- bg0
    base01 = "#141617", -- bg1
    base02 = "#504945", -- bg2
    base03 = "#5a524c", -- bg3
    base04 = "#bdae93", -- fg3
    base05 = "#dcd7ba", -- fg2
    base06 = "#c8c093", -- fg1
    base07 = "#717c7c", -- fg0
    base08 = "#c34043", -- red
    base09 = "#ffa066", -- orange
    base0A = "#c0a36e", -- yellow
    base0B = "#76946a", -- green
    base0C = "#6a9589", -- aqua
    base0D = "#7e9cd8", -- blue
    base0E = "#957fb8", -- purple
    base0F = "#d27e99", -- bonus
})
-- return {
--     base00 = '#202020', base01 = '#2a2827', base02 = '#504945', base03 = '#5a524c',
--     base04 = '#bdae93', base05 = '#ddc7a1', base06 = '#ebdbb2', base07 = '#fbf1c7',
--     base08 = '#ea6962', base09 = '#e78a4e', base0A = '#d8a657', base0B = '#a9b665',
--     base0C = '#89b482', base0D = '#7daea3', base0E = '#d3869b', base0F = '#bd6f3e'
-- }
