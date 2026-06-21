return {
	'MeanderingProgrammer/render-markdown.nvim',
	ft = 'markdown',
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
	},
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		heading = {
			width = 'block',
			min_width = 80,
		},
		link = {
			enabled = false,
		},
	},
}
