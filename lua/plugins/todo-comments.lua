return {
	'folke/todo-comments.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	opts = {},
	keys = {
		{
			']T',
			function()
				require('todo-comments').jump_next()
			end,
			desc = 'Todo Comments: Next',
		},
		{
			'[T',
			function()
				require('todo-comments').jump_prev()
			end,
			desc = 'Todo Comments: Previous',
		},
	},
}
