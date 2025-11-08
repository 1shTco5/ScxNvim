return {
    "nvim-mini/mini.cursorword",
    version = '*',
    event = "VeryLazy",                    -- 延迟加载，优化启动速度（可选）
    config = function()
        require('mini.cursorword').setup() -- 这行是关键，启用单词高亮
        -- 自定义高亮样式，适配 everforest
        vim.api.nvim_set_hl(0, "MiniCursorword", {
            -- bg = "#4B4B4B", -- 深灰背景，everforest 风格
            -- fg = "#D8A657", -- 黄色前景，参考 everforest 的调色板
            underline = true,
            bold = true,    -- 加粗，增强可见性
        })
        vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", {
            underline = true, -- 当前单词加下划线
            bold = true
            -- fg = "#E67E80",   -- 红色前景，突出当前单词
        })
    end,
}
