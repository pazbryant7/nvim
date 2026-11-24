return {
	'folke/flash.nvim',
	opts = {
		search = { multi_window = false },
		jump = { jumplist = true },
		label = {
			uppercase = true,
			format = function(opts)
				return { { opts.match.label:upper(), opts.hl_group } }
			end,
		},
		highlight = { backdrop = false },
		modes = {
			char = {
				jump_labels = true,
				highlight = { backdrop = false },
			},
		},
	},
	config = function(_, opts)
		require('flash').setup(opts)

		local function set_highlights()
			vim.api.nvim_set_hl(0, 'FlashBackdrop', { link = 'None' })
			vim.api.nvim_set_hl(0, 'FlashLabel', { link = 'IncSearch' })
		end

		set_highlights()
		vim.api.nvim_create_autocmd('ColorScheme', {
			group = vim.api.nvim_create_augroup('FlashHighlights', { clear = true }),
			callback = set_highlights,
		})
	end,
	keys = {
		{
			's',
			function()
				require('flash').jump({ search = { multi_window = false } })
			end,
			mode = { 'n', 'x', 'o' },
			desc = 'Flash',
		},
		{
			'x',
			function()
				require('flash').jump({
					search = { multi_window = false },
					jump = { inclusive = true, offset = -1 },
				})
			end,
			mode = { 'x', 'o' },
			desc = 'Flash Next To',
		},
		{
			'S',
			function()
				local current_window = vim.api.nvim_get_current_win()
				require('flash').jump({
					search = {
						multi_window = true,
						exclude = {
							'notify',
							'cmp_menu',
							'noice',
							'flash_prompt',
							function(window)
								return window == current_window or not vim.api.nvim_win_get_config(window).focusable
							end,
						},
					},
				})
			end,
			mode = 'n',
			desc = 'Flash Other Windows',
		},
		{ 'f', mode = { 'n', 'x', 'o' }, desc = 'Flash Find' },
		{ 'F', mode = { 'n', 'x', 'o' }, desc = 'Flash Find Backward' },
		{ 't', mode = { 'n', 'x', 'o' }, desc = 'Flash Till' },
		{ 'T', mode = { 'n', 'x', 'o' }, desc = 'Flash Till Backward' },
	},
}
