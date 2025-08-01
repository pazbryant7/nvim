return {
	'folke/zen-mode.nvim',
	opts = {
		window = {
			backdrop = 100, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
			width = 100, -- width of the Zen window
		},
		plugins = {
			options = {
				enabled = false,
			},
			tmux = { enabled = false }, -- disables the tmux statusline
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
