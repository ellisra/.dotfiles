vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.g.colors_name = "evergarden"

require("base16-colorscheme").setup({
    base00 = "#1c2225", -- bg0
    base01 = "#232a2e", -- bg1
    base02 = "#393f43", -- bg2
    base03 = "#4f5558", -- bg3
    base04 = "#9b9b91", -- fg3
    base05 = "#b1b2a6", -- fg2
    base06 = "#c7c8ba", -- fg1
    base07 = "#dddecf", -- fg0
    base08 = "#e67e80", -- red
    base09 = "#dba17f", -- orange
    base0A = "#dbbc7f", -- yellow
    base0B = "#b2c98f", -- green
    base0C = "#93c9a1", -- aqua
    base0D = "#9bb5cf", -- blue
    base0E = "#e3a8d1", -- purple
    base0F = "#94aaa0", -- bonus
})
