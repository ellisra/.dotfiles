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

        require('nvim-dap-virtual-text').setup({ virt_text_pos = 'eol' })
        require('dap-python').setup('uv')

        table.insert(dap.configurations.python, {
            type = 'python',
            request = 'launch',
            name = 'django:runserver',
            program = '${workspaceFolder}/manage.py',
            args = { 'runserver', '--noreload' },
            django = true,
            console = 'integratedTerminal',
            justMyCode = true,
        })

        table.insert(dap.configurations.python, {
            type = 'python',
            request = 'launch',
            name = 'django:command',
            program = '${workspaceFolder}/manage.py',
            args = function()
                local input = vim.fn.input('Management command: ')
                local args = {}
                for arg in input:gmatch('%S+') do
                    table.insert(args, arg)
                end
                return args
            end,
            django = true,
            console = 'integratedTerminal',
            justMyCode = true,
        })

        vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = '[B]reakpoint' })
        vim.keymap.set('n', '<F10>', dap.continue)
        vim.keymap.set('n', '<F9>', dap.step_over)
        vim.keymap.set('n', '<F8>', dap.step_into)
        vim.keymap.set('n', '<F7>', dap.step_out)
        vim.keymap.set('n', '<F6>', dap.restart)
        vim.keymap.set('n', '<leader>dk', function()
            dap.terminate({ all = true })
        end, { desc = 'Kill debug processes' })
    end,
}
