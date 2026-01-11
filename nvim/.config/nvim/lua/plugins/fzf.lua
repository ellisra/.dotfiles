return {
    'ibhagwan/fzf-lua',

    lazy = false,
    dependencies = 'nvim-mini/mini.nvim',

    opts = {
        ui_select = true,
        fzf_colors = true,
        file_icon_padding = ' ',
        oldfiles = { include_current_session = true },
        defaults = { formatter = 'path.filename_first', git_icons = true },

        keymap = {
            builtin = {
                ['<C-p>'] = 'toggle-preview',
                ['<S-Down>'] = 'preview-page-down',
                ['<S-Up>'] = 'preview-page-up',
            },
        },

        winopts = {
            backdrop = 100,
            height = 0.50,
            width = 0.50,
            row = 1,
            col = 0,

            preview = {
                wrap = true,
                vertical = 'down:90%',
                hidden = true,
            },
        },

        grep = {
            rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --hidden -g "!.git" -e',

            winopts = {
                height = 0.5,
                width = 1,
                row = 1,
                col = 0,

                preview = {
                    wrap = true,
                    horizontal = 'right:70%',
                    hidden = false,
                },
            },
        },
    },

    init = function()
        local FzfLua = require('fzf-lua')
        local keymap = vim.keymap.set

        keymap('n', '<leader>sf', function()
            FzfLua.files()
        end, { desc = '[S]earch [F]iles' })

        keymap('n', '<leader>so', function()
            FzfLua.oldfiles()
        end, { desc = '[S]earch [O]ldfiles' })

        keymap('n', '<leader>sn', function()
            FzfLua.files({ cwd = vim.fn.stdpath('config') })
        end, { desc = '[S]earch [N]eovim config' })

        keymap('n', '<leader><leader>', function()
            FzfLua.resume()
        end, { desc = '[ ] Resume previous search' })

        keymap('n', '<leader>sj', function()
            FzfLua.jumps({
                winopts = {
                    width = 1,
                    preview = {
                        hidden = false,
                        layout = 'horizontal',
                        horizontal = 'right:60%',
                    }
                }
            })
        end, { desc = '[S]earch [J]umps' })

        keymap('n', '<leader>sb', function()
            FzfLua.buffers()
        end, { desc = '[S]earch [B]uffers' })

        keymap('n', '<leader>sg', function()
            FzfLua.live_grep()
        end, { desc = '[S]earch [G]rep' })

        keymap('n', '<leader>sd', function()
            FzfLua.diagnostics_document({
                winopts = {
                    width = 1,
                    height = 0.2,
                },
            })
        end, { desc = '[S]earch [D]iagnostics' })

        keymap('n', '<leader>sr', function()
            FzfLua.lsp_references({
                winopts = {
                    width = 1,
                    height = 0.2,
                    preview = {
                        hidden = false,
                        layout = 'horizontal',
                        horizontal = 'right:60%',
                    },
                }
            })
        end, { desc = '[S]earch [R]eferences' })

        keymap('n', '<leader>si', function()
            FzfLua.lsp_implementations({
                winopts = {
                    width = 1,
                    height = 0.2,
                    preview = {
                        hidden = false,
                        layout = 'horizontal',
                        horizontal = 'right:60%',
                    },
                }
            })
        end, { desc = '[S]earch [I]mplementations' })

        keymap('n', '<leader>sD', function()
            FzfLua.diagnostics_workspace({
                winopts = {
                    width = 1,
                    height = 0.2,
                },
            })
        end, { desc = '[S]earch [D]iagnostics (workspace)' })

        keymap('n', '<leader>ca', function()
            FzfLua.lsp_code_actions({
                winopts = {
                    width = 1,
                    preview = {
                        hidden = false,
                        layout = 'horizontal',
                        horizontal = 'right:70%'
                    }
                }
            })
        end, { desc = '[C]ode [A]ctions' })

        keymap('n', 'gd', function()
            FzfLua.lsp_definitions({ jump1 = true })
        end, { desc = '[G]o to [D]efinition' })

        keymap('n', '<leader>sm', function()
            FzfLua.helptags({
                winopts = {
                    width = 1,
                    preview = {
                        hidden = false,
                        layout = 'horizontal',
                        horizontal = 'right:60%',
                    },
                },
            })
        end, { desc = '[S]earch [M]anual' })

        keymap('n', '<leader>sk', function()
            FzfLua.keymaps({
                winopts = {
                    width = 1,
                    height = 0.4,
                    preview = {
                        layout = 'vertical',
                        vertical = 'down:40%',
                    },
                },
            })
        end, { desc = '[S]earch [K]eymaps' })

        keymap('n', '<leader>sc', function()
            FzfLua.colorschemes({
                winopts = { height = 0.2, width = 0.2 },
            })
        end, { desc = '[S]earch [C]olorschemes' })

        keymap('n', '<leader>sh', function()
            FzfLua.highlights({ fzf_colors = true })
        end, { desc = '[S]earch [H]ighlights' })

        keymap('n', '<leader>sp', function()
            FzfLua.spell_suggest({ winopts = { width = 0.1, height = 0.2 } })
        end, { desc = '[S][p]elling suggestions' })

        keymap('n', '<leader>cp', function()
            FzfLua.complete_path()
        end, { desc = '[C]omplete [P]ath' })
    end,
}
