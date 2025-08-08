return {
	'tpope/vim-fugitive',
	keys = {
		{ '<c-g>', ':tab Git <cr>', desc = 'Fugitive init' },
		{
			'<leader>gd',
			function()
				vim.cmd([[Gvdiffsplit!]])
				vim.notify('Resolving git conflicts', vim.log.levels.INFO, { title = 'Fugitive' })
			end,
			desc = 'Fugitive Diff Split',
		},
		{
			'<leader>go',
			function()
				vim.cmd([[diffget //2]])
				vim.notify('Git ours selected', vim.log.levels.INFO, { title = 'Fugitive' })
			end,
			desc = 'Fugitive Ours Changes',
		},
		{
			'<leader>gt',
			function()
				vim.cmd([[diffget //3]])
				vim.notify('Git theirs selected', vim.log.levels.INFO, { title = 'Fugitive' })
			end,
			desc = 'Fugitive Theirs Changes',
		},
	},
}
