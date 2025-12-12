return {
	'folke/flash.nvim',
	event = 'VeryLazy',
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
}
