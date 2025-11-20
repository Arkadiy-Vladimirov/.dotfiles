return {
	"nvim-treesitter/nvim-treesitter",
 	-- Automatically update parsers on install
 	build = ":TSUpdate",

	opts = {
 		-- Llist of parsers ensured to be installed
		ensure_installed = {
			"vim",
			"vimdoc",
			"c",
			"c++",
			"lua",
			"python"
		},
		 -- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- Automatically install missing parsers when entering buffer
        	-- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
		auto_install = true,

		-- Enable Syntax Tree based indentation
		indent = {
			enable = true,
		},

		-- Enable Syntax Tree based highligting
		highlight = {
			indent = true,
		},
	}
}
