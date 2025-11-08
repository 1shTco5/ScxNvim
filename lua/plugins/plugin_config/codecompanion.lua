return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        opts = {
            log_level = "TRACE",
        },
        display = {
            chat = {
                auto_scroll = true,
            },
        },
    },
    keys = {
        { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Code Companion Chat", silent = true },
    },

    config = function(_, opts)
        require("codecompanion").setup(opts)
    end,
}
