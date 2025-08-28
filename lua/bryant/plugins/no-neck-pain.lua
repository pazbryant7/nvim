return {
	'shortcuts/no-neck-pain.nvim',
	version = '*',
	cmd = 'NoNeckPain',
	opts = {
		width = 80,
		mappings = {
			enabled = false,
		},
		buffers = {
			right = {
				enabled = false,
			},
			wo = {
				cursorline = false,
				cursorcolumn = false,
				colorcolumn = '0',
				number = false,
				relativenumber = false,
				foldenable = false,
				list = false,
				wrap = true,
				linebreak = true,
				signcolumn = 'no', -- Set signcolumn to 'no'
			},
		},
	},
	keys = {
		{
			'zm',
			mode = 'n',
			'<cmd>NoNeckPain<CR>',
			desc = 'NoNeckPain',
		},
	},
}
