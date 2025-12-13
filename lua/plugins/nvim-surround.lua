return {
	'kylechui/nvim-surround',
	config = function()
		require('nvim-surround').setup()
	end,
	keys = {
		{ 'ys', mode = 'n', desc = 'Surround: add' },
		{ 'yss', mode = 'n', desc = 'Surround: add line' },
		{ 'ds', mode = 'n', desc = 'Surround: delete' },
		{ 'cs', mode = 'n', desc = 'Surround: change' },
		{ 'S', mode = 'x', desc = 'Surround: add (visual)' },
	},
}
