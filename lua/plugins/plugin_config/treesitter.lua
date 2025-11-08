return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    main = "nvim-treesitter.configs",
    branch = 'master',
    opts = {
        ensure_installed = {
            "lua",
            "python",
            "c_sharp",
            "markdown",
            "markdown_inline"
        },
        highlight = { enable = true },
        fold = { enable = true },
        indent = { enable = true },
    },
}
