return {
	'echasnovski/mini.ai',
	version = '*',
	keys = {
		{ 'a', mode = { 'x', 'o' } },
		{ 'i', mode = { 'x', 'o' } },
	},
	dependencies = 'nvim-treesitter-textobjects',
	opts = function()
		local ai = require('mini.ai')
		return {
			n_lines = 500,

			mappings = {
				-- Main textobject prefixes
				around = 'a',
				inside = 'i',

				-- Next/last variants
				around_next = 'an',
				inside_next = 'in',
				around_last = 'al',
				inside_last = 'il',

				-- Move cursor to corresponding edge of `a` textobject
				goto_left = 'g[',
				goto_right = 'g]',
			},
			custom_textobjects = {
				o = ai.gen_spec.treesitter({
					a = { '@loop.outer', '@conditional.outer' },
					i = { '@loop.inner', '@conditional.inner' },
				}, {}),
				F = ai.gen_spec.treesitter(
					{ a = '@function.outer', i = '@function.inner' },
					{}
				),
				c = ai.gen_spec.treesitter(
					{ a = '@class.outer', i = '@class.inner' },
					{}
				),
			},
		}
	end,
}
