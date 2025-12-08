return {
	'nvim-mini/mini.files',
	lazy = false,
	version = false,
	config = function()
		require('mini.files').setup({
			mappings = {
				close = 'q',
				go_in = 'l',
				go_in_plus = '<cr>',
				go_out = 'h',
				go_out_plus = '-',
				mark_goto = "'",
				mark_set = 'm',
				reset = '<BS>',
				reveal_cwd = '@',
				show_help = 'g?',
				synchronize = 's',
				trim_left = '<',
				trim_right = '>',
			},
		})

		local map = vim.keymap.set
		map('n', '-', function()
			require('mini.files').open(vim.api.nvim_buf_get_name(0))
		end, { desc = 'Mini Files Open' })
	end,
}
