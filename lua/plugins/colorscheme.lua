return {
	{
		-- "ellisonleao/gruvbox.nvim",
		"blazkowolf/gruber-darker.nvim",
		--
		-- "EdenEast/nightfox.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruber-darker")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			return {
				style = "moon",
			}
		end,
	},

	{
		"EdenEast/nightfox.nvim",
	},
}
