return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    event = "VeryLazy",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.csharpier.with({
                    filetypes = { "cs" }
                }),
                null_ls.builtins.formatting.clang_format.with({
                    extra_args = {
                        "--style={BasedOnStyle: LLVM, IndentWidth: 4}",
                    },
                    filetypes = { "c", "cpp" }, -- 仅对 C# 文件应用
                }),
            }
        })
    end,
    keys = {
        { "<leader>F", vim.lsp.buf.format, },
    }
}
