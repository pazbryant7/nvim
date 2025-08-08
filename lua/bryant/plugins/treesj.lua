return {
	'Wansmer/treesj',
	dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
	opts = {},
	keys = {
		{
			'gS',
			function()
				require('treesj').toggle({ split = { recursive = true } })
			end,
			{ desc = 'Treesj Toggle Block Code' },
		},
	},
}
