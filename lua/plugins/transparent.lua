local enabled = false

return {
	'xiyaowong/transparent.nvim',
	cmd = { 'TransparentToggle', 'TransparentEnable' },
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
			'LineNrAbove',
			'LineNrBelow',
			'NonText',
			'SignColumn',
			'FoldColumn',
			'CursorLine',
			'CursorLineNr',
			'CursorColumn',
			'StatusLine',
			'StatusLineNC',
			'EndOfBuffer',
			'VertSplit',
			'Folded',
			'FoldedColumn',
			'Pmenu',
			'PmenuSel',
			'PmenuSbar',
			'PmenuThumb',
			'WildMenu',
		},
		extra_groups = {},
		exclude_groups = {},
		on_clear = function() end,
	},
	keys = {
		{
			'<leader>tt',
			function()
				if enabled then
					vim.cmd('TransparentDisable')
					vim.notify('Transparency disabled', vim.log.levels.INFO)
				else
					vim.cmd('TransparentEnable')
					vim.notify('Transparency enabled', vim.log.levels.INFO)
				end
				enabled = not enabled
			end,
			desc = 'Toggle transparency',
		},
	},
}
