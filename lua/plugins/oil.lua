return {
	'stevearc/oil.nvim',
	cmd = 'Oil',
	lazy = false,
	priority = 1000,
	opts = {
		default_file_explorer = true,

		keymaps = {
			['g?'] = { 'actions.show_help', mode = 'n' },
			['<CR>'] = 'actions.select',
			['q'] = { 'actions.close', mode = 'n' },
			['<c-l>'] = 'actions.refresh',
			['-'] = { 'actions.parent', mode = 'n' },
			['_'] = { 'actions.open_cwd', mode = 'n' },
			['gs'] = { 'actions.change_sort', mode = 'n' },
			['gx'] = 'actions.open_external',
			['.'] = { 'actions.toggle_hidden', mode = 'n' },
			['g\\'] = { 'actions.toggle_trash', mode = 'n' },
		},
		use_default_keymaps = false,
		skip_confirm_for_simple_edits = true,
		prompt_save_on_select_new_entry = false,
	},
	config = function(_, opts)
		require('oil').setup(opts)
		vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
	end,
}
