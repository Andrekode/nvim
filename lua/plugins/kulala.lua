return {
    "mistweaverco/kulala.nvim",
    keys = require("config.keymaps").setup_kulala_keymaps(),
    ft = {"http", "rest"},
    opts = { global_keymaps = false,
      global_keymaps_prefix = "<leader>R",
      kulala_keymaps_prefix = "",
    },
}
