return {
  dir = "~/privat/dev/projects/conflict-ink.nvim",
  event = "BufReadPost",
  opts = {
    suppress_lsp_diagnostics = true,
  },
  keys = {
    { "<leader>cr", "<cmd>ConflictInkResolve<cr>", desc = "Smart resolve conflicts" },
  },
}
