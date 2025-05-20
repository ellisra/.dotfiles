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
    base09 = "#b6927b", -- orange
    base0A = "#c4b28a", -- yellow
    base0B = "#699469", -- green
    base0C = "#8ea49e", -- aqua
    base0D = "#698a9b", -- blue
    base0E = "#a292a3", -- purple
    base0F = "#7aa89f", -- bonus
})
-- background #1F1F28
-- foreground #DCD7BA
-- selection_background #363646
-- selection_foreground #9e9b93
-- url_color #938AA9
-- cursor #c4b28a
-- cursor_text_color #1F1F28
--
-- # Tabs
-- active_tab_background #1F1F28
-- active_tab_foreground #c4b28a
-- inactive_tab_background #2A2A37
-- inactive_tab_foreground #9e9b93
-- tab_bar_background #2A2A37
--
-- # normal
-- color0 #393836
-- color1 #c4746e
-- color2 #699469
-- color3 #c4b28a
-- color4 #435965
-- color5 #a292a3
-- color6 #8ea49e
-- color7 #C8C093
--
-- # bright
-- color8  #aca9a4
-- color9  #cc928e
-- color10 #72a072
-- color11 #d4c196
-- color12 #698a9b
-- color13 #b4a7b5
-- color14 #96ada7
-- color15 #d5cd9d
--
-- # extended colors
-- color16 #b6927b
-- color17 #c4746e
