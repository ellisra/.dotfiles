vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.g.colors_name = "kanagawa-grey"

require("base16-colorscheme").setup({
    base00 = "#181616", -- bg0
    base01 = "#0d0c0c", -- bg1
    base02 = "#282727", -- bg2
    base03 = "#54546d", -- bg3
    base04 = "#727169", -- fg3
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
--     base00 = "#1f1f28",
--     base01 = "#16161d",
--     base02 = "#223249",
--     base03 = "#54546d",
--     base04 = "#727169",
--     base05 = "#dcd7ba",
--     base06 = "#c8c093",
--     base07 = "#717c7c",
--     base08 = "#c34043",
--     base09 = "#ffa066",
--     base0A = "#c0a36e",
--     base0B = "#76946a",
--     base0C = "#6a9589",
--     base0D = "#7e9cd8",
--     base0E = "#957fb8",
--     base0F = "#d27e99",
-- }
--
-- return {
--     base00 = "#0d0c0c",
--     base01 = "#1d1c19",
--     base02 = "#282727",
--     base03 = "#737c73",
--     base04 = "#a6a69c",
--     base05 = "#c5c9c5",
--     base06 = "#7a8382",
--     base07 = "#c5c9c5",
--     base08 = "#c4746e",
--     base09 = "#b98d7b",
--     base0A = "#c4b28a",
--     base0B = "#87a987",
--     base0C = "#8ea4a2",
--     base0D = "#8ba4b0",
--     base0E = "#8992a7",
--     base0F = "#a292a3",
-- }
