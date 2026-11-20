return {
	'Wansmer/treesj',
	dependencies = { 'nvim-treesitter/nvim-treesitter' },
	cmd = { 'TSJJoin', 'TSJSplit', 'TSJToggle' },
	opts = {
		use_default_keymaps = false,
	},
	keys = {
    { '<leader>mm', '<cmd>TSJToggle<cr>', desc = 'TreeSJ: Toggle' },
  },
}
