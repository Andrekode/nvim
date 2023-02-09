local Remap = require("am.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap

nnoremap("[e", "<Cmd>Lspsaga diagnostic_jump_next<CR>")
nnoremap("]e", "<Cmd>Lspsaga diagnostic_jump_prev<CR>")
nnoremap("K", "<Cmd>Lspsaga hover_doc<CR>")
nnoremap("<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- code action
nnoremap("<leader>ca", "<Cmd>Lspsaga code_action<CR>")
vnoremap("<leader>ca", "<cmd>Lspsaga range_code_action<CR>")

nnoremap("gd", "<Cmd>Lspsaga lsp_finder<CR>")
nnoremap("gp", "<Cmd>Lspsaga peek_definition<CR>")
inoremap("<C-k>", "<Cmd>Lspsaga signature_help<CR>")

-- rename
nnoremap("<leader>rn", "<Cmd>Lspsaga rename<CR>")
