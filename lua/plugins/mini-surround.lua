return {
	'nvim-mini/mini.surround',
	version = false,
	keys = {
		{ 'gza', mode = { 'n', 'x' }, desc = 'Surround: Add' },
		{ 'gzd', mode = 'n', desc = 'Surround: Delete' },
		{ 'gzf', mode = { 'n', 'x', 'o' }, desc = 'Surround: Find Right' },
		{ 'gzF', mode = { 'n', 'x', 'o' }, desc = 'Surround: Find Left' },
		{ 'gzh', mode = 'n', desc = 'Surround: Highlight' },
		{ 'gzr', mode = 'n', desc = 'Surround: Replace' },
	},
	opts = {
		mappings = {
			add = 'gza',
			delete = 'gzd',
			find = 'gzf',
			find_left = 'gzF',
			highlight = 'gzh',
			replace = 'gzr',
		},
	},
}
