local function has_git_folder()
	return vim.fn.isdirectory('.git') == 1
end

return {
	'tpope/vim-fugitive',
	cond = has_git_folder,
	cmd = { 'G', 'Git', 'Gclog', 'Gdiffsplit' },
	keys = {
		{
			'<c-g>',
			function()
				vim.cmd('Git')
			end,
			mode = 'n',
			desc = 'Fugitive: Git status (summary window)',
		},
		{
			'<leader>gs',
			function()
				vim.cmd('Git status --short')
			end,
			mode = 'n',
			desc = 'Fugitive: Git status short',
		},
		{
			'<leader>ga',
			function()
				vim.cmd('Git add %')
			end,
			mode = 'n',
			desc = 'Fugitive: Stage current file',
		},
		{
			'<leader>gA',
			function()
				vim.cmd('Git add -A')
			end,
			mode = 'n',
			desc = 'Fugitive: Stage all files',
		},
		{
			'<leader>gu',
			function()
				vim.cmd('Git restore --staged %')
			end,
			mode = 'n',
			desc = 'Fugitive: Unstage current file',
		},
		{
			'<leader>gc',
			function()
				vim.cmd('Git commit')
			end,
			mode = 'n',
			desc = 'Fugitive: Commit',
		},
		{
			'<leader>gl',
			function()
				vim.cmd('Gclog')
			end,
			mode = 'n',
			desc = 'Fugitive: Log (populate quickfix)',
		},
		{
			'<leader>gL',
			function()
				vim.cmd('Gclog -- %')
			end,
			mode = 'n',
			desc = 'Fugitive: Log for current file',
		},
	},

	init = function()
		vim.api.nvim_create_autocmd('BufReadPost', {
			pattern = 'COMMIT_EDITMSG',
			desc = 'Close split after commit',
			callback = function()
				vim.opt_local.spell = true
				vim.opt_local.spelllang = 'en_us'
				vim.opt_local.textwidth = 72
				vim.cmd('normal! gg')
			end,
		})
	end,

	config = function()
		vim.g.fugitive_summary_format = '%d %s (%cr) <%an>'
	end,
}
