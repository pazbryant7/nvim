return {
	'folke/trouble.nvim',
	cmd = 'Trouble',
	opts = {},
	keys = {
		{
			'<leader>x',
			'<cmd>Trouble diagnostics toggle<cr>',
			desc = 'Diagnostics (Trouble)',
		},
		{

			'<c-x>',
			'<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
			desc = 'Buffer Diagnostics (Trouble)',
		},
	},
}
