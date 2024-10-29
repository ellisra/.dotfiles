-- Define color palette for usage in render-markdown.nvim
local M = {}

-- Foreground Palette
--M.red_fg = "#ea83a5"
--M.orange_fg = "#e29eca"
--M.yellow_fg = "#e6b99d"
--M.green_fg = "#85b5ba"
--M.blue_fg = "#90b99f"
--M.aqua_fg = "#83C092"
--M.purple_fg = "#aca1cf"
--M.text_fg = "#c9c7cd"
--

M.red_fg = "#ffffff00"
M.orange_fg = "#ffffff00"
M.yellow_fg = "#ffffff00"
M.green_fg = "#ffffff00"
M.blue_fg = "#ffffff00"
M.aqua_fg = "#ffffff00"
M.purple_fg = "#ffffff00"
M.text_fg = "#ffffff00"

-- Background Palette
M.red_bg = "#ffffff00"
M.orange_bg = "#ffffff00"
M.yellow_bg = "#ffffff00"
M.green_bg = "#ffffff00"
M.blue_bg = "#ffffff00"
M.aqua_bg = "#ffffff00"
M.purple_bg = "#ffffff00"

function M.setup_highlight()
    -- Assign Heading colours
    vim.cmd(string.format([[highlight Heading1Bg guifg=%s guibg=%s]], M.red_fg, M.red_bg))
    vim.cmd(string.format([[highlight Heading2Bg guifg=%s guibg=%s]], M.orange_fg, M.orange_bg))
    vim.cmd(string.format([[highlight Heading3Bg guifg=%s guibg=%s]], M.yellow_fg, M.yellow_bg))
    vim.cmd(string.format([[highlight Heading4Bg guifg=%s guibg=%s]], M.green_fg, M.green_bg))
    vim.cmd(string.format([[highlight Heading5Bg guifg=%s guibg=%s]], M.blue_fg, M.blue_bg))
    vim.cmd(string.format([[highlight Heading6Bg guifg=%s guibg=%s]], M.purple_fg, M.purple_bg))

    -- Assign Bullet colours
    vim.cmd(string.format([[highlight BlueFg guifg=%s]], M.blue_fg))
end

return M
