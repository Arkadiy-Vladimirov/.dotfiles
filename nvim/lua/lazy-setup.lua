-- Set lazy plugin manager path
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Git clone lazy repo if none
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

-- Add lazy path to vim runtime path
vim.opt.rtp:prepend(lazypath)

-- Setup lazy with all of the plugins
require("lazy").setup("plugins")
