return {
	-- Requires Python>=3.10
	'benlubas/molten-nvim',
	-- Don't forget to run this command manually after installation and each update
	build = ':UpdateRemotePlugins',
	init = function()
		vim.g.molten_image_provider = 'image.nvim'
		vim.g.molten_output_win_max_height = 20
		vim.g.molten_auto_open_output = true
	end,
	keys = {
		{
			'<leader>mi',
			':MoltenInit<cr>',
			desc = '[m]olten [i]nit'
		}, {
			'<leader>r',
			':<C-u>MoltenEvaluateVisual<cr>',
			mode = 'v',
			desc = 'molten [r]un visual block',
		}, {
			'<leader>r',
			':MoltenReevaluateCell<cr>',
			mode = 'n',
			desc = 'molten [r]e-run cell',
		},
	},
}
