return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "vimdoc", "typescript", "lua", "typescript", "rust" },
                sync_install = false,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = false,
                },
            })
        end
    },

}
