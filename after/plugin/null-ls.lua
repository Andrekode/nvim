--[[ local M = {}

local null_ls = require("null-ls")

M.sources = {
	null_ls.builtins.formatting.prettierd,
	null_ls.builtins.formatting.trim_whitespace.with({
		filetypes = { "plantuml" },
	}),
}

M.config = {
	on_attach = require("lsp.utils").base_config.on_attach,
	sources = M.sources,
}

function M.setup()
	null_ls.setup(M.config)
end

return M ]]
