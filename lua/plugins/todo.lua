return {
	'folke/todo-comments.nvim',
	event = 'UIEnter',
	cmd = 'TodoQuickFix',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {},
	keys = {
		{ 'gT', '<cmd>TodoQuickFix<cr>', desc = 'Previous todo comment' },
	},
}
