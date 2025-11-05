return {
	'Wansmer/treesj',
	dependencies = 'nvim-treesitter/nvim-treesitter',
	config = function()
		require('treesj').setup({})
	end,
	keys = {
		-- stylua: ignore start
		{ '<leader>m', function() require('treesj').toggle() end, mode = 'n', desc = 'Treesj toggle split/join' },
		{ '<leader>s', function() require('treesj').split() end, mode = 'n', desc = 'Treesj split node' },
		{ '<leader>j', function() require('treesj').join() end, mode = 'n', desc = 'Treesj join node' },
	},
}
