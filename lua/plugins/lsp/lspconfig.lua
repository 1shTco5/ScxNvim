return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- { "Hoffs/omnisharp-extended-lsp.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true
        })
        -- vim.lsp.config("lua_ls", require("plugins.lsp.lsp_config.lua_ls"))
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("clangd")
        vim.lsp.enable("pyright")
    end
}
