return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-web-devicons",
    },
    event = "VeryLazy",
    opts = {
        options = {
            theme = "auto",
        },
        -- extensions = { "nvim-tree" },
        sections = {
            lualine_b = {
                --"lsp_status",
                "diagnostics"
            },
            lualine_x = {
                "filesize",
                "encoding",
                "filetype",
            },
        },
    },
}
