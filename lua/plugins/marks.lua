return {
	'chentoast/marks.nvim',
	event = 'VeryLazy',
	opts = {
		default_mappings = true,
		mappings = {
			next = ']m',
			prev = '[m',
		},
	},
	config = function(_, opts)
		require('marks').setup(opts)
	end,
}
