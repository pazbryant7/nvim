return {
	'nvim-mini/mini.files',
	lazy = false,
	version = false,
	config = function()
		require('mini.files').setup()

		local map = vim.keymap.set

		map('n', '-', function()
			require('mini.files').open(vim.api.nvim_buf_get_name(0))
		end, { desc = 'Mini Files Open' })
	end,
}
