return {
	'stevearc/oil.nvim',
	lazy = false,
	keys = {
		{ '-', '<CMD>Oil<CR>', { desc = 'Oil Open Parent Directory' } },
	},
	opts = {
		default_file_explorer = true,
		delete_to_trash = true,
		use_default_keymaps = false,
		columns = {},
		keymaps = {
			['g?'] = { 'actions.show_help', mode = 'n' },
			['<CR>'] = 'actions.select',
			['%'] = { 'actions.select', opts = { vertical = true } },
			['"'] = { 'actions.select', opts = { horizontal = true } },
			['P'] = 'actions.preview',
			['<C-r>'] = 'actions.refresh',
			['-'] = { 'actions.parent', mode = 'n' },
			['gx'] = 'actions.open_external',
			['.'] = { 'actions.toggle_hidden', mode = 'n' },
			q = 'actions.close',
		},
	},
}
