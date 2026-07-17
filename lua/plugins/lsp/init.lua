return {
	{
		'folke/lazydev.nvim',
		ft = 'lua', -- only load on lua files
		opts = {
			library = {},
		},
	},

	{
		'neovim/nvim-lspconfig',
		enabled = function()
			return os.getenv('IN_NIX_SHELL') ~= nil
		end,
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'j-hui/fidget.nvim', opts = {} },
		},
		config = function()
			require('plugins.lsp.setup').setup()
			require('plugins.lsp.attach').on_attach()
		end,
	},
}
