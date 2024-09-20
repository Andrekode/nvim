return {
    {
        -- "ellisonleao/gruvbox.nvim",
        "blazkowolf/gruber-darker.nvim",
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("gruvbox")
            vim.cmd.colorscheme("gruber-darker")
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end
    },
    -- {
    --     "folke/tokyonight.nvim",
    --     priority = 1000,
    --     config = function()
    --         return {
    --             style = "moon",
    --         }
    --     end,
    -- }

}
