return {
	'mistweaverco/kulala.nvim',
	ft = { 'http', 'rest' },
	keys = {
		{
			'<leader>Rs',
			function()
				require('kulala').run()
			end,
			desc = 'Kulala send request',
		},
		{
			'<leader>Ra',
			function()
				require('kulala').run_all()
			end,
			desc = 'Kulala send all requests',
		},
		{
			'<leader>Rb',
			function()
				require('kulala').replay()
			end,
			desc = 'Kulala open scratchpad',
		},
	},
	opts = {
		global_keymaps = false,
		global_keymaps_prefix = '<leader>R',
		kulala_keymaps_prefix = '',
	},
}
