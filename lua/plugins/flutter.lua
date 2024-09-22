return {
    "akinsho/flutter-tools.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
        require("flutter-tools").setup({
            debugger = {
                enabled = true,
                run_via_dap = true,
                register_configurations = function(_)
                    require("dap").adapters.dart = {
                        type = "executable",
                        command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
                        args = { "flutter" }
                    }
                    require("dap").configurations.dart = {
                        {
                            type = "dart",
                            request = "launch",
                            name = "Alpha debug",
                            dartSdkPath = vim.fn.expand('$HOME/development/flutter/bin/cache/dart-sdk/'),
                            flutterSdkPath = vim.fn.expand('$HOME/development/flutter/'),
                            program = "${workspaceFolder}/lib/main-alpha.dart",
                            cwd = "${workspaceFolder}",
                        }
                    }
                end,
            }
        })


        require('flutter-tools').setup_project({
            {
                name = 'Alpha',                 -- an arbitrary name that you provide so you can recognise this config
                flavor = 'Alpha',               -- your flavour
                target = 'lib/main-alpha.dart', -- your target
                dart_define = {
                    IS_DEV = true,
                },
            },
            {
                name = 'Alpha release',         -- an arbitrary name that you provide so you can recognise this config
                flavor = 'Alpha',               -- your flavour
                target = 'lib/main-alpha.dart', -- your target
                dart_define = {
                    IS_DEV = true,
                },
                flutter_mode = 'release',
            },
            {
                name = 'Standard main',   -- an arbitrary name that you provide so you can recognise this config
                target = 'lib/main.dart', -- your target
                dart_define = {
                    IS_DEV = true,
                },
            },
        })
    end
}
