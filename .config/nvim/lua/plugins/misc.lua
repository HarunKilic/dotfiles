return {
    -- Comment with haste
    {
        "numToStr/Comment.nvim",
        opts = {}
    },
    -- Auto pairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}
    },
    -- Mini Move   
    {
        "echasnovski/mini.move",
        config = function()
            require("mini.move").setup()
        end
    },
    -- Better buffer closing
    {
        "kazhala/close-buffers.nvim",
        opts = {
            preserve_window_layout = {"this", "nameless"}
        }
    },
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically,
    "tpope/vim-surround", -- Surround stuff with the ys-, cs-, ds- commands
}
