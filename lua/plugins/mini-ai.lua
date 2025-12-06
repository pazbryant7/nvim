return {
	'echasnovski/mini.ai',
	version = false,
	dependencies = 'nvim-treesitter-textobjects',
	config = function()
		local mini_ai = require('mini.ai')
		local gen_spec = mini_ai.gen_spec

		mini_ai.setup({
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
				o = gen_spec.treesitter({ a = '@loop.outer', i = '@loop.inner' }),
				c = gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }),
				F = gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
				i = gen_spec.treesitter({ a = '@conditional.outer', i = '@conditional.inner' }),
			},
		})
	end,
	keys = {
		{ 'a', mode = { 'x', 'o' }, desc = 'Around textobject' },
		{ 'i', mode = { 'x', 'o' }, desc = 'Inside textobject' },
		{ 'an', mode = { 'x', 'o' }, desc = 'Around next textobject' },
		{ 'in', mode = { 'x', 'o' }, desc = 'Inside next textobject' },
		{ 'al', mode = { 'x', 'o' }, desc = 'Around last textobject' },
		{ 'il', mode = { 'x', 'o' }, desc = 'Inside last textobject' },
		{ 'g[', mode = { 'x', 'o' }, desc = 'Go left' },
		{ 'g]', mode = { 'x', 'o' }, desc = 'Go right' },
	},
}
