return {
	cmd = {
		"lua-language-server",
	},
	filetypes = {
		"lua",
	},
	root_markers = {
		".git",
		".luacheckrc",
		".luarc.json",
		".luarc.jsonc",
		".stylua.toml",
		"selene.toml",
		"selene.yml",
		"stylua.toml",
	},
	settings = {
	    Lua = {
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME, -- fix "undefined global vim" warning
				},
			},
	        diagnostics = {
	            -- disable = { "missing-parameters", "missing-fields" },
	        },
	    },
	},
	single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Warning,
}
