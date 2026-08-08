return {
	'echasnovski/mini.ai',
	version = false,
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	opts = function()
		local mini_ai = require('mini.ai')
		local gen_spec = mini_ai.gen_spec

		return {
			n_lines = 500,
			search_method = 'cover_or_next',
			mappings = {
				around = 'a',
				inside = 'i',
				around_next = 'an',
				inside_next = 'in',
				around_last = 'al',
				inside_last = 'il',
				goto_left = '[g',
				goto_right = ']g',
			},

			custom_textobjects = {
				o = gen_spec.treesitter({ a = '@loop.outer', i = '@loop.inner' }),
				c = gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }),
				F = gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
				I = gen_spec.treesitter({ a = '@conditional.outer', i = '@conditional.inner' }),
				g = function()
					local from = { line = 1, col = 1 }
					local to = {
						line = vim.fn.line('$'),
						col = math.max(vim.fn.getline('$'):len(), 1),
					}
					return { from = from, to = to }
				end,
			},
		}
	end,
	keys = {
		{ 'il', mode = { 'x', 'o' }, desc = 'Mini.AI: inside last' },
		{ 'al', mode = { 'x', 'o' }, desc = 'Mini.AI: around last' },
		{ 'in', mode = { 'x', 'o' }, desc = 'Mini.AI: inside next' },
		{ 'an', mode = { 'x', 'o' }, desc = 'Mini.AI: around next' },
		{ 'i', mode = { 'x', 'o' }, desc = 'Mini.AI: inside textobject' },
		{ 'a', mode = { 'x', 'o' }, desc = 'Mini.AI: around textobject' },
		{ '[g', mode = { 'n', 'x', 'o' }, desc = 'Mini.AI: go to left edge' },
		{ ']g', mode = { 'n', 'x', 'o' }, desc = 'Mini.AI: go to right edge' },
	},
}
