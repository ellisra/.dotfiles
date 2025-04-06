vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.g.colors_name = "dark-earth"

require("base16-colorscheme").setup({
    base00 = "#2c2826", -- bg0
    base01 = "#35302D", -- bg1
    base02 = "#4D4642", -- bg2
    base03 = "#705e51", -- bg3
    base04 = "#d9baa5", -- fg3
    base05 = "#e6c4ae", -- fg2
    base06 = "#f2cfb8", -- fg1
    base07 = "#ffdac2", -- fg0
    base08 = "#98755d", -- red
    base09 = "#b3896d", -- orange
    base0A = "#cc9c7c", -- yellow
    base0B = "#e6b08c", -- green
    base0C = "#fecb52", -- aqua
    base0D = "#e6bba1", -- blue
    base0E = "#e6c2ac", -- purple
    base0F = "#fecb52", -- bonus
})
