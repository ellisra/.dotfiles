local utils = require('utils')

return {
    require('mini.diff').setup({ view = { style = 'number' } }),

    vim.keymap.set('n', '<leader>tg', function()
        require('mini.diff').toggle_overlay()
    end, { desc = '[T]oggle [G]it diff' }),

    -- FIXME: These highlights aren't applying properly anymore
    vim.api.nvim_create_autocmd('ColorScheme', {
        desc = 'Apply better mini.diff overlay colours',
        group = vim.api.nvim_create_augroup('ellisra.mini_diff_overlay', { clear = true }),
        pattern = '*',
        callback = function()
            vim.api.nvim_set_hl(0, 'MiniDiffOverAdd', {
                bg = utils.tint_colour({
                    hex_colour = string.format(
                        '#%06X',
                        vim.api.nvim_get_hl(0, { name = 'Normal' }).bg
                    ),
                    r_tint = -10,
                    g_tint = 10,
                    b_tint = -10
                }),
            })

            vim.api.nvim_set_hl(0, 'MiniDiffOverChange', { link = 'visual' })

            vim.api.nvim_set_hl(0, 'MiniDiffOverDelete', {
                bg = utils.tint_colour({
                    hex_colour = string.format(
                        '#%06X',
                        vim.api.nvim_get_hl(0, { name = 'Normal' }).bg
                    ),
                    r_tint = 20,
                    g_tint = -10,
                    b_tint = -10
                 }),
            })

            vim.api.nvim_set_hl(0, 'MiniDiffOverContext', {
                bg = utils.tint_colour({
                    hex_colour = string.format(
                        '#%06X',
                        vim.api.nvim_get_hl(0, { name = 'Normal' }).bg
                    ),
                    r_tint = 20,
                    g_tint = -10,
                    b_tint = -10
                }),
            })
        end,
    }),
}
