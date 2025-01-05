return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-path',
		'jmbuhr/otter.nvim',
	},
	config = function()
		local cmp = require('cmp')
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'buffer' },
				{ name = 'otter' }
            })
        })
	end
}
