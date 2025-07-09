-- set leader
vim.g.mapleader = " "

-- go to netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move selected
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- copy into system buffer
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
