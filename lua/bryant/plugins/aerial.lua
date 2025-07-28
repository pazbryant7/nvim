return {
	'stevearc/aerial.nvim',
	cmd = { 'AerialToggle', 'AerialNext', 'AerialPrev' },
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
	},
	opts = {

		layout = {
			-- These control the width of the aerial window.
			-- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			-- min_width and max_width can be a list of mixed types.
			-- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
			max_width = { 60, 0.4 },
			width = nil,
			min_width = 25,
			default_direction = 'prefer_right',
		},

		autojump = false,
	},
	keys = {
		{ '<m-j>', '<cmd>AerialPrev<cr>', desc = 'Aerial Prev Symbol' },
		{ '<m-k>', '<cmd>AerialNext<cr>', desc = 'Aerial Next Symbol' },
		{ '<m-q>', '<cmd>AerialToggle<cr>', desc = 'Aerial Toggle Symbols' },
	},
}
