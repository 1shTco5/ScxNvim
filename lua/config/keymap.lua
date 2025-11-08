-----KeyBinding-----
local map = vim.keymap.set
vim.g.mapleader = " "

map({ "n", "i" }, "<C-z>", "<cmd>undo<CR>", { silent = true })
map("i", "jk", "<ESC>")

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height", silent = true })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height", silent = true })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width", silent = true })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width", silent = true })

map('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save File' }, { silent = true })
map('i', '<C-s>', '<Esc><cmd>w<CR>a', { desc = 'Save File' }, { silent = true })
vim.api.nvim_create_user_command('W', 'w', {})

