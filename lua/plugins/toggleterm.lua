return {
	'akinsho/toggleterm.nvim',
	version = '*',
	opts = {
		size = function(term)
			if term.direction == 'horizontal' then
				return 15
			elseif term.direction == 'vertical' then
				return vim.o.columns * 0.4
			end
		end,
		direction = 'vertical',
		open_mapping = [[<c-\>]],
	},
	keys = {
		{ '<c-\\>', '<cmd>ToggleTerm<cr>', mode = { 'n', 't' }, desc = 'Toggle Terminal' },
		{
			'<leader>lg',
			function()
				local Terminal = require('toggleterm.terminal').Terminal
				local lazygit = Terminal:new({
					cmd = 'lazygit',
					direction = 'float',
				})
				lazygit:toggle()
			end,
			desc = 'LazyGit',
		},
	},
}
