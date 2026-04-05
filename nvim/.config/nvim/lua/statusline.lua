local modes = {
    ['n'] = 'NORMAL',  ['no'] = 'NORMAL',
    ['v'] = 'VISUAL',  ['V'] = 'VISUAL LINE', [''] = 'VISUAL BLOCK',
    ['s'] = 'SELECT',  ['S'] = 'SELECT LINE', [''] = 'SELECT BLOCK',
    ['i'] = 'INSERT',  ['ic'] = 'INSERT',
    ['R'] = 'REPLACE', ['Rv'] = 'VISUAL REPLACE',
    ['c'] = 'COMMAND', ['cv'] = 'VIM EX',     ['ce'] = 'EX',
    ['r'] = 'PROMPT',  ['rm'] = 'MOAR',       ['r?'] = 'CONFIRM',
    ['!'] = 'SHELL',   ['t'] = 'TERMINAL',
}

local function mode()
    local current_mode = vim.api.nvim_get_mode().mode
    return string.format(' %s ', modes[current_mode]):upper()
end

local function update_mode_colors()
    local current_mode = vim.api.nvim_get_mode().mode
    local mode_color = '%#StatuslineModeNormal#'
    if current_mode == 'n' then
        mode_color = '%#StatuslineModeNormal#'
    elseif current_mode == 'i' or current_mode == 'ic' then
        mode_color = '%#StatuslineModeInsert#'
    elseif current_mode == 'v' or current_mode == 'V' or current_mode == '' then
        mode_color = '%#StatuslineModeVisual#'
    elseif current_mode == 'R' then
        mode_color = '%#StatuslineModeReplace#'
    elseif current_mode == 'c' then
        mode_color = '%#StatuslineModeCommand#'
    elseif current_mode == 't' then
        mode_color = '%#StatuslineModeCommand#'
    end
    return mode_color
end

local function git_info()
    local summary = vim.b.minigit_summary
    if not summary then return '' end

    local branch = summary.head_name
    if not branch or branch == '' then return '  No Branch ' end
    return string.format('  %s ', branch)
end

local function filename()
    local fname = vim.fn.expand('%:t')
    local modified = ''
    if vim.bo.modified then
        modified = ' [+]'
    end

    if fname == '' then return '' end
    return fname .. modified .. ' '
end

local function diagnostics()
    local count = {}
    local levels = {
        errors = vim.diagnostic.severity.ERROR,
        warnings = vim.diagnostic.severity.WARN,
        info = vim.diagnostic.severity.INFO,
        hints = vim.diagnostic.severity.HINT,
    }

    for k, level in pairs(levels) do
        count[k] = #vim.diagnostic.get(0, { severity = level })
    end

    local errors = ''
    local warnings = ''
    local hints = ''
    local info = ''

    if count['errors'] ~= 0 then
        errors = '%#StatuslineDiagnosticError# ' .. count['errors'] .. ' '
    end
    if count['warnings'] ~= 0 then
        warnings = '%#StatuslineDiagnosticWarn# ' .. count['warnings'] .. ' '
    end
    if count['hints'] ~= 0 then
        hints = '%#StatuslineDiagnosticHint# ' .. count['hints'] .. ' '
    end
    if count['info'] ~= 0 then
        info = '%#StatuslineDiagnosticInfo# ' .. count['info'] .. ' '
    end

    return errors .. warnings .. hints .. info .. '%#Normal#'
end

local function lsp()
    local clients = vim.lsp.get_clients()
    if #clients == 0 then
        return ' No active LSP '
    end
    local names = vim.tbl_map(function (c) return c.name end, clients)

    return ' ' .. table.concat(names, ', ') .. ' '
end

local function lineinfo()
    if vim.bo.filetype == 'alpha' then
        return ''
    end
    local mode_color = update_mode_colors()

    return string.format('%s %s', mode_color, '%l:%c ')
end

local function md_info()
    if vim.bo.filetype == 'markdown' then
        return string.format(' %s words ', vim.fn.wordcount().words)
    end

    return ''
end

Statusline = {}
Statusline.active = function ()
    return table.concat({
        '%#Statusline#',
        update_mode_colors(),
        mode(),
        '%#StatuslineNC#',
        git_info(),
        '%#Normal# ',
        filename(),
        '%=',
        md_info(),
        diagnostics(),
        '%#StatuslineNC#',
        lsp(),
        lineinfo(),
    })
end

Statusline.inactive = function ()
    return ' %F'
end

local group = vim.api.nvim_create_augroup('ellisra.statusline', { clear = true })
vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
    group = group,
    callback = function ()
        if vim.api.nvim_win_get_config(0).relative ~= '' then
            vim.wo.statusline = ''
        else
            vim.wo.statusline = '%!v:lua.Statusline.active()'
        end
    end,
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
    group = group,
    callback = function ()
        vim.wo.statusline = '%!v:lua.Statusline.inactive()'
    end,
})
