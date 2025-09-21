local leet_arg = 'leetcode.nvim'

return {
	'kawre/leetcode.nvim',
	cmd = 'Leet',
	build = ':TSUpdate html',
	lazy = leet_arg ~= vim.fn.argv(0, -1),
	dependencies = {
		'nvim-lua/plenary.nvim',
		'MunifTanjim/nui.nvim',
	},
	opts = {
		lang = 'typescript',
		arg = leet_arg,
		keys = {
			toggle = { 'q' }, ---@type string|string[]
			confirm = { '<CR>' }, ---@type string|string[]

			reset_testcases = 'r', ---@type string
			use_testcase = 'U', ---@type string
			focus_testcases = 'H', ---@type string
			focus_result = 'L', ---@type string
		},
	},
}
