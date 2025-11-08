return {
    "saghen/blink.cmp",
    event = { "BufReadPost", "BufNewFile" },
    version = "1.*",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "xzbdmw/colorful-menu.nvim",
    },
    opts = {
        completion = {
            documentation = {
                auto_show = false,
            },
            menu = {
                draw = {
                    columns = { { "kind_icon" }, { "label", gap = 1 } },
                    components = {
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").
                                blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").
                                blink_components_highlight(ctx)
                            end,
                        }
                    }
                }
            },
            accept = { auto_brackets = { enabled = false }, },
        },
        keymap = {
            preset = "super-tab",
        },
        sources = {
            default = { "path", "snippets", "buffer", "lsp" }
        },
        signature = {
            enabled = true,
        },
        cmdline = {
            keymap = {
                preset = "super-tab",
            },
            completion = {
                menu = {
                    auto_show = true,
                },
            },
        },
    },
}
