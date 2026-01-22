return {
    require("plugins.color_scheme.catppuccin"),
    require("plugins.plugin_config.mini_file"),
    require("plugins.plugin_config.mini_cursorword"),
    require("plugins.plugin_config.lualine"),
    require("plugins.plugin_config.autopairs"),
    require("plugins.plugin_config.bufferline"),
    require("plugins.plugin_config.indent_blankline"),
    --require("plugins.plugin_config.noice"),
    require("plugins.plugin_config.render_markdown"),
    require("plugins.plugin_config.toggleterm"),
    require("plugins.plugin_config.which_key"),
    require("plugins.plugin_config.treesitter"),
    require("plugins.plugin_config.sentiment"),
    -- require("plugins.plugin_config.copilot"),
    require("plugins.plugin_config.codecompanion"),
    require("plugins.plugin_config.flash"),
    require("plugins.plugin_config.telescope"),
    require("plugins.plugin_config.unity_sync"),

----------Lsp----------
    require("plugins.lsp.mason"),
    require("plugins.lsp.lspconfig"),
    require("plugins.lsp.blink"),
    require("plugins.lsp.lspsaga"),
    require("plugins.lsp.formatter"),
    require("plugins.lsp.roslyn"),

----------Dap----------
    require("plugins.dap.dap")
}
