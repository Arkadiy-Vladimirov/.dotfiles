return {
	'neovim/nvim-lspconfig',
    dependencies = {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
	  {'saghen/blink.cmp'},
    },
    init = function()
    	-- Reserve a space in the gutter
    	-- This will avoid an annoying layout shift in the screen
      	vim.opt.signcolumn = 'yes'
    end,
    config = function()
		-- get blink capabilities
		local blink = require('blink.cmp')
		local capabilities = vim.tbl_deep_extend(
			'force', {},
			vim.lsp.protocol.make_client_capabilities(),
			blink.get_lsp_capabilities()
		)
		-- see :help mason-lspconfig-quickstart to get how to do that properly
		require('mason').setup()
		require('mason-lspconfig').setup({
			-- list of language servers to be installed either way
    		ensure_installed = {
				"lua_ls"
			},
			-- handlers are called whenever a server is ready to be set up.
        	handlers = {
        		-- this is the "default handler"
          		-- it applies to every language server without a "custom handler"
        		function(server_name)
        			require('lspconfig')[server_name].setup({
						capabilities = capabilities
					})
          		end,
				-- custom handler for lua to get rid of "undefined global vim" error
           		["lua_ls"] = function ()
               		local lspconfig = require("lspconfig")
               		lspconfig.lua_ls.setup {
                   		settings = {
                       		Lua = {
								runtime = { version = 'LuaJIT' },
								workspace = {
									checkThirdParty = false,
									library = {
										vim.env.VIMRUNTIME,
									},
								},
                       		}
                   		},
               		}
           		end,
			}
    	})
    end
}
