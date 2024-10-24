-- Define color palette for usage in render-markdown.nvim
local M = {}

-- Foreground Palette
M.red_fg = "#E67E80"
M.orange_fg = "#E69875"
M.yellow_fg = "#DBBC7F"
M.green_fg = "#A4C080"
M.blue_fg = "#7FBBB3"
M.aqua_fg = "#83C092"
M.purple_fg = "#D699B6"
M.text_fg = "#D3C6AA"

-- Background Palette
M.red_bg = "#4C3743"
M.orange_bg = "#493B40"
M.yellow_bg = "#45443C"
M.green_bg = "#3C4841"
M.blue_bg = "#384B55"
M.aqua_bg = "#3C4842"
M.purple_bg = "#463C48"

function M.setup_highlight()
    -- Assign Heading colours
    vim.cmd(string.format([[highlight Heading1Bg guifg=%s guibg=%s]], M.red_fg, M.red_bg))
    vim.cmd(string.format([[highlight Heading2Bg guifg=%s guibg=%s]], M.orange_fg, M.orange_bg))
    vim.cmd(string.format([[highlight Heading3Bg guifg=%s guibg=%s]], M.yellow_fg, M.yellow_bg))
    vim.cmd(string.format([[highlight Heading4Bg guifg=%s guibg=%s]], M.green_fg, M.green_bg))
    vim.cmd(string.format([[highlight Heading5Bg guifg=%s guibg=%s]], M.blue_fg, M.blue_bg))
    vim.cmd(string.format([[highlight Heading6Bg guifg=%s guibg=%s]], M.purple_fg, M.purple_bg))

    -- Assign Bullet colours
    vim.cmd(string.format([[highlight Bullet guifg=%s]], M.blue_fg))
end

return M
