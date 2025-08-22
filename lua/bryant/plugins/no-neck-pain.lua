return {
	'shortcuts/no-neck-pain.nvim',
	cmd = 'NoNeckPainToggleLeftSide',
	opts = {
		width = 100,
		mappings = {
			enabled = false,
		},
		buffers = {
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
			desc = 'NoNeckPain Toggle',
		},
	},
}
