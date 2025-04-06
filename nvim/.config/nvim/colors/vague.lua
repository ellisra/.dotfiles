vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.g.colors_name = "vague"

require("base16-colorscheme").setup({
    base00 = "#141415", -- bg0
    base01 = "#313336", -- bg1
    base02 = "#4a4c4f", -- bg2
    base03 = "#606079", -- bg3
    base04 = "#a2a1b3", -- fg3
    base05 = "#b9b8cc", -- fg2
    base06 = "#cecce0", -- fg1
    base07 = "#cdcdcd", -- fg0
    base08 = "#6e94b2", -- red
    base09 = "#e0a363", -- orange
    base0A = "#e6be8c", -- yellow
    base0B = "#c48282", -- green
    base0C = "#b4d4cf", -- aqua
    base0D = "#bb9dbd", -- blue
    base0E = "#f3be7c", -- purple
    base0F = "#405065", -- bonus
})
