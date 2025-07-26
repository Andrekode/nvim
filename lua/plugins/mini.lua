return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.indentscope").setup()
			require("mini.comment").setup()
			require("mini.cursorword").setup()
		end,
	},
}
