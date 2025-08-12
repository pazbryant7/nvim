return {
	'folke/flash.nvim',
	opts = {
		search = {
			multi_window = false,
		},
		label = {
			current = true,
			rainbow = {
				enabled = true,
				-- number between 1 and 9
				shade = 5,
			},
		},
		jump = {
			autojump = false,
		},
		highlight = {
			backdrop = false,
			matches = true,
			groups = {
				match = 'FlashMatch',
				current = 'FlashCurrent',
				backdrop = 'FlashBackdrop',
				label = 'FlashLabel',
			},
		},
		modes = {
			char = {
				enabled = true,
				-- only when not using jump labels
				autohide = false,
				jump_labels = true,
				multi_line = true,
				keys = { 'f', 'F', 't', 'T', [';'] = ':', ',' },
				highlight = { backdrop = false },
				jump = {
					register = false,
					-- when using jump labels, set to 'true' to automatically jump
					-- or execute a motion when there is only one match
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
				'S',
				mode = { 'n', 'x', 'o' },
				function()
					flash.treesitter()
				end,
				desc = 'Flash Treesitter',
			},
		}
	end,
}
