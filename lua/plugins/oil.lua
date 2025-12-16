return {
	'stevearc/oil.nvim',
	cmd = 'Oil',
	lazy = false,
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		keymaps = {
			['g?'] = { 'actions.show_help', mode = 'n' },
			['<CR>'] = 'actions.select',
			['<C-v>'] = 'actions.preview',
			['q'] = { 'actions.close', mode = 'n' },
			['<C-l>'] = 'actions.refresh',
			['-'] = { 'actions.parent', mode = 'n' },
			['_'] = { 'actions.open_cwd', mode = 'n' },
			['`'] = { 'actions.cd', mode = 'n' },
			['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
			['gs'] = { 'actions.change_sort', mode = 'n' },
			['gx'] = 'actions.open_external',
			['.'] = { 'actions.toggle_hidden', mode = 'n' },
			['g\\'] = { 'actions.toggle_trash', mode = 'n' },
		},
		use_default_keymaps = false,
	},
	config = function(_, opts)
		require('oil').setup(opts)
		vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
	end,
}
