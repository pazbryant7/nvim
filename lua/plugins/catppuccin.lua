return {
	'catppuccin/nvim',
	name = 'catppuccin',
	opts = {
		flavour = 'mocha',
		background = { -- :h background
			light = 'latte',
			dark = 'mocha',
		},
		no_italic = true, -- Force no italic
	},
	config = function(_, opts)
		require('catppuccin').setup(opts)
	end,
}
