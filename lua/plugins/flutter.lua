return {
	"nvim-flutter/flutter-tools.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup({
			debugger = {
				enabled = false,
				run_via_dap = true,
				register_configurations = function(_)
					require("dap").adapters.dart = {
						type = "executable",
						command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
						args = { "flutter" },
					}
					require("dap").configurations.dart = {
						{
							type = "dart",
							request = "launch",
							name = "Alpha debug",
							dartSdkPath = vim.fn.expand("$HOME/development/flutter/bin/cache/dart-sdk/"),
							flutterSdkPath = vim.fn.expand("$HOME/development/flutter/"),
							program = "${workspaceFolder}/lib/main-alpha.dart",
							cwd = "${workspaceFolder}",
						},
					}
				end,
			},
		})

		require("flutter-tools").setup_project({
			{
				name = "Alpha Android",
				flavor = "Alpha",
				target = "lib/main-alpha.dart",
				device = "emulator-5554",
				dart_define = {
					IS_DEV = true,
				},
			},
			{
				name = "Alpha Iphone",
				flavor = "Alpha",
				target = "lib/main-alpha.dart",
				device = "719770D5-1CF9-41AC-ACDC-A01B6D479E10",
				dart_define = {
					IS_DEV = true,
				},
			},
			{
				name = "Alpha current",
				flavor = "Alpha",
				target = "lib/main-alpha.dart",
				dart_define = {
					IS_DEV = true,
				},
			},
			{
				name = "Alpha release",
				flavor = "Alpha",
				target = "lib/main-alpha.dart",
				dart_define = {
					IS_DEV = true,
				},
				flutter_mode = "release",
			},
			{
				name = "Standard main",
				target = "lib/main.dart",
				dart_define = {
					IS_DEV = true,
				},
			},
		})
	end,
}
