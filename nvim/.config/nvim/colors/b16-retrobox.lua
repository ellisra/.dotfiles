vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.g.colors_name = "base16-retrobox"

require("base16-colorscheme").setup({
    base00 = "#1c1c1c", -- bg0
    base01 = "#282828", -- bg1
    base02 = "#504945", -- bg2
    base03 = "#7c6f64", -- bg3
    base04 = "#bdae93", -- fg3
    base05 = "#d5c4a1", -- fg2
    base06 = "#ebdbb2", -- fg1
    base07 = "#fbf1c7", -- fg0
    base08 = "#f2594b", -- red
    base09 = "#fe8019", -- orange
    base0A = "#fabd2f", -- yellow
    base0B = "#b8bb26", -- green
    base0C = "#8ec07c", -- aqua
    base0D = "#83a598", -- blue
    base0E = "#d3869b", -- purple
    base0F = "#928374", -- bonus
})
