return {
	-- directly open ipynb files as quarto documents and convert them back
	-- requires:
	-- pip install jupytext
	'GCBallesteros/jupytext.nvim',
	opts = {
		custom_language_formatting = {
			python = {
				extension = 'qmd',
				style = 'quarto',
				force_ft = 'quarto',
			},
		},
	},
}
