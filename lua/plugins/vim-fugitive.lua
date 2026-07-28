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
				for _, win in ipairs(vim.api.nvim_list_wins()) do
					local buf = vim.api.nvim_win_get_buf(win)
					if vim.bo[buf].filetype == 'fugitive' then
						vim.api.nvim_win_close(win, false)
						return
					end
				end
				vim.cmd('Git')
			end,
			mode = 'n',
			desc = 'Fugitive: Toggle Git status (summary window)',
		},
	},
	config = function()
		vim.g.fugitive_summary_format = '%d %s (%cr) <%an>'
	end,
}
