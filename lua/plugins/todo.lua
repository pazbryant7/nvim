return {
	'folke/todo-comments.nvim',
	event = 'UIEnter',
	cmd = 'TodoQuickFix',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {},
	keys = {
		{ '<leader>tq', '<cmd>TodoQuickFix<cr>', desc = 'Previous Todo Comment' },
	},
}
