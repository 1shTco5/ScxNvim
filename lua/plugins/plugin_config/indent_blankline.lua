return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    opts = {
        -- indent = { char = "│" },
        scope = { enabled = true },
    },
    -- require("ibl").setup()
    config = function()
        require("ibl").setup(opts)
    end
}
