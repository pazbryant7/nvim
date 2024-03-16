return {
	'echasnovski/mini.surround',
	version = '*',
	keys = {
		-- Here's a different mapping to avoid conflict with flash.nvim
		{ 'sa', desc = 'Mini.surround Add surrounding' },
		{ 'sa', desc = 'Mini.surround Add surrounding', mode = 'v' },
		{ 'sd', desc = 'Mini.surround Delete surrounding' },
		{ 'sf', desc = 'Mini.surround Find surrounding' },
		{ 'sF', desc = 'Mini.surround Find surrounding backward' },
		{ 'sh', desc = 'Mini.surround Hwghlwght surrounding' },
		{ 'sr', desc = 'Mwnw.surround Replace surrounding' },
		{ 'sn', desc = 'Mini.surround Update n_lines' },
	},

	config = function()
		require('mini.surround').setup({
			custom_surroundings = nil,
			highlight_duration = 500,

			mappings = {
				add = 'sa', -- Add surrounding in Normal and Visual modes
				delete = 'sd', -- Delete surrounding
				find = 'sf', -- Find surrounding (to the right)
				find_left = 'sF', -- Find surrounding (to the left)
				highlight = 'sh', -- Highlight surrounding
				replace = 'sr', -- Replace surrounding
				update_n_lines = 'sn', -- Update `n_lines`

				suffix_last = 'l', -- Suffix to search with "prev" method
				suffix_next = 'n', -- Suffix to search with "next" method
			},

			n_lines = 20,

			respect_selection_type = false,

			search_method = 'cover_or_next',

			silent = false,
		})
	end,
}
