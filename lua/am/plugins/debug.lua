return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            'williamboman/mason.nvim',
            'jay-babu/mason-nvim-dap.nvim',
        },
        config = function()
            local dap = require("dap")
            local dap_ui = require("dapui")

            require("mason-nvim-dap").setup()

            vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
            vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
            vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
            vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
            vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
            vim.keymap.set('n', '<leader>B', function()
                dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
            end, { desc = 'Debug: Set Breakpoint' })

            dap_ui.setup({
                icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
                controls = {
                    icons = {
                        pause = '⏸',
                        play = '▶',
                        step_into = '⏎',
                        step_over = '⏭',
                        step_out = '⏮',
                        step_back = 'b',
                        run_last = '▶▶',
                        terminate = '⏹',
                        disconnect = '⏏',
                    },
                },
            })

            vim.keymap.set('n', '<F7>', dap_ui.toggle, { desc = 'Debug: See last session result.' })

            dap.listeners.after.event_initialized['dapui_config'] = dap_ui.open
            dap.listeners.before.event_terminated['dapui_config'] = dap_ui.close
            dap.listeners.before.event_exited['dapui_config'] = dap_ui.close
        end,

    }
}
