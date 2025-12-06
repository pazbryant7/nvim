return {
	'nvim-mini/mini.pairs',
	event = 'VeryLazy',
	version = false,
	config = function()
		require('mini.pairs').setup()
	end,
}
