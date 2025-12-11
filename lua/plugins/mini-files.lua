return {
	'nvim-mini/mini.files',
	lazy = false,
	version = false,
	config = function()
		require('mini.files').setup({
			mappings = {
				close = 'q',
				go_in = 'l',
				go_out = 'h',
				reset = '<BS>',
				mark_set = 'm',
				mark_goto = "'",
				trim_left = '<',
				show_help = 'g?',
				reveal_cwd = '@',
				trim_right = '>',
				go_out_plus = '-',
				synchronize = '=',
				go_in_plus = '<cr>',
			},
		})

		local map = vim.keymap.set
		map('n', '-', function()
			require('mini.files').open(vim.api.nvim_buf_get_name(0))
		end, { desc = 'Mini Files Open' })
	end,
}
