return {
	'folke/flash.nvim',
	event = 'InsertEnter',
	opts = {
		search = {
			multi_window = false,
		},
		label = {
			current = true,
			rainbow = {
				enabled = false,
				shade = 5,
			},
		},
		jump = {
			autojump = true,
		},
		highlight = {
			backdrop = false,
			matches = true,
			groups = {
				match = 'FlashMatch',
				current = 'FlashCurrent',
				backdrop = 'FlashBackdrop',
				label = '@error',
			},
		},
		modes = {
			char = {
				enabled = true,
				autohide = false,
				jump_labels = true,
				multi_line = false,
				keys = { 'f', 'F', 't', 'T', [';'] = ':', ',' },
				highlight = { backdrop = false },
				jump = {
					register = false,
					autojump = true,
				},
			},
			treesitter = {
				jump = { pos = 'range', autojump = true },
				highlight = {
					backdrop = false,
					matches = false,
				},
			},
		},
	},
	keys = {
		{
			's',
			mode = { 'n', 'x', 'o' },
			function()
				require('flash').jump()
			end,
			desc = 'Flash',
		},
		{
			'r',
			mode = 'o',
			function()
				require('flash').remote()
			end,
			desc = 'Remote Flash',
		},
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
