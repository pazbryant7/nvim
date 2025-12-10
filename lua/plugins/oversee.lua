return {
	'stevearc/overseer.nvim',
	cmd = { 'OverseerRun', 'OverseerToggle' },
	---@module 'overseer'
	---@type overseer.SetupOpts
	opts = {},
	keys = {
		{ '<leader>or', '<cmd>OverseerRun<cr>', desc = 'Overseer run' },
		{ '<leader>ot', '<cmd>OverseerToggle<cr>', desc = 'Overseer toggle' },
	},
}
