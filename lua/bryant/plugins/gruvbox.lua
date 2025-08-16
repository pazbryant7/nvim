return {
	'ellisonleao/gruvbox.nvim',
	priority = 1000,
	opts = {
		italic = {
			strings = false,
			emphasis = false,
			comments = false,
			operators = false,
			folds = false,
		},
	},
	config = function(_, opts)
		require('gruvbox').setup(opts)
		vim.cmd('colorscheme gruvbox')
	end,
}
