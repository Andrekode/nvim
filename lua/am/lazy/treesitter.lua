return {
    { 
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "typescript", "lua", "typescript", "rust" },
                sync_install = false,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = false,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selections = "<c-space>",
                        node_incremental = "<c-space>",
                        scope_incremental = "<c-s>",
                        node_decremental = "<c-backspace>",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["aa"] = "@parameter.outer",
                            ["ai"] = "@parameter.inner",
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                },
                move = {
                    enable = true,
                    set_jump = true,
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                    },
                },
            })
                    end
    },

}
