vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.g.colors_name = "dawnfox"

require("base16-colorscheme").setup({
    base00 = "#faf4ed", -- bg0
    base01 = "#fffbf7", -- bg1
    base02 = "#f2e9de", -- bg2
    base03 = "#9893a5", -- bg3
    base04 = "#797593", -- fg3
    base05 = "#575279", -- fg2
    base06 = "#575279", -- fg1
    base07 = "#cecacd", -- fg0
    base08 = "#b4637a", -- red
    base09 = "#bf7971", -- orange
    base0A = "#b38549", -- yellow
    base0B = "#618774", -- green
    base0C = "#56949f", -- aqua
    base0D = "#907aa9", -- blue
    base0E = "#31748f", -- purple
    base0F = "#31748f", -- bonus
})
