return {
	'MeanderingProgrammer/render-markdown.nvim',
	ft = 'markdown',
	dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
	opts = {
		checkbox = {
			custom = {
				todo = { raw = '[~]', rendered = '󰰱 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
			},
		},
	},
}
