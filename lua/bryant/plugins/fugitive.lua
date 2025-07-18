return {
	'tpope/vim-fugitive',
	cmd = { 'Gclog', 'Git' },
	keys = {
    -- stylua: ignore start
		{ '<c-g>', ':tab Git <cr>', desc = 'Fugitive init' },
		{ '<leader>gl', ':Gclog <cr>', desc = 'Fugitive git log' },
	},
}
