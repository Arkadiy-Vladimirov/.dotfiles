vim.lsp.enable({
	"lua_ls",
	"ruff",
	"basedpyright"
})

vim.diagnostic.config({
	underline = false,
	virtual_text = true,
	virtual_lines = {
		current_line = true
	},
	update_in_insert = true,
})
