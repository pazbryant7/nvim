return {
	'Wansmer/treesj',
	dependencies = { 'nvim-treesitter/nvim-treesitter' },
	config = function()
		require('treesj').setup()
	end,
	keys = { '<space>m', '<space>j', '<space>s' },
}
