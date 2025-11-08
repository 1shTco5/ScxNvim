return {
    'nvim-mini/mini.files',
    version = '*',
    lazy = false,
    config = function()
        require("mini.files").setup({
            mappings = {
                close = "<leader>e",
                go_in_plus = "l",
            },
            windows = {
                max_number = 3,
                preview = true,
                width_focus = 30,
                width_nofocus = 15,
                width_preview = 55,
            }
        })
        vim.keymap.set('n', '<leader>e', function()
            local minifiles = require('mini.files')
            local current_file = vim.api.nvim_buf_get_name(0)
            if current_file == '' then
                minifiles.open()
            else
                minifiles.open(current_file)
            end
        end, { desc = 'Open file explorer at current file' })
    end
}
