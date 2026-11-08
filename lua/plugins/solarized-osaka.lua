return {
	'craftzdog/solarized-osaka.nvim',
	lazy = false,
	priority = 1100,
	config = function()
		require('solarized-osaka').setup({
			style = 'vivid',
			transparent = false,
		})
		vim.cmd.colorscheme('solarized-osaka')
	end,
}
