return {
	'folke/zen-mode.nvim',
	opts = {
		window = {
			backdrop = 100, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
			width = 80, -- width of the Zen window
		},
	},
	keys = {
		{
			'zm',
			mode = 'n',
			'<cmd>ZenMode<CR>',
			desc = 'Zen mode',
		},
	},
}
