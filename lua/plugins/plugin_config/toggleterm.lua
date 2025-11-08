return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true,
    lazy = false,
    opts = {
        open_mapping = [[<c-\>]],
        start_in_insert = true,
        direction = 'float',
        shade_terminals = true,
        shading_factor = 2,
        float_opts = {
            border = "curved",
            winblend = 0,
            highlights = {
                border = "Normal",
                background = "Normal",
            }
        }
    }
}
