vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.g.colors_name = "kanagawa-paper"

require("mini.base16").setup({
    palette = {
        base00 = "#1f1f28", -- bg0
        base01 = "#181820", -- bg1
        base02 = "#54546d", -- bg2
        base03 = "#a6a69c", -- bg3
        base04 = "#a6a69c", -- fg3
        base05 = "#dcd7ba", -- fg2
        base06 = "#dcd7ba", -- fg1
        base07 = "#dcd7ba", -- fg0
        base08 = "#c4746e", -- red
        base09 = "#b98d7b", -- orange
        base0A = "#8ea49e", -- yellow
        base0B = "#699469", -- green
        base0C = "#8a9a7b", -- aqua
        base0D = "#c4b28a", -- blue
        base0E = "#a292a3", -- purple
        base0F = "#ffffff", -- bonus
    },
})
