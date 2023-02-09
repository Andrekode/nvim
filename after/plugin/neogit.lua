local neogit = require("neogit")
local nnoremap = require("am.keymap").nnoremap

neogit.setup({})

nnoremap("<leader>gs", function()
	neogit.open({
		kind = "split_above",
	})
end)

nnoremap("<leader>ga", "<cmd>!git fetch --all<CR>")
