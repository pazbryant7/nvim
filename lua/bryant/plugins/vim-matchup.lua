return {
	'andymass/vim-matchup',
	lazy = false,
	init = function()
		vim.g.matchup_motion_enabled = 1
		vim.g.matchup_surround_enabled = 0
		vim.g.matchup_text_obj_enabled = 0
		vim.g.matchup_matchparen_enabled = 1
		vim.g.matchup_matchparen_offscreen = { method = 'scrolloff' }
	end,
}
