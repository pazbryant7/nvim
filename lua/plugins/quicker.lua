return {
	'stevearc/quicker.nvim',
	ft = 'qf',
	---@module "quicker"
	---@type quicker.SetupOptions
	opts = {
		opts = {
			buflisted = false,
		},
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
	config = function(_, opts)
		require('quicker').setup(opts)
	end,
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
