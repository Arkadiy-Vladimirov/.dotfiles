return {
	"akinsho/toggleterm.nvim",
	version = "*", -- Optional: pin to a specific version
	config = function()
		require("toggleterm").setup({
		direction = "float",
			float_opts = {
				border = "curved",  -- Style of the floating window's border
				width = 120,        -- Width of the floating window
				height = 30,        -- Height of the floating window
			},
		})
		-- Enter terminal keymap
		vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>', { silent = true, noremap = true })
		-- Leave terminal keymap
		vim.keymap.set('t', '<C-e>', '<Cmd>ToggleTerm<CR>', { silent = true, noremap = true })
	end
}


