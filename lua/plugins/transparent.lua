return {
	'xiyaowong/transparent.nvim',
	lazy = false,
	priority = 900,
	init = function()
		vim.g.transparent_enabled = true
	end,
	opts = {
		groups = {
			'Normal',
			'NormalNC',
			'Comment',
			'Constant',
			'Special',
			'Identifier',
			'Statement',
			'PreProc',
			'Type',
			'Underlined',
			'Todo',
			'String',
			'Function',
			'Conditional',
			'Repeat',
			'Operator',
			'Structure',
			'LineNr',
			'NonText',
			'SignColumn',
			'CursorLine',
			'CursorLineNr',
			'StatusLine',
			'StatusLineNC',
			'EndOfBuffer',
		},
		extra_groups = { 'FloatBorder', 'NormalFloat', 'Pmenu' },
		exclude_groups = {},
		on_clear = function() end,
	},
	config = function(_, opts)
		local transparent = require('transparent')
		transparent.setup(opts)
		transparent.clear()
	end,
	keys = {
		{
			'<leader>tt',
			function()
				vim.cmd('TransparentToggle')
				local state = vim.g.transparent_enabled and 'enabled' or 'disabled'
				vim.notify('Transparency ' .. state, vim.log.levels.INFO)
			end,
			desc = 'Transparent: Toggle transparency',
		},
	},
}
