return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- 'jonarrien/telescope-cmdline.nvim',
        },
        keys = {
            -- { ':', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' }
        },
        opts = {
            extensions = {
                cmdline = {
                },
            },
        },
        config = function()
            require("telescope").load_extension("flutter")
            require("config.keymaps").setup_telescope_keymaps()
            -- require("telescope").load_extension('cmdline')
        end

    },
}
