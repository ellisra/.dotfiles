vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.g.colors_name = "kanagawa-dragon"

require("base16-colorscheme").setup({
    base00 = "#181616", -- bg0
    base01 = "#0d0c0c", -- bg1
    base02 = "#a6a69c", -- bg2
    base03 = "#a6a69c", -- bg3
    base04 = "#a6a69c", -- fg3
    base05 = "#c5c9c5", -- fg2
    base06 = "#938aa9", -- fg1
    base07 = "#c5c9c5", -- fg0
    base08 = "#c4746e", -- red
    base09 = "#e46876", -- orange
    base0A = "#c4b28a", -- yellow
    base0B = "#8a9a7b", -- green
    base0C = "#8ea4a2", -- aqua
    base0D = "#8ba4b0", -- blue
    base0E = "#a292a3", -- purple
    base0F = "#7aa89f", -- bonus
})
