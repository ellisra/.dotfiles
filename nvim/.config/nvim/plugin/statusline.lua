local M = {}

local modes = {
    ["n"] = "NORMAL",
    ["no"] = "NORMAL",
    ["v"] = "VISUAL",
    ["V"] = "VISUAL LINE",
    [""] = "VISUAL BLOCK",
    ["s"] = "SELECT",
    ["S"] = "SELECT LINE",
    [""] = "SELECT BLOCK",
    ["i"] = "INSERT",
    ["ic"] = "INSERT",
    ["R"] = "REPLACE",
    ["Rv"] = "VISUAL REPLACE",
    ["c"] = "COMMAND",
    ["cv"] = "VIM EX",
    ["ce"] = "EX",
    ["r"] = "PROMPT",
    ["rm"] = "MOAR",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    ["t"] = "TERMINAL",
}

local function mode()
    local current_mode = vim.api.nvim_get_mode().mode
    return string.format(" %s ", modes[current_mode]):upper()
end

local function update_mode_colors()
    local current_mode = vim.api.nvim_get_mode().mode
    local mode_color = "%#StatusLineAccent#"
    if current_mode == "n" then
        mode_color = "%#StatuslineAccent#"
    elseif current_mode == "i" or current_mode == "ic" then
        mode_color = "%#StatuslineInsertAccent#"
    elseif
        current_mode == "v"
        or current_mode == "V"
        or current_mode == ""
    then
        mode_color = "%#StatuslineVisualAccent#"
    elseif current_mode == "R" then
        mode_color = "%#StatuslineReplaceAccent#"
    elseif current_mode == "c" then
        mode_color = "%#StatuslineCmdLineAccent#"
    elseif current_mode == "t" then
        mode_color = "%#StatuslineTerminalAccent#"
    end
    return mode_color
end

local function git_info()
    local git_branch =
        vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
    if vim.v.shell_error ~= 0 then
        return nil
    end

    if git_branch ~= "" then
        return string.format("  %s ", git_branch)
    else
        return "  No Branch "
    end
end

local function filename()
    local fname = vim.fn.expand("%:t")
    if fname == "" then
        return ""
    end
    return fname .. " "
end

local function lsp()
    local count = {}
    local levels = {
        errors = "Error",
        warnings = "Warn",
        info = "Info",
        hints = "Hint",
    }

    for k, level in pairs(levels) do
        ---@diagnostic disable-next-line: assign-type-mismatch
        count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
    end

    local errors = ""
    local warnings = ""
    local hints = ""
    local info = ""

    if count["errors"] ~= 0 then
        errors = " %#LspDiagnosticsSignError# " .. count["errors"]
    end
    if count["warnings"] ~= 0 then
        warnings = " %#LspDiagnosticsSignWarning# " .. count["warnings"]
    end
    if count["hints"] ~= 0 then
        hints = " %#LspDiagnosticsSignHint# " .. count["hints"]
    end
    if count["info"] ~= 0 then
        info = " %#LspDiagnosticsSignInformation# " .. count["info"]
    end

    return errors .. warnings .. hints .. info .. "%#Normal#"
end

local function filetype()
    return string.format("%s %s ", "%#Statusline#", vim.bo.filetype)
end

local function lineinfo()
    if vim.bo.filetype == "alpha" then
        return ""
    end
    local mode_color = update_mode_colors()
    return string.format("%s %s", mode_color, "%l:%c ")
end

function M.setup()
    Statusline = {}

    Statusline.active = function()
        return table.concat({
            "%#Statusline#",
            update_mode_colors(),
            mode(),
            "%#Statusline#",
            git_info(),
            "%#Normal# ",
            filename(),
            "%#Normal#",
            "%=%#StatusLineExtra#",
            lsp(),
            filetype(),
            lineinfo(),
        })
    end

    function Statusline.inactive()
        return " %F"
    end

    function Statusline.short()
        return "%#StatusLineNC#"
    end

    vim.api.nvim_exec2(
        [[
            augroup Statusline
            au!
            au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
            au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
            au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
            augroup END
        ]],
        { output = false }
    )
end

return M.setup()
