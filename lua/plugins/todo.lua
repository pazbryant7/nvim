return {
	'folke/todo-comments.nvim',
	event = 'UIEnter',
	cmd = 'TodoQuickFix',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {},
	keys = {
    -- stylua: ignore start
		{ 'gT', '<cmd>TodoQuickFix<cr>', desc = 'Previous todo comment' },
	},
}
