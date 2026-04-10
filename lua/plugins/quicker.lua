return {
	'stevearc/quicker.nvim',
	ft = 'qf',
	---@module "quicker"
	---@type quicker.SetupOptions
	opts = {
		keys = {
			{
				'<',
				"<cmd>lua require('quicker').collapse()<CR>",
				desc = 'Collapse quickfix content',
			},
			{
				'>',
				"<cmd>lua require('quicker').expand()<CR>",
				desc = 'Expand quickfix content',
			},
		},
	},
	keys = {
		{
			'<c-q>',
			function()
				require('quicker').toggle({ focus = true, min_height = 15 })
			end,
			desc = 'Toggle Quickfix',
		},
	},
}
