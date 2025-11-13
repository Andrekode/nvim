local Remap = require("utils.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local tnoremap = Remap.tnoremap
local nmap = Remap.nmap

M = {}

nnoremap("<leader>fmt", ":RustFmt <CR>")

nnoremap("<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vnoremap("K", ":m '<-2<CR>gv=gv")
vnoremap("J", ":m '>+1<CR>gv=gv")

nnoremap("Y", "yg$")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")

-- greatest remap ever
xnoremap("<leader>p", '"_dP')

nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nmap("<leader>Y", '"+Y')

nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

inoremap("<C-c>", "<Esc>")

nnoremap("Q", "<nop>")

nnoremap("<C-j>", "<cmd>cnext<CR>zz")
nnoremap("<C-k>", "<cmd>cprev<CR>zz")
nnoremap("<leader>j", "<cmd>lnext<CR>zz")
nnoremap("<leader>k", "<cmd>lprev<CR>zz")

nnoremap("<leader>cf", function()
	vim.fn.setreg("+", vim.fn.expand("%:t"))
end, { desc = "Copy filename" })
nnoremap("<leader>cp", function()
	vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Copy relative path" })
nnoremap("<leader>cP", function()
	vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "Copy absolute path" })

function M.setup_telescope_keymaps()
	local builtin = require("telescope.builtin")

	nnoremap("<leader>ps", function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") })
	end)
	nnoremap("<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })

	nnoremap("<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
	nnoremap("<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
	nnoremap("<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
	nnoremap("<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
	nnoremap("<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
	nnoremap("<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
	nnoremap("<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
	nnoremap("<leader>gi", builtin.lsp_implementations, { desc = "go to impl" })
	nnoremap("<leader>flt", function()
		require("telescope").extensions.flutter.commands()
	end)
end

function M.setup_neogit_keymaps()
	local neogit = require("neogit")
	vim.keymap.set("n", "<leader>gs", function()
		neogit.open({ kind = "vsplit" })
	end, { silent = true, noremap = true, desc = "Neogit" })
	vim.keymap.set("n", "<leader>gp", ":Neogit pull<CR>", { silent = true, noremap = true, desc = "[g]it [p]ull" })
	vim.keymap.set("n", "<leader>gP", ":Neogit push<CR>", { silent = true, noremap = true, desc = "[g]it [P]ush" })
end

function M.setup_neotest_keymaps()
	return {
		{
			"<leader>ta",
			function()
				require("neotest").run.attach()
			end,
			desc = "Attach",
		},
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run File",
		},
		{
			"<leader>tA",
			function()
				require("neotest").run.run(vim.uv.cwd())
			end,
			desc = "Run All Test Files",
		},
		{
			"<leader>tT",
			function()
				require("neotest").run.run({ suite = true })
			end,
			desc = "Run Test Suite",
		},
		{
			"<leader>tn",
			function()
				require("neotest").run.run()
			end,
			desc = "Run Nearest",
		},
		{
			"<leader>tl",
			function()
				require("neotest").run.run_last()
			end,
			desc = "Run Last",
		},
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Toggle Summary",
		},
		{
			"<leader>to",
			function()
				require("neotest").output.open({ enter = true, auto_close = true })
			end,
			desc = "Show Output",
		},
		{
			"<leader>tO",
			function()
				require("neotest").output_panel.toggle()
			end,
			desc = "Toggle Output Panel",
		},
		{
			"<leader>tt",
			function()
				require("neotest").run.stop()
			end,
			desc = "Terminate",
		},
		{
			"<leader>td",
			function()
				vim.cmd("Neotree close")
				require("neotest").summary.close()
				require("neotest").output_panel.close()
				require("neotest").run.run({ suite = false, strategy = "dap" })
			end,
			desc = "Debug nearest test",
		},
	}
end

function M.setup_dap_keymaps()
	return {
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "toggle [d]ebug [b]reakpoint",
		},
		{
			"<leader>dB",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "[d]ebug [B]reakpoint",
		},
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			desc = "[d]ebug [c]ontinue (start here)",
		},
		{
			"<leader>dC",
			function()
				require("dap").run_to_cursor()
			end,
			desc = "[d]ebug [C]ursor",
		},
		{
			"<leader>dg",
			function()
				require("dap").goto_()
			end,
			desc = "[d]ebug [g]o to line",
		},
		{
			"<leader>do",
			function()
				require("dap").step_over()
			end,
			desc = "[d]ebug step [o]ver",
		},
		{
			"<leader>dO",
			function()
				require("dap").step_out()
			end,
			desc = "[d]ebug step [O]ut",
		},
		{
			"<leader>di",
			function()
				require("dap").step_into()
			end,
			desc = "[d]ebug [i]nto",
		},
		{
			"<leader>dj",
			function()
				require("dap").down()
			end,
			desc = "[d]ebug [j]ump down",
		},
		{
			"<leader>dk",
			function()
				require("dap").up()
			end,
			desc = "[d]ebug [k]ump up",
		},
		{
			"<leader>dl",
			function()
				require("dap").run_last()
			end,
			desc = "[d]ebug [l]ast",
		},
		{
			"<leader>dp",
			function()
				require("dap").pause()
			end,
			desc = "[d]ebug [p]ause",
		},
		{
			"<leader>dr",
			function()
				require("dap").repl.toggle()
			end,
			desc = "[d]ebug [r]epl",
		},
		{
			"<leader>dR",
			function()
				require("dap").clear_breakpoints()
			end,
			desc = "[d]ebug [R]emove breakpoints",
		},
		{
			"<leader>ds",
			function()
				require("dap").session()
			end,
			desc = "[d]ebug [s]ession",
		},
		{
			"<leader>dt",
			function()
				require("dap").terminate()
			end,
			desc = "[d]ebug [t]erminate",
		},
		{
			"<leader>dw",
			function()
				require("dap.ui.widgets").hover()
			end,
			desc = "[d]ebug [w]idgets",
		},
	}
end

function M.setup_typescript_lsp_keymaps()
	return {
		{
			"gD",
			function()
				require("vtsls").commands.goto_source_definition(0)
			end,
			desc = "Goto Source Definition",
		},
		{
			"gR",
			function()
				require("vtsls").commands.file_references(0)
			end,
			desc = "File References",
		},
		{
			"<leader>co",
			function()
				require("vtsls").commands.organize_imports(0)
			end,
			desc = "Organize Imports",
		},
		{
			"<leader>cM",
			function()
				require("vtsls").commands.add_missing_imports(0)
			end,
			desc = "Add missing imports",
		},
		{
			"<leader>cu",
			function()
				require("vtsls").commands.remove_unused_imports(0)
			end,
			desc = "Remove unused imports",
		},
		{
			"<leader>cD",
			function()
				require("vtsls").commands.fix_all(0)
			end,
			desc = "Fix all diagnostics",
		},
		{
			"<leader>cV",
			function()
				require("vtsls").commands.select_ts_version(1)
			end,
			desc = "Select TS workspace version",
		},
	}
end

function M.setup_blink_keymaps()
	return {
		["<C-y>"] = { "select_and_accept", "fallback" },
		["<c-e>"] = { "hide", "show", "fallback" },
		["<c-n>"] = { "select_next", "show", "fallback" },
		["<c-p>"] = { "select_prev", "show", "fallback" },
	}
end

function M.setup_lsp_autocmd_keymaps(event)
	local opts = { buffer = event.buf }
	vim.keymap.set("n", "gd", function()
		require("telescope.builtin").lsp_definitions()
	end, opts)
	vim.keymap.set("n", "<leader>fo", function()
		vim.lsp.buf.format()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover({ border = "rounded" })
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>cd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[e", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, opts)
	vim.keymap.set("n", "]e", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, opts)
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
	vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, opts)
	vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end

function M.setup_trouble_keymaps()
	return {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle <cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>:Neotree document_symbols<cr>",
			desc = "Symbols (Neotree)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	}
end

function M.setup_kulala_keymaps()
	return {
		{
			"<leader>rr",
			function()
				require("kulala").run()
			end,
			desc = "Send request",
		},
		{
			"<leader>rR",
			function()
				require("kulala").replay()
			end,
			desc = "reply request",
		},
	}
end

return M
