return {
	{
		'neovim/nvim-lspconfig',
		enabled = function()
			return os.getenv('IN_NIX_SHELL') ~= nil
		end,
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = { 'saghen/blink.cmp' },
		config = function()
			require('plugins.lsp.setup').setup()
		end,
	},
}
