return {

    {
        "NeogitOrg/neogit",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",

            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("neogit").setup({})
            require("config.keymaps").setup_neogit_keymaps()
        end,
    },
}
