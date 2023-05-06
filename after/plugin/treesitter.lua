require("nvim-treesitter.configs").setup({
	ensure_installed = { "typescript", "lua", "typescript", "rust" },
	sync_install = false,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selections = "<c-space>",
			node_incremental = "<c-space>",
			scope_incremental = "<c-s>",
			node_decremental = "<c-backspace>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["aa"] = "@parameter.outer",
				["ai"] = "@parameter.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
	move = {
		enable = true,
		set_jump = true,
		goto_next_start = {
			["]m"] = "@function.outer",
		},
		goto_next_end = {
			["]M"] = "@function.outer",
		},
	},
	rainbow = {
		enable = true,
		colors = {
			{
				"#B48EAD",
				"#A3BE8C",
				"#EBCB8B",
				"#D08770",
				"#BF616A",
				"#abb2c0",
			},
		},
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})
