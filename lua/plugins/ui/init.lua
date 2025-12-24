return {
	{
		'EdenEast/nightfox.nvim',
		config = function()
			require('nightfox').setup()
		end,
	},

	{
		'Tsuzat/NeoSolarized.nvim',
		opts = {
			transparent = false,
		},
		config = function(_, opts)
			require('NeoSolarized').setup(opts)
			vim.cmd([[ colorscheme NeoSolarized ]])
		end,
	},

	{
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
	},
}
