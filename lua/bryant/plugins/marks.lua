return {
	'chentoast/marks.nvim',
	lazy = false,
	cmd = 'MarksQFListAll',
	opts = {
		default_mappings = false,
		mappings = {
			set = 'm',
			set_next = 'm,',
			toggle = 'mm',
			delete_buf = 'dmm',
			next = ']m',
			prev = '[m',
			preview = 'm;',
		},
	},
	keys = {
		{ 'm;', desc = 'Marks preview' },
		{ 'm', desc = 'Start marks plugin' },
		{ 'mq', ':MarksQFListAll<cr>', desc = 'Marks to quick fix list' },
	},
}
