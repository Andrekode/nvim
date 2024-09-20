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
    -- NOTE: see Telescope git_... commands set by setup_telescope_keymaps
end

return M
