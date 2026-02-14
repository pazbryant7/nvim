return {
	'catppuccin/nvim',
	lazy = false,
	priority = 1000,
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
		vim.cmd('colorscheme catppuccin-mocha')
	end,
}
