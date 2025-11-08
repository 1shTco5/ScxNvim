return {
    ----- Color Scheme-----
    require("plugins.color_scheme.everforest"),
    -----Mini-----
    require("plugins.plugin_config.mini_file"),
    require("plugins.plugin_config.mini_cursorword"),
    -----LuaLine-----
    require("plugins.plugin_config.lualine"),
    -----AutoPairs-----
    require("plugins.plugin_config.autopairs"),
    -----BufferLine-----
    require("plugins.plugin_config.bufferline"),
    -----Indent-BlankLine-----
    require("plugins.plugin_config.indent_blankline"),
    -----Noice-----
    require("plugins.plugin_config.noice"),
    -----Render MarkDown-----
    require("plugins.plugin_config.render_markdown"),
    -----ToggleTerm-----
    require("plugins.plugin_config.toggleterm"),
    -----Which-Key-----
    require("plugins.plugin_config.which_key"),
    -----Treesitter-----
    require("plugins.plugin_config.treesitter"),
    -----Sentiment-----
    require("plugins.plugin_config.sentiment"),
    -----Copilot-----
    -- require("plugins.plugin_config.copilot"),
    -----CodeCompanion-----
    require("plugins.plugin_config.codecompanion"),
    -----Flash-----
    require("plugins.plugin_config.flash"),
    -----Telescope-----
    require("plugins.plugin_config.telescope"),

----------Lsp----------

    -----Mason-----
    require("plugins.lsp.mason"),
    -----LspConfig-----
    require("plugins.lsp.lspconfig"),
    -----Blink-----
    require("plugins.lsp.blink"),
    -----LspSaga-----
    require("plugins.lsp.lspsaga"),
    -----Formatter-----
    require("plugins.lsp.formatter"),

----------Dap----------
    require("plugins.dap.dap")
}
