vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.g.colors_name = "oh-lucy"

require("base16-colorscheme").setup({
    base00 = "#1e1d23", -- bg0
    base01 = "#1a191e", -- bg1
    base02 = "#413E41", -- bg2
    base03 = "#686069", -- bg3
    base04 = "#7F737D", -- fg3
    base05 = "#cccccc", -- fg2
    base06 = "#ded7d0", -- fg1
    base07 = "#938884", -- fg0
    base08 = "#ff7da3", -- red
    base09 = "#e08280", -- orange
    base0A = "#efd472", -- yellow
    base0B = "#7ec49d", -- green
    base0C = "#6caec0", -- aqua
    base0D = "#8bb8d0", -- blue
    base0E = "#b898dd", -- purple
    base0F = "#8CD881", -- bonus
})
