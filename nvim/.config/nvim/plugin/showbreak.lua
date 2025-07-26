local M = {}

local function get_num_wraps()
    local winid = vim.api.nvim_get_current_win()
    local winwidth = vim.api.nvim_win_get_width(winid)
    local numberwidth = vim.wo.number and vim.wo.numberwidth or 0
    local signwidth = vim.fn.exists("*sign_define") == 1
            and vim.fn.sign_getdefined()
            and 2
        or 0
    local foldcolumn = vim.wo.foldcolumn
    local foldwidth = tonumber(foldcolumn) or 0

    local bufferwidth = winwidth - numberwidth - signwidth - foldwidth

    local line = vim.fn.getline(vim.v.lnum)
    local line_length = vim.fn.strdisplaywidth(line)

    return math.floor(line_length / bufferwidth)
end

function CheckSymbolOrNumber(current)
    if vim.v.virtnum < 0 then
        return "-"
    end

    if vim.v.virtnum > 0 and (vim.wo.number or vim.wo.relativenumber) then
        local num_wraps = get_num_wraps()
        if vim.v.virtnum == num_wraps then
            return "└"
        else
            return "├"
        end
    end

    return current
end

function M.setup()
    vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
        pattern = "term://*",
        callback = function()
            vim.opt_local.statuscolumn = ""
            vim.opt_local.number = false
            vim.opt_local.relativenumber = false
        end,
    })

    vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
        callback = function()
            if vim.bo.filetype == "terminal" or vim.bo.filetype == "" then
                vim.opt_local.statuscolumn = ""
            else
                vim.opt.statuscolumn = "%s%C%=%#CursorLineNr#%{(v:relnum == 0)?v:lua.CheckSymbolOrNumber(v:lnum).\""
                    .. "  "
                    .. "\":\"\"}"
                    .. "%#LineNr#%{(v:relnum != 0)?v:lua.CheckSymbolOrNumber(v:relnum).\""
                    .. " "
                    .. "\":\"\"}"
            end
        end,
    })
end

-- return M.setup()
