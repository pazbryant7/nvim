return {
	'shortcuts/no-neck-pain.nvim',
	version = '*',
	cmd = 'NoNeckPain',
	event = 'BufEnter',
	opts = {
		width = 70,
		disableOnLastBuffer = true,
		autocmds = {
			enableOnVimEnter = true,
			enableOnTabEnter = false,
			reloadOnColorSchemeChange = true,
			skipEnteringNoNeckPainBuffer = true,
		},
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
				fillchars = 'eob: ',
			},
		},

		integrations = {
			neotest = {
				position = 'right',
				reopen = true,
			},
			NvimDAPUI = {
				---@type "none"
				position = 'none',
				reopen = true,
			},
			dashboard = {
				enabled = true,
				filetypes = { 'leetcode.nvim', 'aerial' },
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
