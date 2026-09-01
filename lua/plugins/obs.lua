-- Extra vaults beyond the personal one, as a colon-separated list of
-- "name=path" entries (the "name=" part is optional and defaults to the
-- directory name), e.g. NVIM_OBSIDIAN_VAULTS="foo-memory=$HOME/foo/memory".
local function extra_workspaces()
	local workspaces = {}
	for entry in vim.gsplit(vim.env.NVIM_OBSIDIAN_VAULTS or "", ":", { trimempty = true }) do
		local name, path = entry:match("^([^=]+)=(.*)$")
		path = vim.fn.expand(path or entry):gsub("/+$", "")
		table.insert(workspaces, { name = name or vim.fs.basename(path), path = path })
	end
	return workspaces
end

return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = vim.list_extend({
			{
				name = "work",
				path = vim.fn.expand("$HOME/Documents/vault_work/"),
			},
		}, extra_workspaces()),
		mappings = {
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			-- Toggle check-boxes.
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
			["gd"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},
	},
}
