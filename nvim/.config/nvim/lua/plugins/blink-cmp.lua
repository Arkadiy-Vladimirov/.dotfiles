 return {
	'saghen/blink.cmp',
	-- use a release tag to download pre-built binaries
	version = '1.*',
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- See the full "keymap" documentation for information on defining your own keymap.
		keymap = {
			preset = 'default',
			['<S-Tab>'] = {'accept'},
			['<C-e>'] = {'accept'},
			['<C-j>'] = { 'select_next', 'fallback' },
			['<C-k>'] = { 'select_prev', 'fallback' },
			['<C-h>'] = { 'scroll_documentation_up', 'fallback' },
			['<C-l>'] = { 'scroll_documentation_down', 'fallback' },
		},
		cmdline = {
			keymap = {
				preset = 'inherit',
				['<CR>'] = { 'accept_and_enter', 'fallback' },
			},
			completion = { menu = { auto_show = true } },
		},
		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      		-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = 'mono'
		},
		completion = {
			documentation = {
				--The documentation window will show automatically
				auto_show = true,
			},
		},
		-- Default list of enabled providers defined so that you can extend it
    	-- elsewhere in your config, without redefining it, due to `opts_extend`
    	sources = {
      		default = { 'lsp', 'path', 'buffer' },
    	},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = { "sources.default" }
 }
