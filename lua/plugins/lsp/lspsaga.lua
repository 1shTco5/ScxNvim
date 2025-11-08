return {
    "nvimdev/lspsaga.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    cmd          = "Lspsaga",
    opts         = {
        finder = {
            keys = {
                toggle_or_open = "<CR>",
            }
        },
    },
    keys         = {
        { "<leader>lr", ":Lspsaga rename<CR>",               silent = true },
        { "<leader>lc", ":Lspsaga code_action<CR>",          silent = true },
        { "gd",         ":Lspsaga goto_definition<CR>",      silent = true },
        { "<leader>lR", ":Lspsaga finder<CR>",               silent = true },
        { "<leader>lh", ":Lspsaga hover_doc<CR>",            silent = true },
        { "<leader>lf", ":Lspsaga finder<CR>",               silent = true },
        { "<leader>ln", ":Lspsaga diagnostic_jump_next<CR>", silent = true },
        { "<leader>lp", ":Lspsaga diagnostic_jump_prev<CR>", silent = true },
    }
}
