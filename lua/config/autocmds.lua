local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup("HighlightYank", {})
local am_group = augroup("lspgroup", {})


autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = am_group,
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", function()
            require("telescope.builtin").lsp_definitions()
        end, opts)
        vim.keymap.set("n", "<leader>fo", function()
            vim.lsp.buf.format()
        end, opts)
        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set("n", "<leader>vws", function()
            vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set("n", "<leader>cd", function()
            vim.diagnostic.open_float()
        end, opts)
        vim.keymap.set("n", "[e", function()
            vim.diagnostic.goto_next({ severity = "ERROR" })
        end, opts)
        vim.keymap.set("n", "]e", function()
            vim.diagnostic.goto_prev({ severity = "ERROR" })
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
    end,
})
