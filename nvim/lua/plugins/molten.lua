return {
	-- Requires Python>=3.10
	'benlubas/molten-nvim',
	-- Don't forget to run this command manually after installation and each update
	build = ':UpdateRemotePlugins',
	init = function()
		vim.g.molten_image_provider = 'image.nvim'
		vim.g.molten_output_win_max_height = 20
		vim.g.molten_auto_open_output = false
		-- works for virt text and the output window
		vim.g.molten_wrap_output = true
		-- outputs are always shown as virtual text, can be buggy with long images
		vim.g.molten_virt_text_output = true
		-- workaround to make the output show up below the \`\`\` cell delimiter
		vim.g.molten_virt_lines_off_by_1 = true
	end,
	config = function()
		vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", 					{ desc = "[i]nitialize kernel", 	silent = true })
		vim.keymap.set("n", "<leader>me", ":MoltenEvaluateOperator<CR>", 		{ desc = "[e]valuate operator", 	silent = true })
		vim.keymap.set("n", "<leader>mo", ":noautocmd MoltenEnterOutput<CR>", 	{ desc = "[o]pen output window", 	silent = true })
		vim.keymap.set("n", "<leader>mr", ":MoltenReevaluateCell<CR>", 			{ desc = "[r]e-eval cell", 			silent = true })
		vim.keymap.set("v", "<leader>r",  ":<C-u>MoltenEvaluateVisual<CR>gv", 	{ desc = "[r]un visual selection", 	silent = true })
		vim.keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>", 				{ desc = "[h]ide output window", 	silent = true })
		vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>", 					{ desc = "[d]elete Molten cell", 	silent = true })
	end,
}
