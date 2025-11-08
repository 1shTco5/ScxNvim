return {
    "neanias/everforest-nvim",
    version = false,
    config = function()
        require("everforest").setup({
            background = "medium",
        })
        vim.cmd("colorscheme everforest")
    end,
}
