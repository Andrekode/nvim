local Remap = require("am.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>gs", vim.cmd.Git)

local am_fugitive = vim.api.nvim_create_augroup("am_fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
	group = am_fugitive,
	pattern = "*",
	callback = function()
		if vim.bo.ft ~= "fugitive" then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()
		local opts = { buffer = bufnr, remap = false }
		nnoremap("<leader>p", function()
			vim.cmd.Git("push")
		end, opts)

		vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
	end,
})
