return {
	'Tsuzat/NeoSolarized.nvim',
	opts = {
		transparent = false,
	},
	config = function(_, opts)
		require('NeoSolarized').setup(opts)
		vim.cmd([[ colorscheme NeoSolarized ]])
	end,
}
