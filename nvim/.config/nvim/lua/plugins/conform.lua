local range_ignore_filetypes = { "lua" }
local diff_format = function()
    local data = require("mini.diff").get_buf_data()
    if not data or not data.hunks then
        vim.notify("No hunks in this buffer")
        return
    end

    local format = require("conform").format
    if vim.tbl_contains(range_ignore_filetypes, vim.bo.filetype) then
        format({ lsp_fallback = true, timeout_ms = 500 })
        return
    end

    local ranges = {}
    for _, hunk in pairs(data.hunks) do
        if hunk.type ~= "delete" then
            table.insert(ranges, 1, {
                start = { hunk.buf_start, 0 },
                ["end"] = { hunk.buf_start + hunk.buf_count, 0 },
            })
        end
    end
    for _, range in pairs(ranges) do
        format({ lsp_fallback = true, timeout_ms = 500, range = range })
    end
end

local default_format_options = {
    lsp_fallback = true,
    timeout = 500,
}

return {
    "stevearc/conform.nvim",

    enabled = true,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {},

    -- init = function()
    --     vim.g.format_modifications_only = true
    --
    --     vim.api.nvim_create_user_command("FormatDisable", function(args)
    --         if args.bang then
    --             vim.b.disable_autoformat = true
    --         else
    --             vim.g.disable_autoformat = true
    --         end
    --         vim.notify("Format on save disabled")
    --     end, {
    --         desc = "Disable format on save",
    --         bang = true,
    --     })
    --
    --     vim.api.nvim_create_user_command("FormatEnable", function()
    --         vim.b.disable_autoformat = false
    --         vim.g.disable_autoformat = false
    --         vim.notify("Format on save enabled")
    --     end, { desc = "Enable format on save" })
    --
    --     vim.keymap.set(
    --         { "n", "v" },
    --         "<leader>f",
    --         ":lua require('conform').format()<CR>",
    --         { desc = "[F]ormat selection" }
    --     )
    -- end,

    opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
            -- if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            --     return
            -- end
            -- if vim.g.format_modifications_only then
            --     -- Prefer to format Git hunks over entire file
            --     diff_format()
            -- else
                -- Format entire file
                return default_format_options
            -- end
        end,
        formatters_by_ft = {
            lua = { "stylua" },
            -- python = {
            --     "ruff_fix",
            --     "ruff_format",
            --     "ruff_organize_imports",
            -- },
            go = { "goimports", "gofmt" },
        },
    },
}
