return {
	{
		'neovim/nvim-lspconfig',
		enabled = function()
			return os.getenv('IN_NIX_SHELL') ~= nil
		end,
		event = { 'BufReadPre', 'BufNewFile' },
		config = function()
			require('plugins.lsp.setup').setup()
			require('plugins.lsp.attach').on_attach()
		end,
	},
}
