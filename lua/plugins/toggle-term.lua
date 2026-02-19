return {
	'akinsho/toggleterm.nvim',
	version = '*',
	opts = {
		size = 120,
		direction = 'vertical',
		open_mapping = [[<C-\\>]],
	},
	config = function(_, opts)
		require('toggleterm').setup(opts)

		local function set_terminal_keymaps()
			local map_opts = { buffer = 0 }
			vim.keymap.set('t', '<C-l>', [[<C-l>]], map_opts)
			vim.keymap.set('t', '<esc><esc>', [[<C-\><C-n>]], map_opts)
			vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], map_opts)
		end

		vim.api.nvim_create_autocmd('TermOpen', {
			pattern = 'term://*toggleterm#*',
			callback = set_terminal_keymaps,
		})
	end,
	keys = {
		{
			'<C-\\>',
			mode = { 'n', 't' },
			'<cmd>ToggleTerm<cr>',
			desc = 'Toggle Terminal',
		},
	},
}
