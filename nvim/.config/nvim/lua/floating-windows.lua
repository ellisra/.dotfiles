local M = {}

local state = {
    terminal = {
        buf = -1,
        win = -1,
    },
    scratch = {
        buf = -1,
        win = -1,
    },
}

local function create_floating_window(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.7)
    local height = opts.height or math.floor(vim.o.lines * 0.7)
    local title = opts.title or ' '

    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    local buf = nil
    if opts.buf and vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    local win_config = {
        relative = 'editor',
        width = width,
        height = height,
        col = col,
        row = row,
        style = 'minimal',
        border = 'rounded',
        title = title,
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)

    return { buf = buf, win = win }
end

local function attach_lsp_to_buffer(filetype)
    local clients = vim.lsp.get_clients()
    for _, client in ipairs(clients) do
        ---@type table { filetypes: string[] } | nil
        local config = client.config
        if config
            and config.filetypes
            and vim.tbl_contains(config.filetypes, filetype)
        then
            vim.lsp.buf_attach_client(state.scratch.buf, client.id)
        end
    end
end

local function toggle_temp_buffer()
    local filetype = vim.bo.filetype

    if not vim.api.nvim_win_is_valid(state.scratch.win) then
        state.scratch = create_floating_window({
            buf = state.scratch.buf,
            title = ' scratch buffer ',
        })
        vim.bo[state.scratch.buf].bufhidden = 'hide'
        vim.bo[state.scratch.buf].buftype = 'nofile'
        vim.bo[state.scratch.buf].filetype = filetype

        if not vim.tbl_contains({ 'markdown' }, filetype) then
            attach_lsp_to_buffer(filetype)
        end

        vim.api.nvim_set_current_buf(state.scratch.buf)
    else
        vim.api.nvim_win_hide(state.scratch.win)
    end
end

local function execute_buffer()
    local filetype = vim.bo.filetype
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local content = table.concat(lines, '\n')

    local tmpfile = vim.fn.tempname() .. '.' .. filetype

    local f = io.open(tmpfile, 'w')
    if f then
        f:write(content)
        f:close()
    end

    local cmd = {
        python = 'python3 ' .. tmpfile,
        lua = 'lua ' .. tmpfile,
        sh = 'bash ' .. tmpfile,
    }

    if cmd[filetype] then
        vim.cmd('! ' .. cmd[filetype])
    else
        print('No execution command defined for filetype: ' .. filetype)
    end

    os.remove(tmpfile)
end

local toggle_terminal = function(opts)
    opts = opts or {}
    local title = opts.title or nil
    local width = opts.width or nil
    local height = opts.height or nil
    local term_command = opts.term_command or nil

    if not vim.api.nvim_win_is_valid(state.terminal.win) then
        state.terminal = create_floating_window({
            buf = state.terminal.buf,
            title = title,
            width = width,
            height = height,
        })
        if vim.bo[state.terminal.buf].buftype ~= 'terminal' then
            vim.cmd.terminal()
        end

        if term_command then
            vim.defer_fn(function()
                vim.fn.chansend(vim.b.terminal_job_id, term_command .. '\n')
            end, 100)
        end

        -- vim.defer_fn(function()
        --     vim.cmd.startinsert()
        -- end, 30)
    else
        vim.api.nvim_win_hide(state.terminal.win)
    end
end

function M.setup()
    vim.api.nvim_create_user_command('ScratchPad', toggle_temp_buffer, {})
    vim.api.nvim_create_user_command('RunPad', execute_buffer, {})
    vim.api.nvim_create_user_command('Floaterm', toggle_terminal, {})

    vim.api.nvim_set_keymap('n', '<leader>tp', '<cmd>ScratchPad<CR>', {
        noremap = true,
        silent = true,
        desc = '[S]cratch [P]ad',
    })

    vim.api.nvim_set_keymap('n', '<leader>rp', '<cmd>RunPad<CR>', {
        noremap = true,
        silent = true,
        desc = '[R]un Scratch [P]ad',
    })

    vim.keymap.set('n', '<leader>tt', function()
        toggle_terminal({ title = ' floaterm ' })
    end, { desc = '[T]oggle [T]erminal' })

    vim.keymap.set('n', '<leader>lg', function()
        toggle_terminal({
            title = ' lazygit ',
            width = math.floor(vim.o.columns * 0.8),
            height = math.floor(vim.o.lines * 0.85),
            term_command = 'lazygit',
        })
    end, { desc = '[L]azy[G]it' })
end

return M.setup()
