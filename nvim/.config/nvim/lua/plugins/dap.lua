return {
    'mfussenegger/nvim-dap',

    ft = 'python',
    dependencies = {
        'igorlfs/nvim-dap-view',
        'theHamsta/nvim-dap-virtual-text',
        'mfussenegger/nvim-dap-python',
    },

    config = function()
        local dap = require('dap')

        require('dap-view').setup({
            auto_toggle = true,
            winbar = { default_section = 'scopes' },
            windows = { terminal = { position = 'right' } },
        })

        require('nvim-dap-virtual-text').setup()
        require('dap-python').setup('uv')

        vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
        vim.keymap.set('n', '<F10>', dap.continue)
        vim.keymap.set('n', '<F9>', dap.step_over)
        vim.keymap.set('n', '<F8>', dap.step_into)
        vim.keymap.set('n', '<F7>', dap.step_out)
        vim.keymap.set('n', '<F6>', dap.restart)
    end,
}
