return {
	'mistweaverco/kulala.nvim',
	ft = { 'http', 'rest' },
	keys = {
		{
			'<leader>Rs',
			function()
				require('kulala').run()
			end,
			desc = 'Send request',
		},
		{
			'<leader>Ra',
			function()
				require('kulala').run_all()
			end,
			desc = 'Send all requests',
		},
		{
			'<leader>Rb',
			function()
				require('kulala').replay()
			end,
			desc = 'Open scratchpad',
		},
	},
	opts = {
		global_keymaps = false,
		global_keymaps_prefix = '<leader>R',
		kulala_keymaps_prefix = '',
	},
}
