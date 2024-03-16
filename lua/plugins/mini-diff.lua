return {
	'echasnovski/mini.diff',
	version = false,
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		require('mini.diff').setup()
	end,
	keys = {
		{
			'gs',
			function()
				local id = vim.api.nvim_get_current_buf()
				require('mini.diff').toggle(id)
			end,
			desc = 'Mini.Diff: Toggle it in current buffer',
		},
		{
			'gS',
			function()
				local id = vim.api.nvim_get_current_buf()
				require('mini.diff').toggle_overlay(id)
			end,
			desc = 'Mini.Diff: Toggle it in current buffer',
		},
	},
}
