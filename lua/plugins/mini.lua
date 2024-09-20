return {
    {
        "echasnovski/mini.nvim",
        config = function()
            require('mini.indentscope').setup()
            require('mini.surround').setup()
            require('mini.pairs').setup()
            require('mini.comment').setup()
        end
    }
}
