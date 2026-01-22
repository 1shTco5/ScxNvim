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

-----Indent-Blankline-----
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

-----TogTerminal-----
local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
}

for option, value in pairs(powershell_options) do
    vim.opt[option] = value
end

-----Neovide-----
if vim.g.neovide then
    opt.title = true
    opt.titlestring = "sTcx"
    vim.g.neovide_title_background_color = "#1e1e2e"
    vim.g.neovide_title_text_color = "CornflowerBlue"

    vim.o.guifont = "RecMonoCasual_Nerd_Font_Mono,YouYuan:h16:b" --字体预览 font preview

    vim.g.neovide_input_use_logo = true
    
    vim.keymap.set('', '<C-v>', '"+P', {noremap = true, silent = true})
    vim.keymap.set('i', '<C-v>', '<C-r>+', {noremap = true})
    vim.keymap.set('c', '<C-v>', '<C-r>+', {noremap = true})
end
