return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "BufRead",
    opts = {},
    keys = {
        { "<S-h>",      ":BufferLineCyclePrev<CR>", silent = true },
        { "<S-l>",      ":BufferLineCycleNext<CR>", silent = true },
        { "<leader>bd", ":bdelete<CR>",             silent = true },
    },
}
