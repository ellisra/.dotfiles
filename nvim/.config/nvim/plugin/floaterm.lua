local state = {
    floating = {
        buf = -1,
        win = -1,
    },
}

local function create_floating_windeo(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.7)
    local height = opts.height or math.floor(vim.o.lines * 0.7)

    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
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
        title = " floaterm ",
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)

    return { buf = buf, win = win }
end

local toggle_terminal = function(opts)
    opts = opts or {}
    local term_command = opts.term_command or nil

    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_floating_windeo({ buf = state.floating.buf })
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

vim.api.nvim_create_user_command("Floaterm", toggle_terminal, {})

vim.keymap.set({ "n", "t" }, "<leader>tt", toggle_terminal, { desc = "[T]oggle [T]erminal" })
vim.keymap.set("n", "<leader>lg", function()
    toggle_terminal({ term_command = "lazygit" })
end, { desc = "[L]azy[G]it" })
