return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "diff", "regex", "markdown_inline", "lua", "vim", "vimdoc", "kotlin" },
			sync_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
		-- config = function()
		--     local treesitter = require("nvim-treesitter")
		--
		--     treesitter.setup({
		--         ensure_installed = { "diff", "regex", "markdown_inline", "lua", "vim", "vimdoc", "http" },
		--         sync_install = true,
		--         highlight = { enable = true },
		--         indent = { enable = true },
		--     })
		-- end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "VeryLazy",

		dependencies = { "nvim-treesitter/nvim-treesitter", lazy = true },
		opts = {
			multiline_threshold = 2,
		},
	},
}
