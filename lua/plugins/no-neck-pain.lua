return {
	'shortcuts/no-neck-pain.nvim',
	lazy = false,
	version = '*',
	cmd = { 'NoNeckPain', 'NoNeckPainWidthDown', 'NoNeckPainWidthUp' },
	opts = {
		width = 70,
		disableOnLastBuffer = true,
		autocmds = {
			enableOnVimEnter = true,
			enableOnTabEnter = true,
			reloadOnColorSchemeChange = false,
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
			'<m-l>',
			mode = 'n',
			'<cmd>NoNeckPainWidthDown<CR>',
			desc = 'NoNeckPain Increase Width',
		},
		{
			'<m-h>',
			mode = 'n',
			'<cmd>NoNeckPainWidthUp<CR>',
			desc = 'NoNeckPain Decrease Width',
		},
		{
			'zm',
			mode = 'n',
			'<cmd>NoNeckPain<CR>',
			desc = 'NoNeckPain',
		},
	},
}
