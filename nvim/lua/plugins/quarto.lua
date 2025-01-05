return {
    'quarto-dev/quarto-nvim',
	dependencies = {
		-- for language features in code cells
		-- configured in lua/plugins/lsp.lua
		'jmbuhr/otter.nvim',
		'nvim-treesitter/nvim-treesitter',
		'benlubas/molten-nvim',
	},
	config = function()
		require("quarto").setup({
			codeRunner = {
				enabled = true,
				default_method = "slime", -- "molten", "slime", "iron" or <function>
				never_run = {'yaml'}
			},
		})
		local runner = require("quarto.runner")
		vim.keymap.set("n", "<leader>rl", runner.run_line,  { desc = "run line", 			silent = true })
		vim.keymap.set("n", "<leader>rc", runner.run_cell,  { desc = "run cell", 			silent = true })
		vim.keymap.set("n", "<leader>ra", runner.run_above, { desc = "run cell and above", 	silent = true })
		vim.keymap.set("n", "<leader>rb", runner.run_below, { desc = "run cell and above", 	silent = true })
		vim.keymap.set("n", "<leader>R",  runner.run_all, 	{ desc = "run all cells", 		silent = true })
		-- doesn't work for some reason. do a direct call to molten instead (see molten.lua)
		-- vim.keymap.set("v", "<leader>r",  runner.run_range, { desc = "run visual range", 	silent = true })
	end
}
