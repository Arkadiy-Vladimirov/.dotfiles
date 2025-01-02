return {
	-- for lsp features in code cells / embedded code
	'jmbuhr/otter.nvim',
	dev = false,
	dependencies = {
		{
			'neovim/nvim-lspconfig',
			'nvim-treesitter/nvim-treesitter',
		},
	},
	config = function()
		require('otter').setup({
			lsp = {
				diagnostic_update_events = { "BufWritePost", "InsertLeave", "TextChanged" }
			}
		})
	end
}
