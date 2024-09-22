return {
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
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
        keys = require("config.keymaps").setup_dap_keymaps(),

    }
}
