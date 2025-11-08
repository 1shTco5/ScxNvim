return {
    "williamboman/mason.nvim",
    event = { "BufReadPost", "BufNewFile", "VimEnter" },
    opts = {},
    config = function ()
        require("mason").setup({
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            },
        })
    end
}
