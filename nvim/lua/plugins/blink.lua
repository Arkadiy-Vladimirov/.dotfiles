 return {
 	'saghen/blink.cmp',
   	-- optional: provides snippets for the snippet source

   	-- use a release tag to download pre-built binaries
   	version = '*',

   	opts = {
 		-- 'default' for mappings similar to built-in completion
 		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
 		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
 		-- See the full "keymap" documentation for information on defining your own keymap.
 		keymap = {
			preset = 'default',
			['<C-k>'] = { 'select_prev', 'fallback' },
			['<C-j>'] = { 'select_next', 'fallback' },
			['<C-n>'] = { 'select_and_accept', 'fallback' },
		},
 		appearance = {
 			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
 			-- Useful for when your theme doesn't support blink.cmp
 			-- Will be removed in a future release
 			use_nvim_cmp_as_default = true,
 			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
 			-- Adjusts spacing to ensure icons are aligned
 			nerd_font_variant = 'mono'
 		},
		signature = { enabled = true },
 		-- Default list of enabled providers defined so that you can extend it
 		-- elsewhere in your config, without redefining it, due to `opts_extend`
 		sources = {
 			default = { 'lsp', 'path', 'snippets', 'buffer' },
 		},
 	},
   	opts_extend = { "sources.default" }
 }
