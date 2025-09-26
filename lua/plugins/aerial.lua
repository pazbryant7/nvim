return {
	'stevearc/aerial.nvim',
	cmd = { 'AerialToggle', 'AerialNext', 'AerialPrev' },
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
	},
	opts = {
		close_on_select = false,
		layout = {
			max_width = { 60, 0.6 },
			width = nil,
			min_width = 10,
			default_direction = 'float',
		},
		close_automatic_events = {
			'unfocus',
			'switch_buffer',
		},
		autojump = true,
		show_guides = true,
		nav = {
			preview = true,
			autojump = true,
		},
		float = {
			relative = 'cursor',
			min_height = { 8, 0.1 },
		},
	},
	keys = {
		{ '<m-j>', '<cmd>AerialPrev<cr>', desc = 'Aerial Prev Symbol' },
		{ '<m-k>', '<cmd>AerialNext<cr>', desc = 'Aerial Next Symbol' },
		{ '<m-q>', '<cmd>AerialToggle<cr>', desc = 'Aerial Toggle Symbols' },
	},
}
