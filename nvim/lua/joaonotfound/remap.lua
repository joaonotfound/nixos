vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "<A-h>", ":bprevious<CR>")
vim.keymap.set("n", "<A-l>", ":bnext<CR>")
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")

vim.keymap.set("n", "<A-j>", "<C-d>zz")
vim.keymap.set("n", "<A-k>", "<C-u>zz")

vim.keymap.set("n", "f", "w")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", "<C-c>", "<Esc>")
