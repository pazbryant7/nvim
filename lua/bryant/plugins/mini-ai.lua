return {
	'echasnovski/mini.ai',
	version = '*',
	dependencies = 'nvim-treesitter-textobjects',
	opts = function()
		local ai = require('mini.ai')
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
				goto_left = 'g[',
				goto_right = 'g]',
			},
			custom_textobjects = {
				o = ai.gen_spec.treesitter({
					a = { '@loop.outer', '@conditional.outer' },
					i = { '@loop.inner', '@conditional.inner' },
				}, {}),
				F = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }, {}),
				c = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }, {}),
			},
		}
	end,
	keys = {
		{ 'a', mode = { 'x', 'o' }, desc = 'Mini AI Around textobject' },
		{ 'i', mode = { 'x', 'o' }, desc = 'Mini AI Inside textobject' },
	},
}
