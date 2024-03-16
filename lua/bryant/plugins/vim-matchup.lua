return {
	'andymass/vim-matchup',
	event = 'VeryLazy',
	config = function()
		vim.g.matchup_matchparen_offscreen = { method = 'popup' }
		-- Disable highlighting
		vim.g.matchup_matchparen_enabled = 0
	end,
}
