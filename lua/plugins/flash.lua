return {
	'folke/flash.nvim',
	opts = {
		modes = {
			char = {
				enabled = true,

				jump_labels = true,

				keys = {
					'f',
					'F',
					't',
					'T',
					[';'] = ':',
					',',
				},

				highlight = { backdrop = false },

				multi_line = false,

				auto_jump = true,

				rainbow = {
					enabled = true,
					shade = 9,
				},
			},
			search = { enabled = false },
			treesitter = { enabled = false },

			jump = {
				register = true,
				autojump = true,
			},
		},
	},
	keys = {
		{ 'f', mode = { 'n', 'x', 'o' }, desc = 'Flash: forward char jump' },
		{ 'F', mode = { 'n', 'x', 'o' }, desc = 'Flash: backward char jump' },
		{ 't', mode = { 'n', 'x', 'o' }, desc = 'Flash: forward till char' },
		{ 'T', mode = { 'n', 'x', 'o' }, desc = 'Flash: backward till char' },
		{
			'gs',
			mode = { 'n', 'x', 'o' },
			function()
				require('flash').treesitter()
			end,
			desc = 'Flash Treesitter',
		},
	},
}
