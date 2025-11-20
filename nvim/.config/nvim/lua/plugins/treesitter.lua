return {
	"nvim-treesitter/nvim-treesitter",
 	-- Automatically update parsers on install
 	build = ":TSUpdate",

	-- tell lazy which module to call `setup` on
	main = "nvim-treesitter.configs",

	opts = {
 		-- Llist of parsers ensured to be installed
		ensure_installed = {
		-- vim
			"vim",
			"vimdoc",
		-- programming languages
			"c",
			"cpp",
			"lua",
			"python",
		-- mark-up
			"csv",
			"json",
			"toml",
			"yaml",
			"markdown",
		-- scripting
			"bash",
			"fish",
			"ssh_config",
			"make",
			"cmake",
		-- git
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
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
			enable = true,
		},
	}
}
