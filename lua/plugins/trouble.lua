return {
	'folke/trouble.nvim',
	cmd = 'Trouble',
	dependencies = { 'nvim-mini/mini.icons' },
	opts = {},
	keys = {
		{ '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Trouble: Diagnostics' },
		{ '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Trouble: Buffer diagnostics' },
		{ '<leader>xl', '<cmd>Trouble loclist toggle<cr>', desc = 'Trouble: Location list' },
		{ '<leader>xq', '<cmd>Trouble qflist toggle<cr>', desc = 'Trouble: Quickfix list' },
		{ '<leader>xs', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Trouble: Symbols' },
		{ '<leader>xt', '<cmd>Trouble todo toggle<cr>', desc = 'Trouble: Todo comments' },
	},
}
