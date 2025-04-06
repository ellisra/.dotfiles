vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.g.colors_name = "miasma"

require("base16-colorscheme").setup({
    base00 = "#1c1c1c", -- bg0
    base01 = "#171717", -- bg1
    base02 = "#78824b", -- bg2
    base03 = "#666666", -- bg3
    base04 = "#43492a", -- fg3
    base05 = "#d7c483", -- fg2
    base06 = "#d7c483", -- fg1
    base07 = "#c2c2b0", -- fg0
    base08 = "#5f875f", -- red
    base09 = "#78834b", -- orange
    base0A = "#836d43", -- yellow
    base0B = "#78834b", -- green
    base0C = "#c9a554", -- aqua
    base0D = "#68824b", -- blue
    base0E = "#bb7744", -- purple
    base0F = "#5f875f", -- bonus
})
