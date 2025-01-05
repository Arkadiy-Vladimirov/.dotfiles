local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4

opt.cursorline = true
opt.termguicolors = true

-- reserve some lines when scrolling
vim.opt.scrolloff = 8
-- reserve a space in the gutter to avoid layout shift in the screen
vim.opt.signcolumn = "yes"
-- color char limit
vim.opt.colorcolumn = "80"
