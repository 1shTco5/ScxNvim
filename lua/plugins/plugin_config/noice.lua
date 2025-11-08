return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        require("noice").setup({
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
                hover = {
                    enabled = false, -- 禁用Noice对hover的处理，避免影响lspsaga
                },
                signature = {
                    enabled = false, -- 禁用Noice对signature help的处理
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = false,        -- use a classic bottom cmdline for search
                command_palette = true,       -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false,       -- add a border to hover docs and signature help
            },
            cmdline = {
                view = "cmdline_popup",
            },
            views = {
                cmdline_popup = {
                    position = {
                        row = "90%", -- 垂直位置，90%接近底部
                        col = "50%", -- 水平居中
                    },
                    size = {
                        width = "60%",
                        height = "auto",
                    },
                },
            },
            messages = {
                enabled = true,
                view = "notify", -- 默认消息视图
                view_error = "notify", -- 错误视图
                view_warn = "mini", -- 禁用警告的 Noice UI，使用原生显示
            },
        })
    end
}
