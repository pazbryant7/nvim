return {
	'tpope/vim-fugitive',
	cmd = { 'G', 'Git', 'Gclog', 'Gdiffsplit' },
	cond = function()
		return vim.fn.isdirectory('.git') == 1
	end,
	keys = {
		{
			'<c-g>',
			function()
				vim.cmd('Git')
			end,
			mode = 'n',
			desc = 'Fugitive: Git status (summary window)',
		},
	},
	config = function()
		vim.g.fugitive_summary_format = '%d %s (%cr) <%an>'
	end,
}
