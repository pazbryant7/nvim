local function has_git_folder()
	return vim.fn.isdirectory('.git') == 1
end

return {
	'sindrets/diffview.nvim',
	cond = has_git_folder,
	cmd = {
		'DiffviewOpen',
		'DiffviewClose',
		'DiffviewToggleFiles',
		'DiffviewFocusFiles',
	},
	opts = {
		use_icons = false,
		view = {
			merge_tool = {
				layout = 'diff3_mixed',
			},
		},
	},
	keys = {
		{
			'<c-g>',
			function()
				local view = require('diffview.lib').get_current_view()
				if view then
					vim.cmd('DiffviewClose')
				else
					vim.cmd('DiffviewOpen')
				end
			end,
			desc = 'Toggle Diffview',
		},
	},
}
