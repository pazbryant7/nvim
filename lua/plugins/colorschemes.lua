return {
	'Mofiqul/vscode.nvim',
	priority = 1000,
	opts = {
		style = 'dark',

		transparent = false,
		italic_comments = false,
		italic_inlayhints = false,
		underline_links = true,
		disable_nvimtree_bg = true,
		terminal_colors = true,
	},
	config = function(_, opts)
		require('vscode').setup(opts)
	end,
}
