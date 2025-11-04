return {
	'nvim-treesitter/nvim-treesitter',
	event = 'BufEnter',
	lazy = false,
	branch = 'main',
	build = ':TSUpdate',
	opts = {},
}
