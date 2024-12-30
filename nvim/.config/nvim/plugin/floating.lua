local M = {}

local state = {
    floating = {
        buf = -1,
        win = -1,
    },
}

local function create_floating_window(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.7)
    local height = opts.height or math.floor(vim.o.lines * 0.7)
    local title = opts.title or " "

    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    local buf = nil
    if opts.buf and vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",
        border = "rounded",
        title = title,
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)

    -- vim.wo[win].winhighlight = "NormalFloat:Normal"
    -- vim.wo[win].signcolumn = "yes:1"

    return { buf = buf, win = win }
end

local function create_temp_buffer()
    local filetype = vim.bo.filetype

    state.floating = create_floating_window({ title = " scratch buffer " })
    vim.bo[state.floating.buf].bufhidden = "wipe"
    vim.bo[state.floating.buf].buftype = "nofile"
    vim.bo[state.floating.buf].filetype = filetype

    ---@diagnostic disable-next-line: deprecated
    local clients = vim.lsp.get_active_clients()
    for _, client in ipairs(clients) do
        ---@type table { filetypes: string[] }|nil
        local config = client.config
        if config and config.filetypes and vim.tbl_contains(config.filetypes, filetype) then
            vim.lsp.buf_attach_client(state.floating.buf, client.id)
        end
    end

    vim.api.nvim_set_current_buf(state.floating.buf)
end

local function execute_buffer()
    local filetype = vim.bo.filetype
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local content = table.concat(lines, "\n")

    local tmpfile = vim.fn.tempname() .. "." .. filetype

    local f = io.open(tmpfile, "w")
    if f ~= nil then
        f:write(content)
        f:close()
    end

    local cmd = {
        python = "python3 " .. tmpfile,
        lua = "lua " .. tmpfile,
        sh = "bash " .. tmpfile,
    }

    if cmd[filetype] then
        vim.cmd("! " .. cmd[filetype])
    else
        print("No execution command defined for filetype: " .. filetype)
    end

    os.remove(tmpfile)
end

local toggle_terminal = function(opts)
    opts = opts or {}
    local term_command = opts.term_command or nil

    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_floating_window({ buf = state.floating.buf, title = " floaterm " })
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end

        if term_command then
            vim.defer_fn(function()
                vim.fn.chansend(vim.b.terminal_job_id, term_command .. "\n")
            end, 100)
        end

        vim.defer_fn(function()
            vim.cmd.startinsert()
        end, 30)
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end

function M.setup()
    vim.api.nvim_create_user_command("ScratchPad", create_temp_buffer, {})
    vim.api.nvim_create_user_command("RunPad", execute_buffer, {})
    vim.api.nvim_create_user_command("Floaterm", toggle_terminal, {})

    vim.api.nvim_set_keymap(
        "n",
        "<leader>tp",
        "<cmd>ScratchPad<CR>",
        { noremap = true, silent = true, desc = "[S]cratch [P]ad" }
    )
    vim.api.nvim_set_keymap("n", "<leader>rp", "<cmd>RunPad<CR>", {
        noremap = true,
        silent = true,
        desc = "[R]un Scratch [P]ad",
    })
    vim.api.nvim_set_keymap(
        "n",
        "<leader>tt",
        "<cmd>Floaterm<CR>",
        { desc = "[T]oggle [T]erminal" }
    )
    vim.keymap.set("n", "<leader>lg", function()
        toggle_terminal({ term_command = "lazygit" })
    end, { desc = "[L]azy[G]it" })
end

return M.setup()
