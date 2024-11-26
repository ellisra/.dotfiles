local function set_options(opts)
    for k, v in pairs(opts) do
        vim.opt[k] = v
    end
end

set_options({
    -- Line numbers
    number = true,
    relativenumber = true,

    -- Sets how whitespace charactes are displayed
    list = true,
    listchars = { tab = "  ", trail = "·", nbsp = "␣" },

    -- Set default tab size
    expandtab = true,
    shiftwidth = 4,
    softtabstop = 4,
    tabstop = 4,

    -- General
    breakindent = true, -- Makes wrapped lines wrap to the same indent level
    cursorline = true, -- Highlight cursor line
    ignorecase = true, -- Ignore case sensitivity in search
    linebreak = true, -- Wrap lines on spaces rather than characters
    mouse = "a", -- Allows mouse mode
    scrolloff = 10, -- Minimum number of lines above or below the cursor
    showmode = false, -- Display mode visual since I'm using a bar
    signcolumn = "yes", -- Make sign column on by default
    smartcase = true, -- Ignore case sensitivity in search
    spelllang = "en_gb", -- Sets spelling language to british english
    splitbelow = true, -- Default horizontal split direction
    splitright = true, -- Default vertical split direction
    timeoutlen = 300, -- Decrease mapped sequence wait time
    undofile = true, -- Save undo history
    updatetime = 250, -- Decreases update time
})

-- Sync clipboard with OS, within Wayland sessions wl-clipboard must be installed
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

-- Set tab size work around
vim.cmd([[set expandtab tabstop=4 softtabstop=4 shiftwidth=4]])
