return {
	"OXY2DEV/markview.nvim",
    lazy = false,
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-mini/mini.icons',
		"saghen/blink.cmp"
	},
	config = function()
		require("markview").setup({
				preview = {
				icon_provider = "mini",
			},
			modes = { "n", "c" },
			hybrid_modes = { "n" },
		})
	end
}
