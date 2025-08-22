return {
	'folke/flash.nvim',
	opts = {
		-- all your other options go here
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
	keys = function()
		local flash = require('flash')

		return {
			{
				's',
				mode = { 'n', 'x', 'o' },
				function()
					flash.jump()
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
					flash.treesitter()
				end,
				desc = 'Flash Treesitter',
			},
		}
	end,
}
