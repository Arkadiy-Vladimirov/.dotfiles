return {
	'neovim/nvim-lspconfig',
    dependencies = {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
	  {'hrsh7th/cmp-nvim-lsp'}, -- or {'saghen/blink.cmp'},
    },
    config = function()
        local cmp_lsp = require("cmp_nvim_lsp") -- or local blink = require('blink.cmp')
		local capabilities = vim.tbl_deep_extend(
			'force', {},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities() -- or blink.get_lsp_capabilities()
		)
		-- see :help mason-lspconfig-quickstart to get how to do that properly
		require('mason').setup()
		require('mason-lspconfig').setup({
			-- list of language servers to be installed either way
    		ensure_installed = {
				"lua_ls",
				"basedpyright",
				"ruff"
			},
			-- enable auto-install
			automatic_installation = true,
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
				-- pyright config
				["basedpyright"] = function ()
					local lspconfig = require("lspconfig")
					lspconfig.basedpyright.setup {
						settings = {
							basedpyright = {
								analysis = {
									typeCheckingMode = 'off'
								}
							}
						},
					}
				end,
			}
		})
		-- LspAttach is where you enable features that only work
		-- if there is a language server active in the file
		vim.api.nvim_create_autocmd('LspAttach', {
			desc = 'LSP actions',
			callback = function(event)
				local opts = {buffer = event.buf}

				vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
				vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
				vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
				vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
				vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
				vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
				vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
				vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
			end,
		})
		vim.diagnostic.config({
			virtual_text = false,
			underline = false,
		})
    end
}
