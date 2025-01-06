return {

	{
		"rest-nvim/rest.nvim",
		enabled = true,
		dependencies = {
			{
				"vhyrro/luarocks.nvim",
				priority = 1000,
				config = true,
				opts = {
					rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua", hererocks = true },
				},
			},
			"nvim-lua/plenary.nvim",
		},
		ft = { "http" },
		config = function()
			vim.g.rest_nvim = {
				-- Open request results in a horizontal split
				result_split_horizontal = true,
				-- Keep the http file buffer above|left when split horizontal|vertical
				result_split_in_place = false,
				-- Skip SSL verification, useful for unknown certificates
				skip_ssl_verification = false,
				-- Encode URL before making request
				encode_url = true,
				-- Highlight request on run
				highlight = {
					enabled = true,
					timeout = 150,
				},
				result = {
					-- toggle showing URL, HTTP info, headers at top the of result window
					show_url = true,
					-- show the generated curl command in case you want to launch
					-- the same request via the terminal (can be verbose)
					show_curl_command = false,
					show_http_info = true,
					show_headers = true,
					formatters = {
						json = "jq",
						html = function(body)
							return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
						end,
					},
				},
				-- Jump to request line on run
				jump_to_request = false,
				env_file = ".env",
				custom_dynamic_variables = {},
				yank_dry_run = true,
			}

			require("config.keymaps").setup_rest_keymaps()
		end,
	},
}
