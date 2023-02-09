require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "tokyonight",
		component_separators = "|",
		section_separators = "",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff" },
		lualine_c = { { "filename", file_status = true, path = 2 }, { "diagnostics", sources = { "nvim_diagnostic" } } },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
