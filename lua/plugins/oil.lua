return {
	'stevearc/oil.nvim',
	lazy = false,
	keys = {
		{ '-', '<CMD>Oil<CR>', { desc = 'Oil Open Parent Directory' } },
	},
	opts = {
		delete_to_trash = true,
		use_default_keymaps = false,
		default_file_explorer = true,
		skip_confirm_for_simple_edits = true,
		cleanup_delay_ms = 500,
		columns = {},
		keymaps = {
			['g?'] = { 'actions.show_help', mode = 'n' },
			['<CR>'] = 'actions.select',
			['P'] = 'actions.preview',
			['<C-r>'] = 'actions.refresh',
			['-'] = { 'actions.parent', mode = 'n' },
			['_'] = { 'actions.open_cwd', mode = 'n' },
			['gx'] = 'actions.open_external',
			['.'] = { 'actions.toggle_hidden', mode = 'n' },
			q = 'actions.close',
		},
	},
}
