return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	dependencies = { 'nvim-mini/mini.icons' },
	opts = {},
	keys = {
		{
			'<leader>?',
			function()
				require('which-key').show({ global = false })
			end,
			desc = 'Which-Key: Buffer Local Keymaps',
		},
	},
}
