return {
    "apyra/nvim-unity-sync",
    dependencies = {
        "nvim-tree/nvim-tree.lua",
        "nvim-tree/nvim-web-devicons",
    },
    -- lazy = "VeryLazy",
    config = function()
        require("unity.plugin").setup({
            unity_path = "D:/Unity/Editor/2022.3.62f1c1/Editor/Unity.exe",
            unity_cs_template = true
        })
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                local status_output = vim.fn.execute("Ustatus")
                if status_output:find("LSP") then
                    vim.cmd("Usync")
                end
            end,
        })
    end,
    ft = "cs",
    keys = {
        { "<leader>us", ":Usync<CR>", silent = true }
    }
}
