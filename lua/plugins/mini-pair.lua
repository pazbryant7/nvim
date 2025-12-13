return {
	'nvim-mini/mini.pairs',
	version = false,
	keys = {
		{ '(', mode = 'i', desc = 'MiniPairs: insert ()' },
		{ '[', mode = 'i', desc = 'MiniPairs: insert []' },
		{ '{', mode = 'i', desc = 'MiniPairs: insert {}' },
		{ '"', mode = 'i', desc = 'MiniPairs: insert ""' },
		{ "'", mode = 'i', desc = "MiniPairs: insert ''" },
		{ '`', mode = 'i', desc = 'MiniPairs: insert ``' },
	},
	config = function()
		require('mini.pairs').setup()
	end,
}
