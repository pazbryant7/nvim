return {
	'nvim-mini/mini.indentscope',
	version = false,
	event = { 'BufReadPre', 'BufNewFile' },
	opts = function()
		return {
			draw = {
				animation = require('mini.indentscope').gen_animation.none(),
			},
			mappings = {
				object_scope = '',
				object_scope_with_border = '',
			},
		}
	end,
}
