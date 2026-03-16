return {
	"mistweaverco/kulala.nvim",
	keys = require("config.keymaps").setup_kulala_keymaps(),
	ft = { "http", "rest" },
	opts = {
		ui = {
			max_response_size = 42768,
		},
		contenttypes = {
			["sosi%+json"] = "application/json",
		},
	},
}
