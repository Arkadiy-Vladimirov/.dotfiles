return {
	'neovim/nvim-lspconfig',
    dependencies = {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      -- {'hrsh7th/cmp-nvim-lsp'},
    },
    init = function()
    	-- Reserve a space in the gutter
    	-- This will avoid an annoying layout shift in the screen
      	vim.opt.signcolumn = 'yes'
    end,

    config = function()

      	-- local lsp_defaults = require('lspconfig').util.default_config

      	-- Add cmp_nvim_lsp capabilities settings to lspconfig
      	-- This should be executed before you configure any language server
      	-- lsp_defaults.capabilities = vim.tbl_deep_extend(
      	--  'force',
      	--  lsp_defaults.capabilities,
      	--  require('cmp_nvim_lsp').default_capabilities()
      	--)

      	-- LspAttach is where you enable features that only work
      	-- if there is a language server active in the file
		vim.api.nvim_create_autocmd('LspAttach', {
        	desc = 'LSP actions',
        	callback = function(event)
          		local opts = {buffer = event.buf}

          		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        	end,
      })

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
        		require('lspconfig')[server_name].setup({})
          	end,
			-- custom handler for lua to get rid of "undefined global vim" error
           	["lua_ls"] = function ()
               	local lspconfig = require("lspconfig")
               	lspconfig.lua_ls.setup {
                   	settings = {
                       	Lua = {
                           	diagnostics = {
                               	globals = { "vim" }
                           	}
                       	}
                   	}
               	}
           	end,
		}
    })
    end
}
