-- Monorepo subdirectory holding the Flutter app, e.g. NVIM_FLUTTER_PROJECT_DIR=my_app.
-- Unset means the app lives at the repo root.
local project_dir = vim.env.NVIM_FLUTTER_PROJECT_DIR

return {
	"nvim-flutter/flutter-tools.nvim",
	build = "git apply --3way ~/.config/nvim/patches/flutter-tools.nvim.patch", -- PR #512: snacks picker (remove once merged)
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	ft = "dart",
	keys = {
		{ "<leader>flt", function() require("flutter-tools.menu").commands_snack() end, desc = "Flutter commands" },
	},
	config = function()
		require("flutter-tools").setup({
			debugger = {
				enabled = false,
				run_via_dap = true,
				register_configurations = function(_)
					require("dap").adapters.flutter = {
						type = "executable",
						command = "flutter",
						args = { "debug_adapter" },
					}
					require("dap").configurations.dart = {
						{
							type = "flutter",
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
				device = "769352FC-9B05-412E-9013-2AD4D4AC290E",
				dart_define = {
					IS_DEV = true,
				},
				cwd = project_dir,
			},
			{
				name = "Alpha Auto",
				flavor = "Alpha",
				target = "lib/main-alpha.dart",
				dart_define = {
					IS_DEV = true,
				},
				cwd = project_dir,
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
