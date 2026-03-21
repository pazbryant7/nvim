return {
	'mistweaverco/kulala.nvim',
	ft = { 'http', 'rest' },
	opts = {
		global_keymaps = false,
		global_keymaps_prefix = '<leader>R',
		kulala_keymaps_prefix = '',
	},
	keys = {
		{
			'<leader>Ro',
			function()
				require('kulala').open()
			end,
			desc = 'Kulala open',
		},
		{
			'<leader>Ra',
			function()
				require('kulala').run_all()
			end,
			desc = 'Kulala send all requests',
		},
		{
			'<leader>Rl',
			function()
				require('kulala').replay()
			end,
			desc = 'Kulala repeat last request',
		},
		{
			'<leader>Rs',
			function()
				require('kulala').set_selected_env()
			end,
			desc = 'Kulala select environment',
		},
		{
			'<leader>Rf',
			function()
				require('kulala').search()
			end,
			desc = 'Kulala find',
		},
		{
			'<leader>Ri',
			function()
				require('kulala').import()
			end,
			desc = 'Kulala import from',
		},
		{
			'<leader>Re',
			function()
				require('kulala').export()
			end,
			desc = 'Kulala export to',
		},
		{
			'<leader>R[',
			function()
				require('kulala').jump_prev()
			end,
			desc = 'Kulala jump previous',
		},
		{
			'<leader>R]',
			function()
				require('kulala').jump_next()
			end,
			desc = 'Kulala jump next',
		},
		{
			'<leader>Rv',
			function()
				require('kulala').toggle_view()
			end,
			desc = 'Kulala toggle body/headers',
		},
		{
			'<leader>Rc',
			function()
				require('kulala').clear_cached_files()
			end,
			desc = 'Kulala clear cached files',
		},
	},
}
