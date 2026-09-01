return {
	"mistweaverco/kulala.nvim",
	keys = require("config.keymaps").setup_kulala_keymaps(),
	ft = { "http", "rest" },
	opts = {
		ui = {
			max_response_size = 10485760,
		},
		contenttypes = {
			["sosi%+json"] = "application/json",
		},
	},
	config = function(_, opts)
		require("kulala").setup(opts)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "http", "rest" },
			callback = function(args)
				local kulala = require("kulala")
				local dir = vim.fs.dirname(vim.api.nvim_buf_get_name(args.buf))
				local found = vim.fs.find(".kulala-env", { path = dir, upward = true })[1]
				if found then
					local f = io.open(found, "r")
					if f then
						local env = (f:read("*a") or ""):gsub("%s+", "")
						f:close()
						if env ~= "" and env ~= kulala.get_selected_env() then
							kulala.set_selected_env(env)
						end
					end
				end
				vim.notify("env: " .. (kulala.get_selected_env() or "none"), vim.log.levels.INFO, { title = "kulala" })
			end,
		})
	end,
}
