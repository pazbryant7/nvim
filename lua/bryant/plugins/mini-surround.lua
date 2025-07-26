return {
	'echasnovski/mini.surround',
	version = '*',
	keys = {
		-- Here's a different mapping to avoid conflict with flash.nvim
		{ 'ys', desc = 'Mini.surround Add surrounding' },
		{ 'S', desc = 'Mini.surround Add surrounding', mode = 'v' },
		{ 'ds', desc = 'Mini.surround Delete surrounding' },
		{ 'yf', desc = 'Mini.surround Find surrounding' },
		{ 'yF', desc = 'Mini.surround Find surrounding backward' },
		{ 'yh', desc = 'Mini.surround Hwghlwght surrounding' },
		{ 'cs', desc = 'Mwnw.surround Replace surrounding' },
		{ 'yn', desc = 'Mini.surround Update n_lines' },
	},
	config = function()
		require('mini.surround').setup({
			custom_surroundings = nil,
			highlight_duration = 500,

			mappings = {
				add = 'ys', -- Add surrounding in Normal and Visual modes
				delete = 'ds', -- Delete surrounding
				find = 'yf', -- Find surrounding (to the right)
				find_left = 'yF', -- Find surrounding (to the left)
				highlight = 'yh', -- Highlight surrounding
				replace = 'cs', -- Replace surrounding
				update_n_lines = 'yn', -- Update `n_lines`

				suffix_last = 'l', -- Suffix to search with "prev" method
				suffix_next = 'n', -- Suffix to search with "next" method
			},

			n_lines = 20,

			respect_selection_type = false,

			search_method = 'cover_or_next',

			silent = false,
		})
		-- stylua: ignore start
		vim.keymap.del('x', 'ys', { desc = 'Remove surround for y key' })
		vim.keymap.set('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })

		-- Make special mapping for "add surrounding for line"
		vim.keymap.set('n', 'yss', 'ys_', { desc="Surronud full line", remap = true })
	end,
}
