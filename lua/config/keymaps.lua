local Remap = require("utils.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
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

nnoremap("<C-k>", "<cmd>cnext<CR>zz")
nnoremap("<C-j>", "<cmd>cprev<CR>zz")
nnoremap("<leader>k", "<cmd>lnext<CR>zz")
nnoremap("<leader>j", "<cmd>lprev<CR>zz")



function M.setup_telescope_keymaps()
    local builtin = require('telescope.builtin')

    nnoremap('<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    nnoremap('<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })

    nnoremap('<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    nnoremap('<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
    nnoremap('<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    nnoremap('<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    nnoremap('<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    nnoremap('<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    nnoremap('<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    nnoremap("<leader>flt", function() require("telescope").extensions.flutter.commands() end)
end

function M.setup_neogit_keymaps()
    local neogit = require("neogit")
    vim.keymap.set("n", "<leader>gs", function()
        neogit.open({ kind = "split" })
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

return M
