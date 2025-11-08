local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.shiftwidth = 0
opt.tabstop = 4
opt.expandtab = true

opt.scrolloff = 5

opt.cursorline = true

opt.splitright = true
opt.splitbelow = true

opt.showmode = false

opt.ignorecase = true
opt.smartcase = true

opt.hlsearch = false

opt.clipboard = "unnamedplus"

opt.termguicolors = true
opt.signcolumn = "yes"

--Indent-Blankline
local function beautify_linenr()
    local grey, accent = "#7f848e", "#ff9e64"
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = grey, bg = "NONE" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = accent, bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = grey, bg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = grey, bg = "NONE" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "NONE", bg = "NONE" })
end

local function beautify_indent()
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#454b54", nocombine = true })
    vim.api.nvim_set_hl(0, "IblScope", { fg = "#ff9e64", nocombine = true })
end

beautify_linenr()
beautify_indent()

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern  = "*",
    callback = function()
        beautify_linenr()
        beautify_indent()
    end,
})
