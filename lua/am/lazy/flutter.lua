return {
    "akinsho/flutter-tools.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()

        require("flutter-tools").setup()

        require('flutter-tools').setup_project({
          {
            name = 'Development', -- an arbitrary name that you provide so you can recognise this config
            flavor = 'Alpha', -- your flavour
            target = 'lib/main-alpha.dart', -- your target
            dart_define = {
              IS_DEV = true,
            },
          },
          {
            name = 'Development rel', -- an arbitrary name that you provide so you can recognise this config
            flavor = 'Alpha', -- your flavour
            target = 'lib/main-alpha.dart', -- your target
            dart_define = {
              IS_DEV = true,
            },
            flutter_mode = 'release',
          },
          {
            name = 'Standard main', -- an arbitrary name that you provide so you can recognise this config
            target = 'lib/main.dart', -- your target
            dart_define = {
              IS_DEV = true,
            },
          },
        })
    end
}
