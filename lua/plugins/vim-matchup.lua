return {
	'andymass/vim-matchup',
	event = 'BufReadPre',

	init = function()
		vim.g.matchup_treesitter_enabled = true
		vim.g.matchup_matchparen_enabled = true
		vim.g.matchup_matchparen_timeout = 300
		vim.g.matchup_matchparen_insert_timeout = 60
	end,
}
