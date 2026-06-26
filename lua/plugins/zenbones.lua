return {
	'zenbones-theme/zenbones.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.zenbones_compat = 1

		if os.getenv('KATA') then
			vim.cmd('colorscheme zenbones')
		end
	end,
}
